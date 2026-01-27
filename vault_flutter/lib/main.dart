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
        appBar: AppBar(title: const Text("Home"), actions: [IconButton(tooltip: 'Ping Backend', onPressed: ()=> _serverCall(context), icon: const Icon(Icons.cloud)), ], ),
        body: Padding(padding: const EdgeInsets.all(16),
          child: Column(

            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(icon: const Icon(Icons.add),
                       onPressed: () => {
                          Navigator.push(context, MaterialPageRoute(builder: (_) => const CreateEvidenceScreen()))
                       },
                       label: const  Text("Add Evidence")
                ),
              ),

              const SizedBox(height: 12),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                    onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const VerifyEvidenceScreen())),
                    label: const Text("Verify Evidence"),
                    icon: Icon(Icons.verified),
                ),

              ),

              const SizedBox(height : 12),

              TextButton(
                onPressed: () => {
                                    Navigator.push(context, MaterialPageRoute(builder: (_) => const EvidenceListScreen()))
                },
                child: const Text("Evidence List(placeholder)")
              ,)



            ],
          ),
        ),
    );




  }
}

class EvidenceListScreen  extends StatelessWidget{
  const EvidenceListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Evidence List")),
      body: ListView(
        children: const [
          ListTile(title : Text('Placeholder rec 1') , subtitle: Text("hash : ..."),),
          ListTile(title : Text('Placeholder rec 2') , subtitle: Text("hash : ..."),)


        ],
      )

    );
  }
}

class VerifyEvidenceScreen  extends StatelessWidget{
  const VerifyEvidenceScreen({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: const Text("Verify Evidence"),) ,
      body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: const [
              Align(alignment: Alignment.centerLeft, child: Text('Pick record : (placeholder)')),
              SizedBox(height: 8,),
              Align(alignment: Alignment.centerLeft, child: Text('Pick file : (placeholder)')),
              SizedBox(height: 16),
              SizedBox(width: double.infinity, child: ElevatedButton(onPressed: null, child: Text('Verify (placeholder)'))),
              Align(alignment: Alignment.centerLeft, child: Text("Result: (placeholder)"),)

            ],
          ),
      ) ,

    );
  }
}
class CreateEvidenceScreen extends StatefulWidget {
  const CreateEvidenceScreen({super.key});

  @override
  State<CreateEvidenceScreen> createState() => _CreateEvidenceScreenState();
}
class _CreateEvidenceScreenState  extends State<CreateEvidenceScreen>{
  final _noteCtrl = TextEditingController();


  @override
  void dispose()
  {
    _noteCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Create Evidence")),
      body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const Align(alignment: Alignment.centerLeft,
                          child: Text("File not found")
              ),

              const SizedBox(height:8),

              TextField(
                controller: _noteCtrl,
                decoration: const InputDecoration(labelText: "Note"),
              ),

              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(onPressed: ()=> {},
                       label: Text("Save (placeholder)")),
              )



            ],
          ),
      )


    );
  }


}


