import 'package:flutter/material.dart';

class LayoutWidgets extends StatelessWidget {
  final Widget child;
  const LayoutWidgets({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white, body: child);
  }
}
