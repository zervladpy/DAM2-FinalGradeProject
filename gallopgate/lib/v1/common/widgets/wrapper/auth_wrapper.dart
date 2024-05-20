import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallopgate/v1/common/controllers/auth_bloc/auth_bloc.dart';
import 'package:gallopgate/v1/common/controllers/cache_bloc/cache_bloc.dart';
import 'package:gallopgate/v1/common/widgets/loading/loading.dart';
import 'package:gallopgate/v1/config/navigation/navigation.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    log("Rebuilding AuthWrapper");
    return BlocListener<AuthBloc, AuthState>(
      listenWhen: (prev, curr) => prev.status != curr.status,
      listener: (context, state) {
        if (state.status == AuthStatus.authenticated) {
          context.read<CacheBloc>().add(InitializeCacheEvent(state.user.id));
          navigateToHome(context);
        }

        if (state.status == AuthStatus.unauthenticated) {
          navigateToLogin(context);
        }
      },
      child: const LoadingScreen(),
    );
  }
}
