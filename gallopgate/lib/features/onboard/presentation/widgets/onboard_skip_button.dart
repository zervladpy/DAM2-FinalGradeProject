import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallopgate/features/onboard/presentation/controller/on_board_cubit.dart';
import 'package:gallopgate/utils/constraints/_constraints_library.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class OnboardSkipButton extends StatelessWidget {
  const OnboardSkipButton({super.key});

  @override
  Widget build(BuildContext context) {

    final controller = context.read<OnBoardCubit>();

    return Positioned(
      right: GSizes.defaultSeparation,
      top: GSizes.appbarHeight,
      child: TextButton(
        onPressed: controller.onSkip,
        child: Text(AppLocalizations.of(context)?.skip ?? "Skip"),
      ),
    );
  }
}



