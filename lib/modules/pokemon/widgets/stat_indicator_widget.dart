import 'package:flutter/material.dart';

class StatIndicatorWidget extends StatelessWidget {
  final int value;
  const StatIndicatorWidget({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return Text('$value');
  }
}
