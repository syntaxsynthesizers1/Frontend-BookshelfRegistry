import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget getRatingIcons(double rating) {
  List<Widget> icons = [];
  int fullStars = rating.floor();
  bool hasHalfStar = rating - fullStars != 0;
  int stars = 0;
  int remainingStars = 5 - rating.ceil();

  // Add full star icons
  for (int i = 0; i < fullStars; i++) {
    stars = stars + 1;
    icons.add(
      const Padding(
        padding: EdgeInsets.only(right: 3.0),
        child: Icon(
          FontAwesomeIcons.solidStar,
          color: Colors.amber,
          size: 10,
        ),
      ),
    );
  }

  // Add half star icon if needed
  if (hasHalfStar) {
    icons.add(const Padding(
      padding: EdgeInsets.only(right: 3.0),
      child: Icon(
        FontAwesomeIcons.starHalfStroke,
        color: Colors.amber,
        size: 10,
      ),
    ));
  }
  for (int i = 0; i < remainingStars; i++) {
    icons.add(
      const Padding(
        padding: EdgeInsets.only(right: 3.0),
        child: Icon(
          FontAwesomeIcons.star,
          color: Colors.amber,
          size: 10,
        ),
      ),
    );
  }

  icons.add(
    Padding(
      padding: const EdgeInsets.only(left: 5.0),
      child: Text(
        rating.toString(),
        style: const TextStyle(
          // fontWeight: FontWeight.w700,
          fontSize: 10,
        ),
      ),
    ),
  );

  return Row(
    mainAxisSize: MainAxisSize.min,
    children: icons,
  );
}
