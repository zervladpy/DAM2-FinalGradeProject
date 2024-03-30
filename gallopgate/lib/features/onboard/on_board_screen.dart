import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallopgate/features/onboard/presentation/controller/on_board_cubit.dart';
import 'package:gallopgate/features/onboard/presentation/widgets/onboard_page.dart';
import 'package:gallopgate/features/onboard/presentation/widgets/onboard_page_indicator.dart';
import 'package:gallopgate/features/onboard/presentation/widgets/onboard_skip_button.dart';
import 'package:gallopgate/utils/constraints/_constraints_library.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'presentation/widgets/onboard_next_button.dart';

/// On first app initialization
class OnBoardScreen extends StatelessWidget {
  const OnBoardScreen({super.key});
  @override
  Widget build(BuildContext context) {
    List<PageOnBoard> pages = [
      PageOnBoard(
          title: AppLocalizations.of(context)?.onboardPage1Title ?? "t1",
          description: AppLocalizations.of(context)?.onboardPage1Description ?? "d1",
          image: GImages.logoDark
      ),
      PageOnBoard(
          title: AppLocalizations.of(context)?.onboardPage2Title ?? "t1",
          description: AppLocalizations.of(context)?.onboardPage2Description ?? "d1",
          image: GImages.logoDark
      ),
      PageOnBoard(
          title: AppLocalizations.of(context)?.onboardPage3Title ?? "t1",
          description: AppLocalizations.of(context)?.onboardPage3Description ?? "d1",
          image: GImages.logoDark
      ),
    ];
    return BlocProvider(
      create: (BuildContext _) => OnBoardCubit(
          totalPages: pages.length,
          onFinish: () {}
      ),
      child: _OnBoardScreen(pages: pages),
    );
  }
}

class _OnBoardScreen extends StatelessWidget {
  const _OnBoardScreen({super.key, required this.pages});

  final List<PageOnBoard> pages;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<OnBoardCubit>();
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: cubit.state.controller,
            onPageChanged: cubit.onPageChanged,
            children: pages,
          ),
          const OnboardPageIndicator(),
          const OnboardNextButton(),
          const OnboardSkipButton()
        ],
      ),
    );
  }
}

