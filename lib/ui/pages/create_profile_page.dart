import 'package:anime_streaming_app/ui/pages/ready_to_watch_page.dart';
import 'package:anime_streaming_app/ui/pages/sign_up_page.dart';
import 'package:anime_streaming_app/ui/widgets/button_widget.dart';
import 'package:anime_streaming_app/ui/widgets/input_widget.dart';
import 'package:anime_streaming_app/ui/widgets/layout_widget.dart';
import 'package:anime_streaming_app/ui/widgets/topbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateProfilePage extends StatefulWidget {
  const CreateProfilePage({super.key});

  @override
  State<CreateProfilePage> createState() => _CreateProfilePageState();
}

class _CreateProfilePageState extends State<CreateProfilePage> {
  TextEditingController profileNameController = TextEditingController();
  List<bool> switches = [false, false];
  List<Map<String, String>> switchOptions = [
    {
      'title': 'Group Watch',
      'desc':
          'Watch with family and personal friends who are in different places',
    },
    {
      'title': 'Personal Watch',
      'desc': 'Watch with friends who are in the same place',
    },
  ];

  @override
  void dispose() {
    profileNameController.dispose();
    super.dispose();
  }

  Future<void> handleCreateProfile() async {
    if (profileNameController.text.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Please fill in all fields')));
      return;
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => ReadyToWatchPage()),
      );
    }
  }

  void toggleSwitch(index, value) {
    setState(() {
      switches[index] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutWidget(
      child: SingleChildScrollView(
        child: Column(
          children: [
            TopbarWidget(
              titleTopBar: 'Create Profile',
              onTap: () {
                Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (context) => SignUpPage()));
              },
            ),
            Gap(36),
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100 / 2),
                color: Color(0xFFF1F1F1),
              ),
              child: Icon(Icons.person, size: 80, color: Color(0xFFD9D9D9)),
            ),
            Gap(36),
            InputWidget(
              lable: 'Profile Name',
              placeholder: 'John Doe',
              controller: profileNameController,
            ),
            Gap(36),
            ...List.generate(switchOptions.length, (index) {
              return Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              switchOptions[index]['title']!,
                              style: GoogleFonts.plusJakartaSans(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                              textAlign: TextAlign.left,
                            ),
                            Gap(5),
                            Text(
                              switchOptions[index]['desc']!,
                              style: GoogleFonts.plusJakartaSans(fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Switch(
                              value: switches[index],
                              onChanged: (value) {
                                toggleSwitch(index, value);
                              },
                              activeColor: Colors.white,
                              activeTrackColor: Color(0xFF19437d),
                              inactiveThumbColor: Colors.white,
                              inactiveTrackColor: Color(0xFF282837),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Gap(16),
                ],
              );
            }),
            Gap(163),
            ButtonWidget(
              onPressed: handleCreateProfile,
              text: 'Create Profile',
            ),
          ],
        ),
      ),
    );
  }
}
