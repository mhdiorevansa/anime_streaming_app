import 'package:anime_streaming_app/ui/pages/forgot_password_page.dart';
import 'package:anime_streaming_app/ui/pages/sign_in_page.dart';
import 'package:anime_streaming_app/ui/widgets/button_widget.dart';
import 'package:anime_streaming_app/ui/widgets/input_widget.dart';
import 'package:anime_streaming_app/ui/widgets/layout_widget.dart';
import 'package:anime_streaming_app/ui/widgets/topbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateNewPasswordPage extends StatefulWidget {
  const CreateNewPasswordPage({super.key});

  @override
  State<CreateNewPasswordPage> createState() => _CreateNewPasswordPageState();
}

class _CreateNewPasswordPageState extends State<CreateNewPasswordPage> {
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> handleCreateNewPassword() async {
    if (passwordController.text.isEmpty ||
        confirmPasswordController.text.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Please fill in all fields')));
      return;
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Create new password successfully')),
      );
      await Future.delayed(Duration(seconds: 3));
      Navigator.of(
        // ignore: use_build_context_synchronously
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
              titleTopBar: 'Create New Password',
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => ForgotPasswordPage()),
                );
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
              lable: 'New Password',
              placeholder: 'Password',
              isPassword: true,
            ),
            Gap(12),
            InputWidget(
              lable: 'Confirm Password',
              placeholder: 'Password',
              isPassword: true,
            ),
            Gap(28),
            ButtonWidget(onPressed: () {}, text: 'Continue'),
          ],
        ),
      ),
    );
  }
}
