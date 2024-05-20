import 'package:flutter/material.dart';

extension DoubleExtension on double {
  EdgeInsets get paddingAll => EdgeInsets.all(this);
  EdgeInsets get paddingSymmetricHorizontal =>
      EdgeInsets.symmetric(horizontal: this);
  EdgeInsets get paddingSymmetricVertical =>
      EdgeInsets.symmetric(vertical: this);

  BorderRadius get borderRadius => BorderRadius.circular(this);
}
