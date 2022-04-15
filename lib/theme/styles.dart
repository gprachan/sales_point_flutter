import 'package:flutter/material.dart';

import 'colors.dart';

var buttonStyle = ButtonStyle(
  backgroundColor: MaterialStateProperty.all<Color>(AppColors.primaryColor),
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(30)),
    ),
  ),
);
