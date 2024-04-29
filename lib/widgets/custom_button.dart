import 'package:flutter/material.dart';

import '../constants/custom_colors.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final String? routeName;
  final Color? textColor;
  final bool isLoading;
  final bool isBoldTitle;
  final bool borderButton;
  final double? width, height;
  final void Function()? onTap;
  final Color? buttonColor;
  const CustomButton(
      {super.key,
      required this.title,
      this.routeName,
      this.onTap,
      this.isLoading = false,
      this.isBoldTitle = true,
      this.borderButton = false,
      this.width,
      this.height,
      this.buttonColor,
      this.textColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () {},
      child: Container(
        height: height ?? 52,
        width: width ?? double.infinity,
        decoration: BoxDecoration(
            color: borderButton
                ? CustomColors.blueColor.withOpacity(0.1)
                : onTap == null
                    ? CustomColors.greyColor
                    : buttonColor ?? CustomColors.blueColor,
            borderRadius: BorderRadius.circular(27.5),
            boxShadow: borderButton
                ? null
                : [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
            border: borderButton
                ? Border.all(
                    color: CustomColors.blueColor,
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
              : Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                    color: borderButton
                        ? CustomColors.blueColor
                        : textColor ?? CustomColors.whiteColor,
                  ),
                ),
        ),
      ),
    );
  }
}




// import 'package:flutter/material.dart';

// import '../constants/custom_colors.dart';

// class CustomButton extends StatelessWidget {
//   final String title;
//   final String? routeName;
//   final Color? textColor;
//   final bool isLoading;
//   final bool isBoldTitle;
//   final bool borderButton;
//   final double? width, height;
//   final void Function()? onTap;
//   final Color? buttonColor;
//   const CustomButton(
//       {super.key,
//       required this.title,
//       this.routeName,
//       this.onTap,
//       this.isLoading = false,
//       this.isBoldTitle = true,
//       this.borderButton = false,
//       this.width,
//       this.height,
//       this.buttonColor,
//       this.textColor});

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap ?? () {},
//       child: Container(
//         height: height ?? 55,
//         width: width ?? double.infinity,
//         decoration: BoxDecoration(
//             color: borderButton
//                 ? CustomColors.orangeColor.withOpacity(0.2)
//                 : onTap == null
//                     ? CustomColors.greyColor
//                     : buttonColor ?? CustomColors.orangeColor,
//             borderRadius: BorderRadius.circular(27.5),
//             border: borderButton
//                 ? Border.all(
//                     color: CustomColors.orangeColor,
//                   )
//                 : null),
//         child: Center(
//           child: isLoading
//               ? const SizedBox(
//                   height: 30,
//                   width: 30,
//                   child: CircularProgressIndicator(
//                     color: CustomColors.whiteColor,
//                   ),
//                 )
//               : Text(
//                   title,
//                   style: TextStyle(
//                     fontWeight: FontWeight.w700,
//                     fontSize: 14,
//                     color: borderButton
//                         ? CustomColors.orangeColor
//                         : textColor ?? CustomColors.whiteColor,
//                   ),
//                 ),
//         ),
//       ),
//     );
//   }
// }
