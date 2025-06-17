import 'package:flutter/material.dart';

class LayoutWidget extends StatelessWidget {
  final Widget child;
  const LayoutWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 60),
        child: child,
      ),
    );
  }
}
