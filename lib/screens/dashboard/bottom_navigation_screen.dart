import 'package:book_stack/constants/custom_colors.dart';
import 'package:book_stack/constants/custom_string.dart';
import 'package:book_stack/screens/dashboard/home_screen.dart';
import 'package:book_stack/screens/more/more_screen.dart';
import 'package:book_stack/screens/my_books/my_books_screen.dart';
import 'package:book_stack/screens/search/search_screen.dart';
import 'package:book_stack/utils/spacers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomNavigationScreen extends StatefulWidget {
  static const routeName = '/BottomNavigationScreen';

  const BottomNavigationScreen({super.key});

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> screenLists = [
      HomeScreen(
        onSearchTap: () {
          setState(() {
            index = 1;
          });
        },
      ),
      const SearchScreen(),
      const MyBooksScreen(),
      const MoreScreen(),
    ];
    return PopScope(
      // },
      canPop: false,
      child: SafeArea(
        top: false,
        child: Scaffold(
          // resizeToAvoidBottomInset: false,

          bottomNavigationBar: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Divider(
                color: CustomColors.dividerGreyColor,
              ),
              BottomAppBar(
                // height: 80,
                // shadowColor: Colors.black.withOpacity(0.33),
                elevation: 0,
                padding: EdgeInsets.zero,
                // height: 70,

                color: CustomColors.whiteColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            index = 0;
                          });
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              FontAwesomeIcons.house,
                              size: 20,
                              color: index == 0
                                  ? CustomColors.mainBlueColor
                                  : CustomColors.greyColor,
                            ),
                            // SvgPicture.asset(
                            //   index == 0
                            //       ? ConstantString.chatFilled
                            //       : ConstantString.chatOutlined,
                            //   height: 20,
                            //   // color: index == 0
                            //   //     ? CustomColors.orangeColor
                            //   //     : CustomColors.greyColor,
                            // ),
                            verticalSpacer(4),
                            Text(
                              "Home",
                              style: TextStyle(
                                  color: index == 0
                                      ? CustomColors.mainBlueColor
                                      : CustomColors.hintTextColor,
                                  fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          index = 1;
                        });
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            FontAwesomeIcons.magnifyingGlass,
                            size: 20,
                            color: index == 1
                                ? CustomColors.mainBlueColor
                                : CustomColors.greyColor,
                          ),

                          // SvgPicture.asset(
                          //   index == 1
                          //       ? ConstantString.starFilled
                          //       : ConstantString.starOutlined,
                          //   height: 20,
                          //   // color: index == 1
                          //   //     ? CustomColors.orangeColor
                          //   //     : CustomColors.greyColor,
                          // ),
                          verticalSpacer(4),
                          Text(
                            "Search",
                            style: TextStyle(
                                color: index == 1
                                    ? CustomColors.mainBlueColor
                                    : CustomColors.hintTextColor,
                                fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          index = 2;
                        });
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            index == 2
                                ? FontAwesomeIcons.bookOpen
                                : FontAwesomeIcons.book,

                            // FontAwesomeIcons.bookOpen,
                            size: 20,
                            color: index == 2
                                ? CustomColors.mainBlueColor
                                : CustomColors.greyColor,
                          ),
                          // Icon(
                          //   index == 2 ? Icons.people : Icons.people_outline,
                          //   size: 25,
                          //   color: index == 2
                          //       ? CustomColors.mainBlueColor
                          //       : CustomColors.hintTextColor,
                          // ),
                          // SvgPicture.asset(
                          //   index == 2
                          //       ? ConstantString.peopleFilled
                          //       : ConstantString.peopleOutlined,
                          //   height: 20,
                          //   // color: index == 2
                          //   //     ? CustomColors.orangeColor
                          //   //     : CustomColors.greyColor,
                          // ),
                          verticalSpacer(4),
                          Text(
                            "My Books",
                            style: TextStyle(
                                color: index == 2
                                    ? CustomColors.mainBlueColor
                                    : CustomColors.hintTextColor,
                                fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          index = 3;
                        });
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            index == 3
                                ? FontAwesomeIcons.solidUser
                                : FontAwesomeIcons.user,
                            // FontAwesomeIcons.solidUser,
                            size: 20,
                            color: index == 3
                                ? CustomColors.mainBlueColor
                                : CustomColors.greyColor,
                          ),

                          // SvgPicture.asset(
                          //   index == 3
                          //       ? ConstantString.marketplaceFilled
                          //       : ConstantString.marketplaceOutlined,
                          //   height: 20,
                          // ),
                          verticalSpacer(4),
                          Text(
                            "Profile",
                            style: TextStyle(
                                color: index == 3
                                    ? CustomColors.mainBlueColor
                                    : CustomColors.hintTextColor,
                                fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.only(right: 10.0),
                    //   child: GestureDetector(
                    //     onTap: () {
                    //       setState(() {
                    //         index = 4;
                    //       });
                    //     },
                    //     child: Column(
                    //       mainAxisSize: MainAxisSize.min,
                    //       children: [
                    //         SvgPicture.asset(
                    //           ConstantString.moreIcon,
                    //           height: 24,
                    //           color: index == 4
                    //               ? CustomColors.orangeColor
                    //               : CustomColors.greyColor,
                    //         ),
                    //         verticalSpacer(4),
                    //         Text(
                    //           "More",
                    //           style: TextStyle(
                    //               color: index == 4
                    //                   ? CustomColors.orangeColor
                    //                   : CustomColors.greyColor,
                    //               fontSize: 13),
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ],
          ),
          body: screenLists[index],
        ),
      ),
    );
  }
}
