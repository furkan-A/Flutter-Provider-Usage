import 'package:flutter/material.dart';

class LocationWidget extends StatelessWidget {
  final String selectedCity;

  LocationWidget({required this.selectedCity});

  @override
  Widget build(BuildContext context) {
    return const Text(
      "Ankara",
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
    );
  }
}
