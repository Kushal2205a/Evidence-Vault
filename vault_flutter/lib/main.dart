import 'package:flutter/material.dart';
import 'serverpod_client.dart';

void main() {
  initServerpodClient();
  runApp(const VaultApp());

}

class VaultApp extends StatelessWidget{
  const VaultApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp( title: "Evidence Vault" , home: HomeScreen() ,
      theme: ThemeData(colorScheme: ColorScheme.dark()),);
  }
}

class HomeScreen extends StatelessWidget{
  const HomeScreen({super.key});

  Future<void> _serverCall(BuildContext context) async{
    try {
      final res = await client.greeting.hello('Kushal');
      final msg = (res as dynamic).message ?? res.toString();

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Server : $msg")));
      }
    }catch(e){
      if(context.mounted){
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Server : $e")));}}

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Home"), actions: [IconButton(tooltip: 'Ping Backend', onPressed: ()=> _serverCall(context), icon: const Icon(Icons.cloud)), ], )
    );
    throw UnimplementedError();
  }
}


