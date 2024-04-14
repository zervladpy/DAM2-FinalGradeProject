import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallopgate/features/auth/signup/controller/signup/signup_cubit.dart';
import 'package:gallopgate/features/auth/signup/widgets/page_signup.dart';
import 'package:gallopgate/utils/constraints/sizes.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  static Page<Widget> get page => const MaterialPage(child: SignupScreen());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(GSizes.defaultSeparation),
          child: BlocProvider(
            create: (context) => SignupCubit(context),
            child: const SignupPage(),
          ),
        ),
      ),
    );
  }
}
