import 'package:anime_streaming_app/ui/widgets/button_widget.dart';
import 'package:anime_streaming_app/ui/widgets/input_widget.dart';
import 'package:anime_streaming_app/ui/widgets/layout_widget.dart';
import 'package:anime_streaming_app/ui/widgets/topbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutWidget(
      child: SingleChildScrollView(
        child: Column(
          children: [
            TopbarWidget(titleTopBar: 'Sign Up'),
            Gap(55),
            InputWidget(lable: 'Email', placeholder: 'example@example.com'),
            Gap(12),
            InputWidget(
              lable: 'Birthday',
              placeholder: 'DD/MM/YYYY',
              isDate: true,
              onDateSelected: (date) {},
            ),
            Gap(12),
            InputWidget(
              lable: 'Password',
              placeholder: 'password',
              isPassword: true,
            ),
            Gap(12),
            InputWidget(
              lable: 'Confirm Password',
              placeholder: 'password',
              isPassword: true,
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
            ButtonWidget(onPressed: () {}, text: 'Sign Up'),
          ],
        ),
      ),
    );
  }
}
