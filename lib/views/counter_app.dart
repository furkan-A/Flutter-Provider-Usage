import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_deneme/services/auth_service.dart';
import 'package:provider_deneme/widgets/display_counter.dart';
import 'package:provider_deneme/widgets/floating_action_button.dart';

class CounterApp extends StatelessWidget {
  const CounterApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final myAuth = Provider.of<AuthService>(context);

    switch (myAuth.state) {
      case UserState.loggingIn:
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );

      case UserState.notLoggedIn:
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('If you want to use app please log in'),
                const SizedBox(height: 16),
                ElevatedButton(
                  child: const Text('Sign Up'),
                  onPressed: () async {
                    // this is a basic sign up method it has not a signup screen
                    var email = "provider@auth2.com";
                    var password = "secretpassword";

                    // I moved the try catch block to inform the user
                    // where the error is.
                    try {
                      await myAuth.createUserWithEmailandPassword(
                          email, password);
                    } on FirebaseAuthException catch (e) {
                      myAuth.state = UserState.notLoggedIn;
                      if (e.code == 'email-already-in-use') {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                                'The account already exists for that email.'),
                          ),
                        );
                      }
                    } catch (e) {
                      myAuth.state = UserState.notLoggedIn;
                      debugPrint("found a error in create user: $e");
                    }
                  },
                ),
                ElevatedButton(
                  child: const Text('Sign In'),
                  onPressed: () async {
                    var email = "provider@auth.com";
                    var password = "secretpassword";
                    await myAuth.signInUserWithEmailandPassword(
                        email, password);
                  },
                ),
              ],
            ),
          ),
        );

      case UserState.loggedIn:
        return Scaffold(
          appBar: AppBar(
            title: const Text("Counter app with provider"),
          ),
          body: const Center(
            child: DisplayCounter(),
          ),
          floatingActionButton: const MyFloatingActionButtons(),
        );
    }
  }
}
