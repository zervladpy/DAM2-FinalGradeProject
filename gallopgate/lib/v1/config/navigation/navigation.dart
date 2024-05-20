import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallopgate/v1/common/controllers/cache_bloc/cache_bloc.dart';
import 'package:gallopgate/v1/features_v1/auth/presentation/screens/login_screen.dart';
import 'package:gallopgate/v1/features_v1/auth/presentation/screens/register_screen.dart';
import 'package:gallopgate/v1/features_v1/home/presentation/pages/create_lecture_page.dart';
import 'package:gallopgate/v1/features_v1/home/presentation/screens/home_screen.dart';
import 'package:gallopgate/v1/features_v1/organization/presentation/screens/create_organization_screen.dart';
import 'package:gallopgate/v1/features_v1/user_details/presentation/screens/user_detail_screen.dart';

Widget transitionBuilder(
  BuildContext context,
  Animation<double> animation,
  Animation<double> secondaryAnimation,
  Widget child,
) {
  return FadeTransition(opacity: animation, child: child);
}

void navigateToRegister(BuildContext context) {
  Navigator.of(context).push(MaterialPageRoute(
    builder: (context) => const RegisterScreen(),
  ));
}

void navigateToLogin(BuildContext context) {
  Navigator.of(context).pushReplacement(PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) {
      return const LoginScreen();
    },
  ));
}

void navigateToHome(BuildContext context) {
  final navigator = Navigator.of(context);

  if (navigator.canPop()) {
    Navigator.of(context).pop(
      PageRouteBuilder(
        transitionsBuilder: transitionBuilder,
        pageBuilder: (context, animation, secondaryAnimation) {
          return const HomeScreen();
        },
      ),
    );
  } else {
    Navigator.of(context).pushReplacement(
      PageRouteBuilder(
        transitionsBuilder: transitionBuilder,
        pageBuilder: (context, animation, secondaryAnimation) {
          return const HomeScreen();
        },
      ),
    );
  }
}

void navigateToUserDetails(BuildContext context) {
  final navigator = Navigator.of(context);
  final CacheBloc cacheBloc = context.read<CacheBloc>();

  if (cacheBloc.state.user.isEmpty) {
    navigator.pushReplacement(
      PageRouteBuilder(
        transitionsBuilder: transitionBuilder,
        pageBuilder: (context, animation, secondaryAnimation) {
          return const UserDetailScreen();
        },
      ),
    );
  } else {
    navigator.push(PageRouteBuilder(
      transitionsBuilder: transitionBuilder,
      pageBuilder: (context, animation, secondaryAnimation) {
        return const UserDetailScreen();
      },
    ));
  }
}

void navigateToCreateOrganization(BuildContext context) {
  Navigator.of(context).pushReplacement(PageRouteBuilder(
    transitionsBuilder: transitionBuilder,
    pageBuilder: (context, animation, secondaryAnimation) {
      return const CreateOrganizationScreen();
    },
  ));
}

void navigateToCreateLecture(BuildContext context) {
  Navigator.of(context).push(PageRouteBuilder(
    transitionsBuilder: transitionBuilder,
    pageBuilder: (context, animation, secondaryAnimation) {
      return const CreateLecturePage();
    },
  ));
}
