import 'package:anime_streaming_app/ui/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AuthSocialButtonsWidget extends StatelessWidget {
  AuthSocialButtonsWidget({super.key});

  final List<Map<String, String>> authButtons = [
    {"title": "Continue With Google", "iconPath": "google"},
    {"title": "Continue With Apple", "iconPath": "apple"},
    {"title": "Continue With Facebook", "iconPath": "facebook"},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...List.generate(authButtons.length, (index) {
          return Column(
            children: [
              ButtonWidget(
                onPressed: () {},
                text: authButtons[index]["title"]!,
                buttonBackgroundColor: Colors.white,
                buttonBorderSideColor: Colors.black,
                buttonBorderWidth: 1,
                buttonTextColor: Colors.black,
                showIcon: true,
                iconPath: authButtons[index]["iconPath"]!,
              ),
              Gap(18),
            ],
          );
        }),
      ],
    );
  }
}
