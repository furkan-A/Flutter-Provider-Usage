import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_deneme/models/counter.dart';

class MyFloatingActionButtons extends StatelessWidget {
  const MyFloatingActionButtons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint("floating action button build");
    // I gave listen parameter : false, because I dont need rebuild to
    // MyFloatingActionButtons class' build method
    // Thus, the program will run more efficiently
    var myCounter = Provider.of<Counter>(context, listen: false);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        FloatingActionButton(
          heroTag: "1",
          onPressed: myCounter.increase,
          child: const Icon(Icons.add),
        ),
        const SizedBox(height: 5),
        FloatingActionButton(
          heroTag: "2",
          // we only give a referance for onPressed argument
          // if we put () brackets after "myCounter.decrease" :
          // it must be call the function
          // but now if Floating action button on pressed then call the
          // decrease function
          onPressed: myCounter.decrease,
          child: const Icon(Icons.remove),
        ),
      ],
    );
  }
}
