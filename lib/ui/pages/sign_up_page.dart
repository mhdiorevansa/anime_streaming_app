import 'package:anime_streaming_app/ui/pages/sign_in_page.dart';
import 'package:anime_streaming_app/ui/widgets/button_widget.dart';
import 'package:anime_streaming_app/ui/widgets/inline_text_link_widget.dart';
import 'package:anime_streaming_app/ui/widgets/input_widget.dart';
import 'package:anime_streaming_app/ui/widgets/layout_widget.dart';
import 'package:anime_streaming_app/ui/widgets/topbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final emailController = TextEditingController();
  final birthdayController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    birthdayController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> handleSignUp() async {
    if (emailController.text.isEmpty ||
        passwordController.text.isEmpty ||
        birthdayController.text.isEmpty ||
        passwordController.text.isEmpty ||
        confirmPasswordController.text.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Please fill in all fields')));
      return;
    }
    // continue with sign up logic
  }

  @override
  Widget build(BuildContext context) {
    return LayoutWidget(
      child: SingleChildScrollView(
        child: Column(
          children: [
            TopbarWidget(
              titleTopBar: 'Sign Up',
              onTap: () {
                Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (context) => SignInPage()));
              },
            ),
            Gap(55),
            InputWidget(
              lable: 'Email',
              placeholder: 'example@example.com',
              controller: emailController,
            ),
            Gap(12),
            InputWidget(
              lable: 'Birthday',
              placeholder: 'DD/MM/YYYY',
              isDate: true,
              onDateSelected: (date) {},
              controller: birthdayController,
            ),
            Gap(12),
            InputWidget(
              lable: 'Password',
              placeholder: 'password',
              isPassword: true,
              controller: passwordController,
            ),
            Gap(12),
            InputWidget(
              lable: 'Confirm Password',
              placeholder: 'password',
              isPassword: true,
              controller: confirmPasswordController,
            ),
            Gap(30),
            Text(
              'By click the agree and continue button, you’re agree to Movees’ Terms and Service and acknlowledge the Privacy and Policy',
              style: GoogleFonts.plusJakartaSans(
                fontSize: 11,
                color: Color(0xFF96979B),
              ),
            ),
            Gap(12),
            ButtonWidget(onPressed: handleSignUp, text: 'Continue'),
            Gap(43),
            InlineTextLinkWidget(
              normalText: 'Already have an account?',
              linkText: 'Sign In',
              onTap: () {
                Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (context) => SignInPage()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
