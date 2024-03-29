import 'package:flutter/material.dart';
import 'package:gallopgate/utils/constraints/colors.dart';
import 'package:gallopgate/utils/constraints/sizes.dart';

class GTabBarTheme {
  const GTabBarTheme._();

  static TabBarTheme get light => TabBarTheme(
        dividerHeight: GSizes.zero,
        splashFactory: NoSplash.splashFactory,
        overlayColor: MaterialStateColor.resolveWith(
          (states) => GColor.transparent,
        ),
        tabAlignment: TabAlignment.start,

        /// --- Colors --- ///
        indicatorColor: GColor.darkBackground,
        labelColor: GColor.darkTextColor,
        unselectedLabelColor:
            GColor.lightTextColor.withOpacity(GSizes.opacityMedium),

        /// --- Text Style --- ///
        labelPadding: EdgeInsets.all(GSizes.sm),
        labelStyle: const TextStyle().copyWith(
          fontSize: GSizes.fontLg,
          fontWeight: GSizes.fontBold,
        ),
        unselectedLabelStyle: const TextStyle().copyWith(
          fontSize: GSizes.fontLg,
          fontWeight: GSizes.fontBold,
        ),
        // --- Indicator --- //
        indicatorSize: TabBarIndicatorSize.tab,
        indicator: BoxDecoration(
          color: GColor.darkBackground,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(GSizes.sm),
        ),
      );

  static TabBarTheme get dark => TabBarTheme(
        dividerHeight: GSizes.zero,
        splashFactory: NoSplash.splashFactory,
        overlayColor: MaterialStateColor.resolveWith(
          (states) => GColor.transparent,
        ),
        tabAlignment: TabAlignment.start,

        /// --- Colors --- ///
        indicatorColor: GColor.primary,
        labelColor: GColor.darkTextColor,
        unselectedLabelColor:
            GColor.darkTextColor.withOpacity(GSizes.opacityMedium),

        /// --- Text Style --- ///
        labelPadding: EdgeInsets.all(GSizes.sm),
        labelStyle: const TextStyle().copyWith(
          fontSize: GSizes.fontLg,
          fontWeight: GSizes.fontBold,
        ),
        unselectedLabelStyle: const TextStyle().copyWith(
          fontSize: GSizes.fontLg,
          fontWeight: GSizes.fontBold,
        ),
        // --- Indicator --- //
        indicatorSize: TabBarIndicatorSize.tab,
        indicator: BoxDecoration(
          color: GColor.primary,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(GSizes.sm),
        ),
      );
}
