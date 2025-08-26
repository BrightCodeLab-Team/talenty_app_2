import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:talenty_app/core/constants/app_assets.dart';
import 'package:talenty_app/core/constants/colors.dart';
import 'package:talenty_app/ui/custom_widgets/buttons/custom_buttons.dart';
import 'package:talenty_app/ui/screens/candidate/chats/candidate_chat.dart';

class CandidateChatHelpScreen extends StatefulWidget {
  const CandidateChatHelpScreen({Key? key}) : super(key: key);

  @override
  State<CandidateChatHelpScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<CandidateChatHelpScreen> {
  final PageController _pageController = PageController();

  final List<Map<String, String>> _onboardingData = [
    {
      'image': AppAssets.candidateChath1,
      'title': 'Comunícate desde el chat',
      'description':
          'This is the description for the first onboarding screen. You can change this text and the image to suit your needs.',
      'buttonText': 'CONTINUE',
    },
    {
      'image': AppAssets.candidateChath2,
      'title': 'Another Onboarding Screen',
      'description':
          'Here is more information about the app features. Customize this description and the image as well.',
      'buttonText': 'NEXT',
    },
    {
      'image': AppAssets.candidateChath3,
      'title': 'Yet Another Screen',
      'description':
          'This section provides more details. The overall layout and styling will match your provided image.',
      'buttonText': 'START',
    },
    {
      'image': AppAssets.candidateChath4,
      'title': 'Yet Another Screen',
      'description':
          'This section provides more details. The overall layout and styling will match your provided image.',
      'buttonText': 'START',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Use your desired background color here
      body: SafeArea(
        child: PageView.builder(
          controller: _pageController,
          itemCount: _onboardingData.length,
          itemBuilder: (context, index) {
            final data = _onboardingData[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Onboarding Image
                  // NOTE: Replace 'assets/images/onboarding_image.png' with your actual image path.
                  // The provided image shows four distinct card-like sections, which this
                  // PageView structure facilitates.
                  Image.asset(data['image']!, scale: 4),

                  // Onboarding Title Text
                ],
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 30, left: 15, right: 15),
        child: CustomButton(
          backgroundColor: candidatoPrimaryColor,
          text: 'Entiendo',
          onTap: () {
            Get.to(CandidateChatScreen());
          },
        ),
      ),
    );
  }
}
