import 'package:vault_client/vault_client.dart';

late Client client;

void initServerpodClient() {
  client = Client(
    'http://10.0.2.2:8080/',
  );
}
