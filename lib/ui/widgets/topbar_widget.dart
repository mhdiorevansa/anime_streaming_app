import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TopbarWidget extends StatelessWidget {
  final String titleTopBar;
  final void Function() onTap;
  const TopbarWidget({
    super.key,
    required this.titleTopBar,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: GestureDetector(
            onTap: onTap,
            child: Icon(Icons.arrow_back, color: Colors.black),
          ),
        ),
        Center(
          child: Text(
            titleTopBar,
            style: GoogleFonts.plusJakartaSans(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
