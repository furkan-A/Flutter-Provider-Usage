import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

enum UserState { loggedIn, notLoggedIn, loggingIn }

class AuthService extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? _user;
  UserState _state = UserState.notLoggedIn;

  UserState get state => _state;
  User? get user => _user;

  set state(UserState newState) {
    _state = newState;
    notifyListeners();
  }

  AuthService() {
    _auth.authStateChanges().listen(_authStateChanged);
  }

  void _authStateChanged(User? user) {
    if (user == null) {
      _user = null;
      state = UserState.notLoggedIn;
      debugPrint('User is currently signed out.');
    } else {
      _user = user;
      state = UserState.loggedIn;
      debugPrint('User signed in.');
    }
  }

  Future<User?> createUserWithEmailandPassword(
      String email, String password) async {
    // try {
    state = UserState.loggingIn;
    UserCredential _credential = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    User? _newUser = _credential.user;
    _user = _newUser;
    return _newUser;
    // }
    // catch (e) {
    //   state = UserState.notLoggedIn;
    //   debugPrint("found a error in create user: $e");
    //   return null;
    // }
  }

  Future<User?> signInUserWithEmailandPassword(
      String email, String password) async {
    try {
      state = UserState.loggingIn;
      UserCredential _credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? _loggedInUser = _credential.user;
      _user = _loggedInUser;
      return _loggedInUser;
    } catch (e) {
      state = UserState.notLoggedIn;
      debugPrint("found a error in sign in user: $e");
      return null;
    }
  }

  Future<bool> signOut() async {
    try {
      state = UserState.notLoggedIn;
      await _auth.signOut();
      _user = null;
      return true;
    } catch (e) {
      debugPrint("found a error in sign out: $e");
      return false;
    }
  }
}
