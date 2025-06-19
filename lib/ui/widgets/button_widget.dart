import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final bool isFullWidth;
  final Color buttonBackgroundColor;
  final Color buttonBorderSideColor;
  final double buttonBorderWidth;
  final Color buttonTextColor;
  final bool showIcon;
  final String iconPath;

  const ButtonWidget({
    super.key,
    required this.onPressed,
    this.isFullWidth = true,
    required this.text,
    this.buttonBackgroundColor = const Color(0xFF19437d),
    this.buttonBorderSideColor = Colors.transparent,
    this.buttonBorderWidth = 0,
    this.buttonTextColor = Colors.white,
    this.showIcon = false,
    this.iconPath = '',
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        minimumSize: isFullWidth ? Size.fromHeight(52) : null,
        backgroundColor: buttonBackgroundColor,
        foregroundColor: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        side: BorderSide(
          color: buttonBorderSideColor,
          width: buttonBorderWidth,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (showIcon) ...[
            Image.asset('assets/images/$iconPath.png', width: 24, height: 24),
            Gap(8),
          ],
          Text(
            text,
            style: GoogleFonts.plusJakartaSans(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: buttonTextColor,
            ),
          ),
        ],
      ),
    );
  }
}
