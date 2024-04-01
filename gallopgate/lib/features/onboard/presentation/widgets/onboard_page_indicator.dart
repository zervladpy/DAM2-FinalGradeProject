import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallopgate/features/onboard/presentation/controller/on_board_cubit.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../utils/constraints/colors.dart';
import '../../../../utils/constraints/sizes.dart';
import '../../../../utils/helper/helper.dart';

class OnboardPageIndicator extends StatelessWidget {
  const OnboardPageIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Color color = GHelper.isDarkMode(context)
        ? GColor.lightBackground
        : GColor.darkBackground;

    final OnBoardCubit cubit = context.read();

    return Positioned(
      left: GSizes.defaultSeparation,
      bottom: GSizes.bottomNavigationBarHeight + 20.0,
      child: SmoothPageIndicator(
        controller: cubit.state.controller,
        onDotClicked: cubit.onPageChanged,
        count: 3,
        effect: ExpandingDotsEffect(
          dotColor: color.withOpacity(0.2),
          activeDotColor: color,
          dotHeight: 8,
        ),
      ),
    );
  }
}
