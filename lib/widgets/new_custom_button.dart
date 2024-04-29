import 'package:flutter/material.dart';

import '../constants/custom_colors.dart';

class NewCustomButton extends StatelessWidget {
  final String title;
  final String? routeName;
  final Color? textColor;
  final bool isLoading;
  final bool isBoldTitle;
  final bool borderButton;
  final double? width, height;
  final void Function()? onTap;
  final Color? buttonColor;
  final double fontSize;
  const NewCustomButton(
      {super.key,
      required this.title,
      this.routeName,
      this.onTap,
      this.isLoading = false,
      this.isBoldTitle = true,
      this.borderButton = false,
      this.fontSize = 14,
      this.width,
      this.height,
      this.buttonColor,
      this.textColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ??
          () {
            // Navigator.pushNamed(context, routeName!);
            // Navigator.canPop(context) ? Navigator.pop(context) : null;
          },
      child: Stack(
        children: [
          Container(
            height: height != null ? (height! + 6) : 56,
            width: width ?? double.infinity,
            decoration: BoxDecoration(
                color: CustomColors.deepMainBlueColor,

                // borderButton
                borderRadius: BorderRadius.circular(15),
                border: borderButton
                    ? Border.all(
                        color: CustomColors.orangeColor,
                      )
                    : null),
          ),
          Container(
            height: height ?? 50,
            width: width ?? double.infinity,
            decoration: BoxDecoration(
                color: CustomColors.mainBlueColor,

                // borderButton
                //     ? CustomColors.orangeColor.withOpacity(0.2)
                //     : onTap == null
                //         ? CustomColors.greyColor
                //         : buttonColor ?? CustomColors.orangeColor,
                borderRadius: BorderRadius.circular(15),
                border: borderButton
                    ? Border.all(
                        color: CustomColors.orangeColor,
                      )
                    : null),
            child: Center(
              child: isLoading
                  ? const SizedBox(
                      height: 30,
                      width: 30,
                      child: CircularProgressIndicator(
                        color: CustomColors.whiteColor,
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.only(top: 6.0),
                      child: Text(
                        title,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: fontSize,
                          color: borderButton
                              ? CustomColors.orangeColor
                              : textColor ?? CustomColors.whiteColor,
                        ),
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
