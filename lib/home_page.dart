import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_deneme/auth_service.dart';
import 'package:provider_deneme/counter.dart';
import 'package:provider_deneme/counter_app.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final initialValue = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: const Text("Go to Counter App"),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => MultiProvider(
                      providers: [
                        ChangeNotifierProvider(
                          create: (_) => Counter(initialValue),
                        ),
                        ChangeNotifierProvider(
                          create: (_) => AuthService(),
                        ),
                      ],
                      child: const CounterApp(),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
