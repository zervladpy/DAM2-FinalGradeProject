import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallopgate/v1/config/locator/locator.dart';
import 'package:gallopgate/v2/repositories/auth_repository.dart';
import 'package:gallopgate/v2/ui/wrappers/auth_wrapper/cubit/auth_cubit.dart';
import 'package:go_router/go_router.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({
    super.key,
    required this.child,
    required this.state,
  });

  final Widget child;
  final GoRouterState state;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(
        gLocator.get<AuthRepository>().authStateChanges,
      ),
      child: Builder(builder: (context) {
        return BlocListener<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state.status == AuthStatus.authenticated) {
              if (state.profile.organizationId != null) {
                context.go('/home');
              } else {
                context.go('/organizations');
              }
            }
          },
          child: Scaffold(body: child),
        );
      }),
    );
  }
}
