import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:appwrite/appwrite.dart';
import 'package:flutterappap/pages/home.dart';
import 'package:flutterappap/pages/login.dart';
import 'package:flutterappap/pages/sign_up.dart';
import 'package:flutterappap/services/client/changeListener.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (final BuildContext context){
              return AuthState();
            })
      ],
      child: TestApp()));
}

class TestApp extends StatefulWidget {
  @override
  OnStart createState() => OnStart();
}

class OnStart extends State<TestApp> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthState>(
      builder: (final BuildContext context, final AuthState authState,final Widget widget){
        return MaterialApp(
          //initialRoute: "/login",
          routes: {
            '/login': (context) => Login(),
            '/signup': (context) => SignUp(),
            '/home': (context) => Home()
          },home: authState.getAuthState() ? Home() : Login(),
        );
      },
    );
  }

  void _login() async {
    // Client client = Client();
    //
    // client
    //         .setEndpoint('https://192.168.42.113/v1') // Your Appwrite Endpoint //192.168.42.113
    //         .setProject('602d81c0aa024').setSelfSigned(); // Your project ID
    //
    //
    // // Register User
    // Account account = Account(client);
    // Future<Response> session = account.createSession(email: "test@test.com", password: "123456");
    // session.then((value) => null).onError((error, stackTrace) => null)
    // print(session);
    // Response user = await account
    //     .create(
    //     email: 'm2e@appwrite.io',
    //     password: 'password',
    //     name: 'My Name'
    // );
    //account.createSession(email: "test@test.com", password: "123456");
  }
}
