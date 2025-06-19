import 'package:anime_streaming_app/ui/pages/sign_up_page.dart';
import 'package:anime_streaming_app/ui/widgets/auth_social_buttons_widget.dart';
import 'package:anime_streaming_app/ui/widgets/button_widget.dart';
import 'package:anime_streaming_app/ui/widgets/divider_auth_widget.dart';
import 'package:anime_streaming_app/ui/widgets/inline_text_link_widget.dart';
import 'package:anime_streaming_app/ui/widgets/input_widget.dart';
import 'package:anime_streaming_app/ui/widgets/layout_widget.dart';
import 'package:anime_streaming_app/ui/widgets/topbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutWidget(
      child: SingleChildScrollView(
        child: Column(
          children: [
            TopbarWidget(titleTopBar: 'Sign In'),
            Gap(55),
            InputWidget(lable: 'Email', placeholder: 'example@example.com'),
            Gap(12),
            InputWidget(
              lable: 'Password',
              placeholder: 'password',
              isPassword: true,
            ),
            Gap(28),
            ButtonWidget(onPressed: () {}, text: 'Sign In'),
            Gap(20),
            Text(
              'Forgot Password',
              style: GoogleFonts.plusJakartaSans(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Color(0xFF19437d),
              ),
            ),
            Gap(28),
            DividerAuthWidget(),
            Gap(28),
            AuthSocialButtonsWidget(),
            Gap(43),
            InlineTextLinkWidget(
              normalText: 'Don\'t have an account?',
              linkText: 'Sign Up',
              onTap: () {
                Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (context) => SignUpPage()));
              },
            ),
            Gap(20),
          ],
        ),
      ),
    );
  }
}
