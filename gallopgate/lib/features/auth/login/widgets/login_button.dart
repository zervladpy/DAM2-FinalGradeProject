import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallopgate/features/_common/widgets/separator/separator_small.dart';
import 'package:gallopgate/features/_common/widgets/text/text.dart';
import 'package:gallopgate/features/auth/login/controller/login/login_cubit.dart';
import 'package:gallopgate/utils/constraints/sizes.dart';
import 'package:gallopgate/utils/enums/fetch_state.dart';
import 'package:iconsax/iconsax.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    LoginCubit cubit = context.read();

    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (prev, curr) =>
          prev.status != curr.status || prev.error != curr.error,
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (state.status == FetchStatus.initial)
              ElevatedButton.icon(
                onPressed: cubit.onLogin,
                label: const GText(text: "Login"),
                icon: const Icon(Iconsax.login),
              ),
            if (state.status == FetchStatus.loading)
              SizedBox(
                height: GSizes.defaultHeight,
                width: GSizes.defaultHeight,
                child: const LinearProgressIndicator(),
              ),
            if (state.error.isNotEmpty)
              Column(
                children: [
                  SmallSeparator.vertical(),
                  Text(
                    state.error,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: Theme.of(context).colorScheme.error),
                  ),
                ],
              )
          ],
        );
      },
    );
  }
}
