import 'package:anime_streaming_app/ui/pages/create_new_password_page.dart';
import 'package:anime_streaming_app/ui/pages/sign_in_page.dart';
import 'package:anime_streaming_app/ui/widgets/button_widget.dart';
import 'package:anime_streaming_app/ui/widgets/input_widget.dart';
import 'package:anime_streaming_app/ui/widgets/layout_widget.dart';
import 'package:anime_streaming_app/ui/widgets/topbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  Future<void> handleForgotPassword() async {
    if (emailController.text.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Please fill in all fields')));
      return;
    } else {
      Navigator.of(
        context,
      ).push(MaterialPageRoute(builder: (context) => CreateNewPasswordPage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutWidget(
      child: SingleChildScrollView(
        child: Column(
          children: [
            TopbarWidget(
              titleTopBar: 'Forgot Password',
              onTap: () {
                Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (context) => SignInPage()));
              },
            ),
            Gap(36),
            Text(
              'Input your linked email to your Movees account below, we’ll send you a link',
              style: GoogleFonts.plusJakartaSans(
                fontSize: 14,
                color: Color(0xFF4C4E55),
              ),
              textAlign: TextAlign.center,
            ),
            Gap(40),
            InputWidget(
              lable: 'Email',
              placeholder: 'example@email.com',
              controller: emailController,
            ),
            Gap(28),
            ButtonWidget(onPressed: handleForgotPassword, text: 'Continue'),
          ],
        ),
      ),
    );
  }
}
