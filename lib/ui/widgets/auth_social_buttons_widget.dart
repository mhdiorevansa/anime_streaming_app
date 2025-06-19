import 'package:anime_streaming_app/ui/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AuthSocialButtonsWidget extends StatelessWidget {
  const AuthSocialButtonsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ButtonWidget(
          onPressed: () {},
          text: 'Continue With Google',
          buttonBackgroundColor: Colors.white,
          buttonBorderSideColor: Colors.black,
          buttonBorderWidth: 1,
          buttonTextColor: Colors.black,
          showIcon: true,
          iconPath: 'google',
        ),
        Gap(18),
        ButtonWidget(
          onPressed: () {},
          text: 'Continue With Apple',
          buttonBackgroundColor: Colors.white,
          buttonBorderSideColor: Colors.black,
          buttonBorderWidth: 1,
          buttonTextColor: Colors.black,
          showIcon: true,
          iconPath: 'apple',
        ),
        Gap(18),
        ButtonWidget(
          onPressed: () {},
          text: 'Continue With Facebook',
          buttonBackgroundColor: Colors.white,
          buttonBorderSideColor: Colors.black,
          buttonBorderWidth: 1,
          buttonTextColor: Colors.black,
          showIcon: true,
          iconPath: 'facebook',
        ),
      ],
    );
  }
}
