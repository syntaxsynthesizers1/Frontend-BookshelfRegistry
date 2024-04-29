import 'package:book_stack/utils/spacers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';

class EmptyListWidgetView extends StatefulWidget {
  const EmptyListWidgetView(
      {Key? key, this.icon, this.title, this.subtitle, this.bottomPdding = 120})
      : super(key: key);
  final Widget? icon;
  final String? title;
  final String? subtitle;
  final double bottomPdding;
  @override
  State<EmptyListWidgetView> createState() => _EmptyListWidgetViewState();
}

class _EmptyListWidgetViewState extends State<EmptyListWidgetView> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            widget.icon ??
                Lottie.asset(
                  "assets/animations/no-transaction-history.json",
                  height: 150,
                  width: 150,
                  animate: true,
                  repeat: true,
                  reverse: false,
                  fit: BoxFit.contain,
                ),
            Text(
              widget.title ?? "",
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
            verticalSpacer(20),
            Text(
              widget.subtitle ?? 'Nothing to show!',
              textAlign: TextAlign.center,
              style: const TextStyle(
                  height: 1.4, fontSize: 15, fontWeight: FontWeight.w400),
            ),
            verticalSpacer(widget.bottomPdding.h),
          ],
        ),
      ),
    );
  }
}
