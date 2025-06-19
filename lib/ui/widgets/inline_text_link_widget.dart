import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InlineTextLinkWidget extends StatelessWidget {
  final String normalText;
  final String linkText;
  final VoidCallback onTap;
  const InlineTextLinkWidget({
    super.key,
    required this.normalText,
    required this.linkText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: '$normalText ',
            style: GoogleFonts.plusJakartaSans(
              fontSize: 12,
              color: Color(0xFF4C4E55),
            ),
          ),
          TextSpan(
            text: linkText,
            style: GoogleFonts.plusJakartaSans(
              fontSize: 12,
              color: Color(0xFF19437d),
            ),
            recognizer: TapGestureRecognizer()..onTap = onTap,
          ),
        ],
      ),
    );
  }
}
