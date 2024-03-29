import 'package:flutter/material.dart';
import 'package:gallopgate/features/app/app.dart';
import 'package:gallopgate/utils/locator/locator.dart';

void main() {
  GLocator().init();

  runApp(const GApp());
}

