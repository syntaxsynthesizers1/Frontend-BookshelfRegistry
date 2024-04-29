import 'dart:io';

import 'package:intl/intl.dart';

currency(context) {
  var format =
      NumberFormat.simpleCurrency(locale: Platform.localeName, name: "NGN");
  return format.currencySymbol;
}
