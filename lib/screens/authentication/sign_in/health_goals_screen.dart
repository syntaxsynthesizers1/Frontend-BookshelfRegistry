import 'dart:async';

import 'package:book_stack/constants/custom_colors.dart';
import 'package:book_stack/screens/authentication/sign_in/hobbies_screen.dart';
import 'package:book_stack/utils/spacers.dart';
import 'package:book_stack/widgets/authentication_screen.dart';
import 'package:book_stack/widgets/custom_textfield.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class HealthGoalScreen extends StatefulWidget {
  static const routeName = '/HealthGoalScreen';
  const HealthGoalScreen({super.key});

  @override
  State<HealthGoalScreen> createState() => _HealthGoalScreenState();
}

class _HealthGoalScreenState extends State<HealthGoalScreen> {
  final TextEditingController phoneController = TextEditingController();
  int currentIndex = 0;
  bool isLoading = false;
  final pinController = TextEditingController();
  int checkedIndex = 0;
  // var isFirstChecked = false;
  // var isSecondChecked = false;
  // var isThirdChecked = false;
  // var isFourthChecked = false;
  // var isFifthChecked = false;

  bool buttonActive = false;

  Timer? countdownTimer;
  Duration myDuration = const Duration(minutes: 3);
  String reason = "";
  bool isCountdownActive = false;

  @override
  Widget build(BuildContext context) {
    return AuthFormWidget(
      onBackTap: () {
        Navigator.canPop(context) ? Navigator.pop(context) : null;
      },
      showHealthProgress: true,
      buttonText: "Continue",
      progress: 2,
      topPadding: 30,
      isButtonLoading: isLoading,
      onButtonTap: () async {
        setState(() {
          isLoading = true;
        });
        // await Future.delayed(const Duration(seconds: 2));

        setState(() {
          isLoading = false;
        });
        Navigator.pushNamed(context, HobbiesScreen.routeName);
      },
      title: "Choose your health goal",
      subTitle:
          "What are the mental health goals you will like to achieve on this platform?",
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                GoalWidget(
                  title: "I want to manage anxiety",
                  isCurrentIndex: currentIndex == 1,
                  onTap: () {
                    setState(() {
                      checkedIndex = 1;
                    });
                  },
                  value: checkedIndex == 1,
                  onChanged: (newValue) {
                    setState(() {
                      checkedIndex = 1;
                    });
                  },
                ),
                GoalWidget(
                  title: "I want to build my self-confidence",
                  isCurrentIndex: currentIndex == 2,
                  onTap: () {
                    setState(() {
                      checkedIndex = 2;
                    });
                  },
                  value: checkedIndex == 2,
                  onChanged: (newValue) {
                    setState(() {
                      checkedIndex = 2;
                    });
                  },
                ),
                GoalWidget(
                  title: "I want to cope with depression",
                  isCurrentIndex: currentIndex == 3,
                  onTap: () {
                    setState(() {
                      checkedIndex = 3;
                    });
                  },
                  value: checkedIndex == 3,
                  onChanged: (newValue) {
                    setState(() {
                      checkedIndex = 3;
                    });
                  },
                ),
                GoalWidget(
                  title: "I want to manage anxiety",
                  isCurrentIndex: currentIndex == 4,
                  onTap: () {
                    setState(() {
                      checkedIndex = 4;
                    });
                  },
                  value: checkedIndex == 4,
                  onChanged: (newValue) {
                    setState(() {
                      checkedIndex = 4;
                    });
                  },
                ),
                GoalWidget(
                  title: "I want to manage anxiety",
                  isCurrentIndex: currentIndex == 5,
                  onTap: () {
                    setState(() {
                      checkedIndex = 5;
                    });
                  },
                  value: checkedIndex == 5,
                  onChanged: (newValue) {
                    setState(() {
                      checkedIndex = 5;
                    });
                  },
                ),
              ],
            ),
            verticalSpacer(30),
            const Text(
              "Other",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: CustomColors.labelTextColor),
            ),
            verticalSpacer(10),
            customMultiTextField(
              "streetName",
              hintText: "Tell us about it",
              onChanged: (value) {
                setState(() {
                  reason = value!;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

class GoalWidget extends StatefulWidget {
  final String title;
  final bool isCurrentIndex;
  final void Function()? onTap;

  final bool value;
  final ValueChanged<bool?> onChanged;
  const GoalWidget({
    super.key,
    required this.title,
    required this.isCurrentIndex,
    this.onTap,
    required this.value,
    required this.onChanged,
  });

  @override
  State<GoalWidget> createState() => _GoalWidgetState();
}

class _GoalWidgetState extends State<GoalWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          height: 52,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            border: Border.all(
              color: CustomColors.lightGreyColor,
            ),
          ),
          child: Row(
            children: [
              InkWell(
                onTap: () {
                  widget.onChanged(!widget.value);
                },
                child: Container(
                  width: 19,
                  height: 19,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: CustomColors.hintTextColor,
                      width: 2,
                    ),
                    color: widget.value
                        ? CustomColors.limeGreenColor
                        : Colors.transparent,
                  ),
                  child: widget.value
                      ? const Icon(
                          Icons.check,
                          size: 16,
                          color: Colors.white,
                        )
                      : null,
                ),
              ),
              horizontalSpacer(10),
              Text(
                widget.title,
                style: const TextStyle(
                  fontSize: 14,
                  color: CustomColors.checkTextColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
