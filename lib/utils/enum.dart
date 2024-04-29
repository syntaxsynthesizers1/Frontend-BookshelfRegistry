import 'package:flutter/material.dart';

import '../constants/custom_colors.dart';

// enum BookStatus { available, reserved, borrowed }
enum BookStatus { free, newArrival, popular }

enum BookCategory {
  drama,
  fantasy,
  children,
  cooking,
  mystery,
  romance,
  selfHelp,
  thriller,
}

String getStatusName(BookStatus bookStatus) {
  switch (bookStatus) {
    case BookStatus.free:
      return "Free";
    case BookStatus.newArrival:
      return "NewArrival";
    case BookStatus.popular:
      return "Popular";
    default:
      return "Free";
  }
}

String getCategoryNewName(BookCategory bookCategory) {
  switch (bookCategory) {
    case BookCategory.children:
      return "Children";
    case BookCategory.cooking:
      return "Cooking";
    case BookCategory.drama:
      return "Drama";
    case BookCategory.fantasy:
      return "Fantasy";
    case BookCategory.mystery:
      return "Mystery";
    case BookCategory.romance:
      return "Romance";
    case BookCategory.selfHelp:
      return "SelfHelp";
    case BookCategory.thriller:
      return "Thriller";
    default:
      return "Mystery";
  }
}

String getCategoryName(BookCategory bookCategory) {
  switch (bookCategory) {
    case BookCategory.children:
      return "Children Books";
    case BookCategory.cooking:
      return "Cooking";
    case BookCategory.drama:
      return "Drama";
    case BookCategory.fantasy:
      return "Fantancy";
    case BookCategory.mystery:
      return "Mystery";
    case BookCategory.romance:
      return "Romance";
    case BookCategory.selfHelp:
      return "Self Help";
    case BookCategory.thriller:
      return "Thriller";
    default:
      return "New";
  }
}
////

enum AuthType { signIn, signUp }

enum CommunityStatus { pendingAprroval, approved, rejected }

enum InfoBoxType {
  success,
  error,
  confirmation,
  warning,
  information,
  question
}

String getIconPath(InfoBoxType type) {
  switch (type) {
    case InfoBoxType.success:
      return "assets/icons/icon_check.svg";
    case InfoBoxType.error:
      return "assets/icons/icon_error.svg";
    case InfoBoxType.warning:
      return "assets/icons/icon_warning.svg";
    case InfoBoxType.confirmation:
      return "assets/icons/icon_question.svg";

    default:
      return "assets/icons/icon_dialog.svg";
  }
}

String getNewIconPath(InfoBoxType type) {
  switch (type) {
    case InfoBoxType.success:
      return "assets/icons/icon_check_outline.svg";
    case InfoBoxType.error:
      return "assets/icons/icon_error_outline.svg";
    case InfoBoxType.warning:
      return "assets/icons/icon_warning_outline.svg";
    case InfoBoxType.information:
      return "assets/icons/icon_info_outline.svg";
    case InfoBoxType.question:
      return "assets/icons/icon_question_outline.svg";
    default:
      return "assets/icons/icon_dialog.svg";
  }
}

Color getTypeColor(InfoBoxType type) {
  switch (type) {
    case InfoBoxType.success:
      return CustomColors.greenBgColor;
    case InfoBoxType.error:
      return CustomColors.redBgColor;
    case InfoBoxType.warning:
      return CustomColors.warningBgColor;
    case InfoBoxType.confirmation:
      return CustomColors.greenBgColor;
    case InfoBoxType.information:
      return CustomColors.primaryAccentColor;
    default:
      return CustomColors.greenBgColor;
  }
}

String getAnimationPath(InfoBoxType type) {
  switch (type) {
    case InfoBoxType.success:
      return "assets/animations/success_animation.json";
    case InfoBoxType.error:
      return "assets/animations/error_animation.json";
    case InfoBoxType.warning:
      return "assets/animations/warning_animation.json";
    case InfoBoxType.information:
      return "assets/animations/info_animation.json";
    case InfoBoxType.question:
      return "assets/animations/success_animation.json";
    default:
      return "assets/animations/success_animation.json";
  }
}
