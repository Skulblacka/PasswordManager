import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:appwrite/appwrite.dart';
import 'package:flutterappap/services/client/app_write_client.dart';
import 'package:flutterappap/services/client/changeListener.dart';
import 'package:provider/provider.dart';


class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  AppWriteClient client;
  _LoginState(){
    client = new AppWriteClient();
  }

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: usernameController,
                cursorColor: Colors.black,
                decoration: InputDecoration(
                    labelStyle: TextStyle(color: Colors.black),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.indigo)),
                    labelText: 'Enter your email address',
                    border: OutlineInputBorder()),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: passwordController,
                cursorColor: Colors.black,
                obscureText: true,
                decoration: InputDecoration(
                    labelStyle: TextStyle(color: Colors.black),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.indigo)),
                    labelText: 'Enter your password',
                    border: OutlineInputBorder()),
              ),
            ),
            ElevatedButton(
                onPressed: () async {
                  final AuthState authState = Provider.of<AuthState>(context,listen: false);
                  await client.createAppWriteSession(usernameController.text, passwordController.text,authState);
                },
                child: Text("Login")),
            ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, "/signup"),
                child: Text("Are u new? Go to SignUp"))
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
