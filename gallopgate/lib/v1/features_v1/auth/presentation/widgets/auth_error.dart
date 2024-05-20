import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallopgate/v1/common/controllers/auth_bloc/auth_bloc.dart';
import 'package:gallopgate/v1/config/extension/double.dart';

class AuthErrorText extends StatelessWidget {
  const AuthErrorText({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return BlocBuilder<AuthBloc, AuthState>(
      buildWhen: (prev, curr) => prev.error != curr.error,
      builder: (context, state) {
        if (state.error.isNotEmpty) {
          return Padding(
            padding: 8.0.paddingSymmetricVertical,
            child: Text(
              state.error,
              style: textTheme.labelLarge!.copyWith(
                color: colorScheme.error,
              ),
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}
