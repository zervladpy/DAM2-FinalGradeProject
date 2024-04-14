import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallopgate/features/onboard/presentation/controller/on_board_cubit.dart';
import 'package:gallopgate/utils/constraints/_constraints_library.dart';
import 'package:iconsax/iconsax.dart';

class OnboardNextButton extends StatelessWidget {
  const OnboardNextButton({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.read<OnBoardCubit>();
    return Positioned(
      right: GSizes.defaultSeparation,
      bottom: GSizes.bottomNavigationBarHeight,
      child: ElevatedButton(
        onPressed: controller.onNextPage,
        style: ElevatedButton.styleFrom(
          maximumSize: Size(GSizes.defaultHeight, GSizes.defaultHeight,),
          minimumSize: Size(GSizes.defaultHeight, GSizes.defaultHeight,)
        ),
        child: Icon(
          Iconsax.arrow_right_3,
          size: GSizes.iconLg,
        ),
      ),
    );
  }
}