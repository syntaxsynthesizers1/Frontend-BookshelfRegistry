import 'package:book_stack/screens/authentication/sign_in/sign_up_screen.dart';
import 'package:book_stack/screens/authentication/sign_up/sign_in_screen.dart';
import 'package:book_stack/screens/onboarding/first_onboarding_page.dart';
import 'package:book_stack/screens/onboarding/second_onboarding_page.dart';
import 'package:book_stack/widgets/custom_border_button.dart';
import 'package:book_stack/widgets/custom_button.dart';
import 'package:book_stack/widgets/new_custom_button.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../constants/custom_colors.dart';
import '../../utils/spacers.dart';

class OnboardingPageViewScreen extends StatefulWidget {
  static const routeName = '/OnboardingPageViewScreen';
  const OnboardingPageViewScreen({super.key});

  @override
  State<OnboardingPageViewScreen> createState() =>
      _OnboardingPageViewScreenState();
}

class _OnboardingPageViewScreenState extends State<OnboardingPageViewScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  final List<String> titleTexts = [
    'Welcome to your mental wellness buddy',
    'You get to express yourself anonymously',
    'Start a conversation with our AI chatbot & Counsellors',
    // 'Get started',
  ];
  final List<String> subTitleTexts = [
    'Discover a safe & supportive space for your mental wellness journey.',
    'Create a pseudonym & express yourself authentically without revealing personal details.',
    'Engage in confidential chat sessions with our AI chatbot & chosen counsellor to receive support.',
    // 'With Bongo you can send money to other people with safety.',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBodyBehindAppBar: true,
      // extendBody: true,
      backgroundColor: CustomColors.whiteColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0.0),
        child: SafeArea(
          top: false,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.end,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // verticalSpacer(10),
              // const GetHelpRow(),
              Expanded(
                child: PageView(
                  controller: _pageController,
                  onPageChanged: (int page) {
                    setState(() {
                      _currentPage = page;
                    });
                  },
                  children: const [
                    FirstOnboardingPage(),
                    SecondOnboardingPage(),
                  ],
                ),
              ),

              verticalSpacer(40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: SmoothPageIndicator(
                    controller: _pageController,
                    count: 2,
                    effect: const ExpandingDotsEffect(
                        activeDotColor: CustomColors.mainBlueColor,
                        dotColor: CustomColors.lightGreyColor,
                        dotHeight: 7,
                        dotWidth: 7,
                        spacing: 5,
                        expansionFactor: 3,
                        strokeWidth: 100),
                  ),
                ),
              ),
              verticalSpacer(25),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Row(
                  children: [
                    Expanded(
                      child: NewCustomButton(
                          title: "Create Account",
                          onTap: () {
                            Navigator.pushNamed(
                                context, SignUpScreen.routeName);
                          }),
                    ),
                    horizontalSpacer(20),
                    Expanded(
                      child: CustomBorderButton(
                          title: "Login",
                          onTap: () {
                            Navigator.pushNamed(
                                context, SignInScreen.routeName);
                          }),
                    ),
                  ],
                ),
              ),
              // verticalSpacer(15),

              verticalSpacer(20),
            ],
          ),
        ),
      ),
    );
  }
}
