import 'package:flutter/widgets.dart';

class AuthState with ChangeNotifier{
  bool _authState = false;
  String _sessionID = "";

  bool getAuthState(){
    return _authState;
  }

  void setAuthState(bool state){
    _authState = state;
    this.notifyListeners();
  }

  String getSessionID(){
    return _sessionID;
  }

  void setSessionID(String time){
    _sessionID = time;
    this.notifyListeners();
  }
}