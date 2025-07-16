import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:talenty_app/core/constants/app_assets.dart';
import 'package:talenty_app/core/constants/colors.dart';
import 'package:talenty_app/core/constants/text_style.dart';
import 'package:talenty_app/ui/custom_widgets/buttons/custom_buttons.dart';
import 'package:talenty_app/ui/custom_widgets/header/header.dart';
import '../auth/login_screen/login_screen.dart';
import 'onboarding_view_model.dart';
import 'onboarding_widget.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingCandidatoScreenState();
}

class _OnboardingCandidatoScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int currentPage = 0;

  void nextPage(int pages) {
    if (!_pageController.hasClients) return;
    if (currentPage < pages - 1) {
      _pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<OnBoardingViewModel>(
      builder:
          (context, model, child) => Scaffold(
            //
            //Body
            //
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    40.verticalSpace,
                    Header(),
                    40.verticalSpace,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,

                      children: [
                        SizedBox(
                          height: 386,
                          child: PageView.builder(
                            controller: _pageController,
                            itemCount: model.pagesData.length,
                            onPageChanged:
                                (i) => setState(() => currentPage = i),
                            itemBuilder: (_, i) {
                              final p = model.pagesData[i];
                              return OnBoardingWidget(
                                title: (p['titleKey'] as String).tr,
                                description: (p['descKey'] as String).tr,
                                image: p['image'],
                                sizedBoxHeight:
                                    (p['sizedBoxHeight'] as num).toDouble(),
                                imageWidth: (p['imageWidth'] as num).toDouble(),
                                imageHeight:
                                    (p['imageHeight'] as num).toDouble(),
                              );
                            },
                          ),
                        ),
                        30.verticalSpace,
                        SizedBox(
                          height: 20,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                              model.pagesData.length,
                              (index) => AnimatedContainer(
                                duration: Duration(milliseconds: 300),
                                margin: EdgeInsets.symmetric(horizontal: 4),
                                width: currentPage == index ? 12 : 8,
                                height: currentPage == index ? 12 : 8,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color:
                                      currentPage == index
                                          ? primaryColor
                                          : Color(0xFF8E96A8),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    30.verticalSpace,
                    if (currentPage != 3)
                      GestureDetector(
                        onTap: () {
                          nextPage(model.pagesData.length);
                        },
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          width: 160,
                          height: 35,
                          decoration: BoxDecoration(
                            border: Border.all(color: primaryColor, width: 2.5),
                            borderRadius: BorderRadius.circular(16.r),
                            color: Color(0xFFFAF0C9),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                'Swipe',
                                style: style20B.copyWith(
                                  color: primaryColor,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Image.asset(
                                AppAssets.swipeArrow,
                                width: 25,
                                height: 23,
                              ),
                            ],
                          ),
                        ),
                      ),

                    100.verticalSpace,
                  ],
                ),
              ),
            ),

            bottomNavigationBar:
                currentPage == 3
                    ? Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15.0,
                        vertical: 15,
                      ),
                      child: CustomButton(
                        text: 'btn_continue'.tr,
                        onTap:
                            () => Get.to(
                              () => LoginScreen(
                                isCadidate:
                                    model.role == UserRole.candidate
                                        ? true
                                        : false,
                              ),
                            ),
                        backgroundColor: primaryColor,
                      ),
                    )
                    : SizedBox(),
          ),
    );
  }
}
