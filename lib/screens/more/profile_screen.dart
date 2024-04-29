import 'package:book_stack/constants/custom_colors.dart';
import 'package:book_stack/constants/custom_string.dart';
import 'package:book_stack/data/api_config/local_cache.dart';
import 'package:book_stack/locator.dart';
import 'package:book_stack/utils/spacers.dart';
import 'package:book_stack/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ProfileScreen extends StatefulWidget {
  static const routeName = '/ProfileScreen';
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int selectedIndex = 0;
  bool showAmount = true;
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    final userData = locator<LocalCache>().getUserData();
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top + 20,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  right: 20,
                  left: 20,
                ),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.canPop(context)
                            ? Navigator.of(context).pop()
                            : null;
                      },
                      child: SvgPicture.asset(
                        ConstantString.back,
                      ),
                    ),
                  ],
                ),
              ),
              verticalSpacer(25),
              const Padding(
                padding: EdgeInsets.only(
                  right: 20,
                  left: 20,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Profile",
                          style: TextStyle(
                              fontWeight: FontWeight.w800, fontSize: 20),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  right: 20,
                  left: 20,
                ),
                child: Column(
                  children: [
                    verticalSpacer(25),
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          height: 50,
                          width: 50,
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
                        Positioned(
                          bottom: -10,
                          right: -15,
                          child: Container(
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: CustomColors.orangeColor),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: SvgPicture.asset(
                                ConstantString.editIcon,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    verticalSpacer(10),
                    Text(
                      "${userData.firstName} ${userData.lastName}",
                      style: const TextStyle(
                          fontWeight: FontWeight.w700, fontSize: 18),
                    ),
                    verticalSpacer(6),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Image.asset(
                        //   ConstantString.arrowFoward,
                        //   height: 13,
                        // ),
                        horizontalSpacer(10),
                        const Text(
                          "(+234) 8123362731",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: CustomColors.greyTextColor),
                        ),
                      ],
                    ),
                    verticalSpacer(40),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  right: 20,
                  left: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "First Name",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 14.sp,
                        color: CustomColors.blackColor,
                      ),
                    ),
                    verticalSpacer(10),
                    customTextField2(
                      "firstName",
                      initialValue: userData.firstName,
                      readOnly: true,
                    ),
                    verticalSpacer(35),
                    Text(
                      "Last Name",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 14.sp,
                        color: CustomColors.blackColor,
                      ),
                    ),
                    verticalSpacer(10),
                    customTextField2(
                      "lastName",
                      initialValue: userData.lastName,
                      readOnly: true,
                    ),
                    verticalSpacer(35),
                    Text(
                      "Email Address",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 14.sp,
                        color: CustomColors.blackColor,
                      ),
                    ),
                    verticalSpacer(10),
                    customTextField2(
                      "email",
                      initialValue: userData.email,
                      readOnly: true,
                    ),
                    verticalSpacer(20),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
