import 'package:book_stack/constants/custom_colors.dart';
import 'package:book_stack/data/api_config/local_cache.dart';
import 'package:book_stack/locator.dart';
import 'package:book_stack/utils/currency_symbol.dart';
import 'package:book_stack/utils/spacers.dart';
import 'package:book_stack/widgets/empty_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WalletScreen extends StatefulWidget {
  static const routeName = '/wallet_screen';
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<WalletScreen> {
  final nameTextEditingController = TextEditingController();
  final phoneTextEditingController = TextEditingController();
  final addressTextEditingController = TextEditingController();

  String? accountDetails;

  @override
  Widget build(BuildContext context) {
    // final userData = locator<LocalCache>().getUserData();
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios),
            color: Colors.black,
          ),
          titleSpacing: 0,
          title: const Text(
            "Wallet",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
          ),
          // centerTitle: true,
          elevation: 5,
          shadowColor: CustomColors.greyBgColor,
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 25.w),
              child: Row(
                children: [
                  // userData.accountDetails == null
                  accountDetails == null
                      ? const SizedBox.shrink()
                      : Row(
                          children: [
                            const Icon(
                              Icons.add_circle_outline_outlined,
                              size: 20,
                              color: CustomColors.glossyBlueBgColor,
                            ),
                            horizontalSpacer(5),
                            const Text(
                              "Add Money",
                              style: TextStyle(
                                color: CustomColors.glossyBlueBgColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                ],
              ),
            )
          ],
        ),
        body: FutureBuilder(
          // future: locator<UserRepository>().getUsersCredentials(),
          future: Future.delayed(const Duration(seconds: 2), () => []),
          builder: (context, rideSnapshot) {
            if (rideSnapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (rideSnapshot.hasError) {
              return Text('Error loading ride: ${rideSnapshot.error}');
            } else if (rideSnapshot.hasData) {
              // Display information in a container
              var result = rideSnapshot.data!;
              print(result);

              return Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 30, 20, 40),
                    child: Column(
                      children: [
                        Container(
                            decoration: BoxDecoration(
                              color: CustomColors.deepBlueColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 30.h, horizontal: 20.w),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Available Balance",
                                          style: TextStyle(
                                              color: CustomColors.whiteColor,
                                              fontSize: 15),
                                        ),
                                        Icon(
                                          Icons.arrow_forward,
                                          color: CustomColors.whiteColor,
                                          size: 20,
                                        )
                                      ],
                                    ),
                                    verticalSpacer(12.h),
                                    RichText(
                                      text: TextSpan(
                                        style: TextStyle(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w500,
                                            color: CustomColors.blackColor),
                                        children: [
                                          TextSpan(
                                            text: '${(currency(context))} ',
                                            style: TextStyle(
                                                fontSize: 25.sp,
                                                fontWeight: FontWeight.w700,
                                                color: CustomColors.whiteColor),
                                          ),
                                          TextSpan(
                                            text:
                                                // result.walletBalance
                                                //         .toString() ??
                                                "0",
                                            style: TextStyle(
                                                fontSize: 25.sp,
                                                fontWeight: FontWeight.w700,
                                                color: CustomColors.whiteColor),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ))),
                        verticalSpacer(25.h),
                        Container(
                          height: 85.h,
                          decoration: BoxDecoration(
                            color: CustomColors.greyWhiteColor.withOpacity(0.6),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: 1 == null
                              // result.accountDetails == null
                              ? const Center(
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 15.0),
                                    child: Text(
                                      "Complete your KYC to get a dedicated virtual account",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),

                                  //  Container(
                                  //   height: 60.h,
                                  //   decoration: BoxDecoration(
                                  //     color: CustomColors.glossyBlueBgColor,
                                  //     borderRadius: BorderRadius.circular(30),
                                  //   ),
                                  //   child: Padding(
                                  //     padding: EdgeInsets.symmetric(horizontal: 10.w),
                                  //     child: Center(
                                  //       child: Text(
                                  //         "Claim Virtual Wallet",
                                  //         style: TextStyle(
                                  //             fontSize: 16.sp,
                                  //             fontWeight: FontWeight.w500,
                                  //             color: CustomColors.whiteColor),
                                  //       ),
                                  //     ),
                                  //   ),
                                  // ),
                                )
                              : Row(
                                  children: [
                                    SizedBox(
                                      width: 140.w,
                                      child: Container(
                                          height: 60.h,
                                          decoration: BoxDecoration(
                                            color: CustomColors.greyWhiteColor
                                                .withOpacity(0.6),
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10.w),
                                            child: const Center(
                                              child: Text(
                                                "Fund wallet with your virtual account number",
                                                style: TextStyle(
                                                    color:
                                                        CustomColors.blackColor,
                                                    fontSize: 12),
                                              ),
                                            ),
                                          )),
                                    ),
                                    Expanded(
                                      child: Container(
                                          height: 60.h,
                                          decoration: BoxDecoration(
                                            color:
                                                CustomColors.glossyBlueBgColor,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 10.w),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      const Text(
                                                        // result.accountDetails
                                                        //         ?.bankName ??
                                                        "Paystack-Titan",
                                                        style: TextStyle(
                                                            color: CustomColors
                                                                .whiteColor,
                                                            fontSize: 13),
                                                      ),
                                                      verticalSpacer(3.h),
                                                      Text(
                                                        // result.accountDetails
                                                        //         ?.accountNumber ??
                                                        "9970936282",
                                                        style: TextStyle(
                                                            fontSize: 16.sp,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color: CustomColors
                                                                .whiteColor),
                                                      ),
                                                    ],
                                                  ),
                                                  const Icon(
                                                    Icons.copy,
                                                    color:
                                                        CustomColors.whiteColor,
                                                    size: 20,
                                                  )
                                                ],
                                              ))),
                                    ),
                                  ],
                                ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 50.h,
                    width: double.infinity,
                    color: CustomColors.greyWhiteColor,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                      child: Row(
                        children: [
                          Text(
                            "Transaction History",
                            style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                                color: CustomColors.blackColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const EmptyListWidgetView(
                    subtitle:
                        "You have not performed any transactions at the moment.",
                    bottomPdding: 30,
                  )
                ],
              );
            } else {
              return const Text('No data available');
            }
          },
        ));
  }
}
