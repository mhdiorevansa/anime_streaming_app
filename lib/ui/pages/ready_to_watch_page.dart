import 'package:anime_streaming_app/ui/widgets/button_widget.dart';
import 'package:anime_streaming_app/ui/widgets/layout_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class ReadyToWatchPage extends StatelessWidget {
  const ReadyToWatchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutWidget(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  'assets/images/ready_to_watch.jpeg',
                  width: 327,
                  height: 383,
                  fit: BoxFit.cover,
                ),
              ),
              Gap(48),
              Text(
                "Are you ready to watch anime?",
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Gap(16),
              Text(
                "You can watch any anime you want, whenever you want, without any ads and without any limitations. Start watching now!",
                style: GoogleFonts.plusJakartaSans(fontSize: 14),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: ButtonWidget(onPressed: () {}, text: "Start Watching"),
          ),
        ],
      ),
    );
  }
}
