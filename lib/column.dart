import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_deneme/counter.dart';

class MyColumn extends StatelessWidget {
  const MyColumn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var myCounter = Provider.of<Counter>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          myCounter.counter.toString(),
          style: const TextStyle(fontSize: 32),
        ),
      ],
    );
  }
}
