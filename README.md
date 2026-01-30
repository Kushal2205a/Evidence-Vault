# Proof Butler (Flutter + Serverpod)

Proof Butler creates a proof record for an image and later verifies whether another image file is identical to the original.

It works by computing a SHA-256 hash of the image bytes. If the bytes change (edit, crop, re-save, compression), the hash changes and verification returns MISMATCH.

## Features

### Create Proof
- Pick an image from the device
- Compute SHA-256 locally on the phone
- Generate a small thumbnail for recognition
- Save a proof record to a Serverpod backend
- Copy Proof ID and details for sharing

### My Proofs
- Lists all saved proof records from the backend
- Shows title, thumbnail, created timestamp, and short hash preview
- Copy proof details to clipboard

### Verify Proof
- Select a proof record
- Pick an image to verify (for example, a received copy)
- App computes SHA-256 locally
- Backend compares stored hash vs computed hash and returns MATCH or MISMATCH

## How it works (technical)

- Hashing: `crypto` package (SHA-256 over raw file bytes)
- File selection: `file_picker` (image only)
- Thumbnail: `image` package
    - Decode selected image
    - Resize to width 96px
    - Encode as JPEG (quality 70)
    - Stored as bytes in the database (not full image storage)
- Backend: Serverpod endpoints
    - createEvidenceRecord(hash, title, thumbnailBytes)
    - listEvidenceRecords()
    - verifyEvidence(id, computedHash)

Note: A mismatch means the file differs. It does not prove intent. Any byte-level change can cause mismatch.

## Project structure (typical Serverpod)

- vault_flutter/  Flutter app
- vault_server/   Serverpod backend
- vault_client/   Generated client + shared models

## Run locally

### Prerequisites
- Flutter SDK
- Serverpod CLI
- Docker

### 1) Start the backend
From the server folder:

    cd vault_server
    docker compose up -d
    dart run bin/main.dart --apply-migrations

You should see the server running without errors.

### 2) Run the Flutter app
From the Flutter folder:

    cd vault_flutter
    flutter pub get
    flutter run

## Client URL notes (emulator vs real phone)

The Serverpod base URL is configured in `serverpod_client.dart`.

- Android emulator uses host loopback as: 10.0.2.2
- Real phone must use your laptop IP on the same Wi-Fi (example: http://192.168.1.50:8080/)

## Known limitations (MVP)
- No authentication (all users on the same backend share records)
- No full image storage (only thumbnail bytes)
- Verification compares hashes sent from client (server-side hashing will be added later)

