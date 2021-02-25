import 'package:flutter/material.dart';
import 'package:flutterappap/services/client/app_write_client.dart';
import 'package:flutterappap/services/client/changeListener.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  AppWriteClient client = new AppWriteClient();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome"),
      ),
      backgroundColor: Colors.pink,
      body: ElevatedButton(
        onPressed: ()async{
          final AuthState authState = Provider.of<AuthState>(context,listen: false);
          await client.deletAllAccountSession(authState);
        },
      ),
    );
  }
}
