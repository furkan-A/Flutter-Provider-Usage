import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_deneme/models/counter.dart';
import 'package:provider_deneme/services/auth_service.dart';

class DisplayCounter extends StatelessWidget {
  const DisplayCounter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var myCounter = Provider.of<Counter>(context);
    var myAuth = Provider.of<AuthService>(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text('Welcome ${myAuth.user!.email}'),
        const SizedBox(height: 24),
        Text(
          myCounter.counter.toString(),
          style: const TextStyle(fontSize: 32),
        ),
        const SizedBox(height: 24),
        ElevatedButton(
            onPressed: () {
              // first usage
              myAuth.signOut();
              // second usage
              // WARNING : context.read method is not usable in build methods
              // but it is usable in onpressed methods
              // context.read<AuthService>().signOut();
            },
            child: const Text('Sign Out'))
      ],
    );
  }
}
