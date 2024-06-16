
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallopgate/config/dependency_injection/locator_intializer.dart';
import 'package:gallopgate/repositories/auth_repository.dart';
import 'package:gallopgate/ui/wrappers/auth_wrapper/cubit/auth_cubit.dart';
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
        locator.get<AuthRepository>().authStateChanges,
        locator.get(),
      ),
      child: Builder(builder: (context) {
        return BlocListener<AuthCubit, AuthState>(
          listenWhen: (prev, curr) => prev.status != curr.status,
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
