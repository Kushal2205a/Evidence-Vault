/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

abstract class EvidenceRecord implements _i1.SerializableModel {
  EvidenceRecord._({
    this.id,
    required this.hash,
    this.note,
    required this.createdAt,
  });

  factory EvidenceRecord({
    int? id,
    required String hash,
    String? note,
    required DateTime createdAt,
  }) = _EvidenceRecordImpl;

  factory EvidenceRecord.fromJson(Map<String, dynamic> jsonSerialization) {
    return EvidenceRecord(
      id: jsonSerialization['id'] as int?,
      hash: jsonSerialization['hash'] as String,
      note: jsonSerialization['note'] as String?,
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String hash;

  String? note;

  DateTime createdAt;

  /// Returns a shallow copy of this [EvidenceRecord]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  EvidenceRecord copyWith({
    int? id,
    String? hash,
    String? note,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'EvidenceRecord',
      if (id != null) 'id': id,
      'hash': hash,
      if (note != null) 'note': note,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _EvidenceRecordImpl extends EvidenceRecord {
  _EvidenceRecordImpl({
    int? id,
    required String hash,
    String? note,
    required DateTime createdAt,
  }) : super._(
         id: id,
         hash: hash,
         note: note,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [EvidenceRecord]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  EvidenceRecord copyWith({
    Object? id = _Undefined,
    String? hash,
    Object? note = _Undefined,
    DateTime? createdAt,
  }) {
    return EvidenceRecord(
      id: id is int? ? id : this.id,
      hash: hash ?? this.hash,
      note: note is String? ? note : this.note,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
