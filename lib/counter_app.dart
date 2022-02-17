import 'package:flutter/material.dart';
import 'package:provider_deneme/column.dart';
import 'package:provider_deneme/floating_action_button.dart';

class CounterApp extends StatelessWidget {
  const CounterApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter app with provider"),
      ),
      body: const Center(
        child: MyColumn(),
      ),
      floatingActionButton: const MyFloatingActionButtons(),
    );
  }
}
