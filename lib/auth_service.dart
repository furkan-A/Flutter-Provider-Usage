import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

enum UserState { loggedIn, notLoggedIn, loggingIn }

class AuthService extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  UserState _state = UserState.notLoggedIn;

  UserState get state => _state;

  set state(UserState newState) {
    _state = newState;
    notifyListeners();
  }

  AuthService() {
    _auth.authStateChanges().listen(_authStateChanged);
  }

  void _authStateChanged(User? user) {
    if (user == null) {
      state = UserState.notLoggedIn;
      debugPrint('User is currently signed out.');
    } else {
      state = UserState.loggedIn;
      debugPrint('User signed in.');
    }
  }

  Future<User?> createUserWithEmailandPassword(
      String email, String password) async {
    try {
      state = UserState.loggingIn;
      UserCredential _credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? _newUser = _credential.user;
      return _newUser;
    } catch (e) {
      state = UserState.notLoggedIn;
      debugPrint("found a error: $e");
      return null;
    }
  }

  Future<User?> signInUserWithEmailandPassword(
      String email, String password) async {
    try {
      state = UserState.loggingIn;
      UserCredential _credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? _user = _credential.user;
      return _user;
    } catch (e) {
      state = UserState.notLoggedIn;
      debugPrint("found a error: $e");
      return null;
    }
  }
}
