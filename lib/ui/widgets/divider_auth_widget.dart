import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DividerAuthWidget extends StatelessWidget {
  const DividerAuthWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 146,
          child: Divider(thickness: 1, color: Color(0xFFD9D9D9)),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            'or',
            style: GoogleFonts.plusJakartaSans(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          width: 146,
          child: Divider(thickness: 1, color: Color(0xFFD9D9D9)),
        ),
      ],
    );
  }
}
