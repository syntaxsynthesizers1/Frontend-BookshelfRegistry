import 'package:book_stack/constants/custom_colors.dart';
import 'package:book_stack/constants/custom_string.dart';
import 'package:book_stack/data/api_config/local_cache.dart';
import 'package:book_stack/locator.dart';
import 'package:book_stack/utils/spacers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  const CustomAppBar({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final userData = locator<LocalCache>().getUserData();
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "Hi ${userData.firstName}!",
                      style: const TextStyle(
                        color: CustomColors.mainBlueColor,
                        fontWeight: FontWeight.w800,
                        fontSize: 24,
                      ),
                    ),
                  ],
                ),
                const Text(
                  "Keep Exploring",
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  height: 40.h,
                  width: 40.w,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(
                        ConstantString.profilePic,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                horizontalSpacer(10),
                // Text(
                //   title,
                //   style: const TextStyle(
                //       fontWeight: FontWeight.w600,
                //       fontSize: 23,
                //       color: CustomColors.blackTextColor),
                // ),
              ],
            ),
            // Row(
            //   children: [
            //     SvgPicture.asset(ConstantString.searchIcon),
            //     horizontalSpacer(20),
            //     SvgPicture.asset(ConstantString.notificationBell),
            //     horizontalSpacer(20),
            //   ],
            // ),
          ],
        ),
        verticalSpacer(5),
        // const Divider(
        //   color: CustomColors.dividerGreyColor,
        // ),
        // verticalSpacer(15),
      ],
    );
  }
}
