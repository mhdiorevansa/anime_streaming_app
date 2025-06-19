import 'package:flutter/material.dart';

class LayoutWidget extends StatelessWidget {
  final Widget child;
  const LayoutWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(left: 24, right: 24, top: 60, bottom: 10),
        child: child,
      ),
    );
  }
}
