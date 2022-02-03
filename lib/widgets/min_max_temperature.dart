import 'package:flutter/material.dart';

class MinMaxTemperature extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          "Maksimum : " + 24.toString() + " ℃",
          style: const TextStyle(fontSize: 20),
        ),
        Text(
          "Minimum  : " + 12.toString() + " ℃",
          style: const TextStyle(fontSize: 20),
        ),
      ],
    );
  }
}
