import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_deneme/auth_service.dart';
import 'package:provider_deneme/display_counter.dart';
import 'package:provider_deneme/floating_action_button.dart';

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
        return const Scaffold(
          body: Center(
            child: Text('If you want to use app please log in'),
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
