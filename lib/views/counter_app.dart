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
                  onPressed: () {},
                  child: const Text('Sign Up'),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Sign In'),
                )
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
