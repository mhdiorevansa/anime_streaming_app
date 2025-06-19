import 'package:anime_streaming_app/ui/pages/sign_in_page.dart';
import 'package:anime_streaming_app/ui/widgets/button_widget.dart';
import 'package:anime_streaming_app/ui/widgets/layout_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  PageController pageController = PageController();
  int currentPage = 0;

  List<Map<String, String>> onBoardingData = [
    {
      "title": "Welcome to Anime Streaming App",
      "image": "assets/images/onboarding_screen_1.jpg",
      "desc":
          "Anime Streaming App is a streaming service for anime and manga fans. We provides a wide variety of anime shows and movies to watch for free.",
    },
    {
      "title": "Explore Our Collection of Anime",
      "image": "assets/images/onboarding_screen_2.jpg",
      "desc":
          "Explore our collection of anime shows and movies. We have a wide variety of titles to choose from, including action, comedy, drama, and more.",
    },
    {
      "title": "Enjoy Your Anime Experience",
      "image": "assets/images/onboarding_screen_3.jpg",
      "desc":
          "Enjoy an immersive anime experience with high-quality streaming and a personalized watchlist. Discover new anime and keep track of your favorites effortlessly.",
    },
  ];

  void nextPage() {
    if (currentPage < onBoardingData.length - 1) {
      pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.of(
        context,
      ).push(MaterialPageRoute(builder: (context) => SignInPage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutWidget(
      child: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: pageController,
              itemCount: onBoardingData.length,
              onPageChanged: (index) {
                setState(() {
                  currentPage = index;
                });
              },
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        onBoardingData[index]["image"]!,
                        width: 327,
                        height: 383,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Gap(48),
                    Text(
                      onBoardingData[index]["title"]!,
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Gap(16),
                    Text(
                      onBoardingData[index]["desc"]!,
                      style: GoogleFonts.plusJakartaSans(fontSize: 14),
                      textAlign: TextAlign.center,
                    ),
                    Gap(30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(onBoardingData.length, (index) {
                        return AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          width: currentPage == index ? 16 : 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: currentPage == index
                                ? Color(0xFF19437d)
                                : Colors.grey,
                            borderRadius: BorderRadius.circular(4),
                          ),
                        );
                      }),
                    ),
                    Gap(30),
                    ButtonWidget(
                      onPressed: () {
                        nextPage();
                      },
                      text: currentPage == onBoardingData.length - 1
                          ? "Get Started"
                          : "Next",
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
