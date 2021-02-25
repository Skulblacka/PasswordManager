import 'dart:collection';

import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:flutterappap/res/public_cons.dart';
import 'package:flutterappap/services/client/changeListener.dart';

class AppWriteClient {
  Client client = new Client();
  Account account;
  Avatars avatars;

  AppWriteClient() {
    client
        .setEndpoint(AppWriteConnections.hostname)
        .setProject(AppWriteConnections.project_id)
        .setSelfSigned();

    account = new Account(client);
    avatars = new Avatars(client);
  }

  bool login() {}

  Future<Response> createAppWriteSession(String email, String password, AuthState authState) async {
    Future<Response> f = account.createSession(email: email, password: password);

    f.then((value){
      authState.setSessionID(value.data.values.toList()[0]);
      authState.setAuthState(true);
    }).onError((error, stackTrace){
      authState.setAuthState(false);
    });
  }


 Future<Response> deletAllAccountSession( AuthState authState){
    Future<Response> future = account.deleteSession(sessionId: authState.getSessionID());

    future.then((value) {
      authState.setAuthState(false);
    }).onError((error, stackTrace) {
      authState.setAuthState(false);
    });
  }
}
