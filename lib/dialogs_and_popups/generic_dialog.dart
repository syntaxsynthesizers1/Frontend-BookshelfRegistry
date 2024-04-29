import 'dart:async';

import 'package:book_stack/locator.dart';
import 'package:book_stack/utils/navigator_handler.dart';
import 'package:book_stack/utils/spacers.dart';
import 'package:book_stack/widgets/new_custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

import '../Constants/custom_colors.dart';
import '../utils/enum.dart';

BuildContext modalContext =
    locator<NavigationHandler>().navigatorKey.currentContext!;
late Timer timer;

class GenericDialog {
  Future<void> showSimplePopup(
      {String? title,
      // required BuildContext context,
      bool showTitle = true,
      String content = "",
      required InfoBoxType type,
      Widget? customIcon,
      Widget? contentBody,
      TextAlign? textAlign,
      String? okText,
      Function()? onOkPressed,
      Function()? onNoPressed,
      Color? footerColor}) async {
    if ((type == InfoBoxType.information || type == InfoBoxType.warning) &&
        title == null) {
      showTitle = false;
    }
    return showDialog<void>(
      barrierColor: CustomColors.blackColor.withOpacity(0.75),
      context: modalContext,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Container(
          decoration: const BoxDecoration(
            shape: BoxShape.rectangle,
          ),
          child: AlertDialog(
            backgroundColor: Colors.white,
            actionsPadding: EdgeInsets.zero,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            contentPadding:
                const EdgeInsets.only(top: 35, bottom: 25, left: 15, right: 10),
            content: SingleChildScrollView(
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    customIcon ??
                        Lottie.asset(
                          getAnimationPath(type),
                          height: 80,
                          width: 80,
                          animate: true,
                          repeat: false,
                          reverse: false,
                          fit: BoxFit.contain,
                        ),
                    verticalSpacer(15),
                    showTitle
                        ? Flexible(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Text(
                                title ?? toBeginningOfSentenceCase(type.name)!,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                    color: getTypeColor(type)),
                              ),
                            ),
                          )
                        : const SizedBox.shrink(),
                    verticalSpacer(15),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: contentBody ??
                            Text(
                              content,
                              textAlign: textAlign ?? TextAlign.center,
                              style: const TextStyle(
                                  height: 1.4,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400),
                            ),
                      ),
                    ),
                    verticalSpacer(40),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 30, right: 30),
                              child: NewCustomButton(
                                  title: okText ?? "Okay",
                                  onTap: onOkPressed ??
                                      () {
                                        Navigator.pop(context);
                                      }),
                            ),
                          ),
                        ],
                      ),
                    ),
                    verticalSpacer(10)
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
