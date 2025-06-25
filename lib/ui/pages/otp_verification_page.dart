import 'package:anime_streaming_app/ui/pages/sign_in_page.dart';
import 'package:anime_streaming_app/ui/widgets/button_widget.dart';
import 'package:anime_streaming_app/ui/widgets/inline_text_link_widget.dart';
import 'package:anime_streaming_app/ui/widgets/layout_widget.dart';
import 'package:anime_streaming_app/ui/widgets/otp_box_widget.dart';
import 'package:anime_streaming_app/ui/widgets/topbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class OtpVerificationPage extends StatefulWidget {
  const OtpVerificationPage({super.key});

  @override
  State<OtpVerificationPage> createState() => _OtpVerificationPageState();
}

class _OtpVerificationPageState extends State<OtpVerificationPage> {
  final List<TextEditingController> controllers = List.generate(4, (index) {
    return TextEditingController();
  });
  final List<FocusNode> focusNodes = List.generate(4, (index) {
    return FocusNode();
  });

  @override
  void dispose() {
    for (final controller in controllers) {
      controller.dispose();
    }
    for (final focusNode in focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  Future<void> handleOTP() async {
    final otp = controllers.map((ctrl) => ctrl.text).join();
    if (otp.length < 4) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Please fill in all fields')));
      return;
    } else {
      Navigator.of(
        context,
      ).pushReplacement(MaterialPageRoute(builder: (context) => SignInPage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutWidget(
      child: SingleChildScrollView(
        child: Column(
          children: [
            TopbarWidget(
              titleTopBar: 'OTP Verification',
              onTap: () {
                Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (context) => SignInPage()));
              },
            ),
            Gap(36),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'We’ve just send you 4 digits code to your email ',
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 14,
                      color: Color(0xFF4C4E55),
                    ),
                  ),
                  TextSpan(
                    text: 'example@example.com',
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Gap(40),
            OtpBoxWidget(controllers: controllers, focusNodes: focusNodes),
            Gap(40),
            ButtonWidget(onPressed: handleOTP, text: 'Continue'),
            Gap(12),
            InlineTextLinkWidget(
              normalText: 'Didn\'t receive code?',
              linkText: 'Resend Code',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
