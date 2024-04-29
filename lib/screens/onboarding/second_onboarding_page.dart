import 'package:book_stack/constants/custom_colors.dart';
import 'package:book_stack/constants/custom_string.dart';
import 'package:book_stack/utils/spacers.dart';
import 'package:flutter/material.dart';

class SecondOnboardingPage extends StatelessWidget {
  static const routeName = '/secondOnboardingScreen';
  const SecondOnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Stack(
            children: [
              Positioned.fill(
                child: Image.asset(
                  ConstantString.booksFlying,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    stops: const [0.5, 1],
                    colors: [
                      Colors.transparent,
                      Colors.white.withOpacity(1),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
            ],
          ),
        ),
        verticalSpacer(10),
        SizedBox(
          // height: 100,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AnimatedSwitcher(
                duration: Duration(milliseconds: 300),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.0),
                  child: Text(
                    'Discover Your\nNext Read',
                    // key: ValueKey<String>(titleTexts[_currentPage]),
                    // textAlign: TextAlign.center,
                    style: TextStyle(
                        height: 1.04,
                        fontWeight: FontWeight.w900,
                        fontSize: 48,
                        color: CustomColors.blackTextColor),
                  ),
                ),
              ),
              verticalSpacer(15),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                child: SizedBox(
                  width: double.infinity,
                  child: AnimatedSwitcher(
                    duration: Duration(milliseconds: 300),
                    child: Align(
                      // alignment: Alignment.topCenter,
                      child: Text(
                        'Unlock a world of recommendations tailored to your reading journey.',
                        // key: ValueKey<String>(subTitleTexts[_currentPage]),
                        // textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            height: 1.4,
                            color: CustomColors.greyTextColor),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
