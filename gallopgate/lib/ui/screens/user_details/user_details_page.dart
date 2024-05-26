import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallopgate/common/enums/status.dart';
import 'package:gallopgate/config/dependency_injection/locator_intializer.dart';
import 'package:gallopgate/ui/screens/error_not_found/error_not_found_page.dart';
import 'package:gallopgate/ui/screens/loading_page/loading_page.dart';
import 'package:gallopgate/ui/screens/user_details/bloc/user_details_bloc.dart';

class UserDetailsPage extends StatelessWidget {
  const UserDetailsPage({
    super.key,
    required this.profileId,
  });

  final String profileId;

  static page(String profileId) => MaterialPage(
        child: UserDetailsPage(profileId: profileId),
      );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserDetailsBloc(
        locator.get(),
      )..add(UserDetailsInitialize(profileId)),
      child: const _UserDetailPage(),
    );
  }
}

class _UserDetailPage extends StatelessWidget {
  const _UserDetailPage();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserDetailsBloc, UserDetailsState>(
      listenWhen: (prev, curr) => prev.status != curr.status,
      listener: (context, state) {
        if (state.status == Status.error) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error ?? 'An error occurred'),
            ),
          );
        }
      },
      buildWhen: (prev, curr) => prev.status != curr.status,
      builder: (context, state) {
        if (state.status == Status.loading) {
          return const LoadingPage();
        }

        if (state.status == Status.error) {
          return const ErrorNotFoundPage();
        }

        return Scaffold(
          appBar: AppBar(
            title: Text(state.profile.email),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(state.profile.id!),
                  Text('${state.profile.firstName} ${state.profile.lastName}'),
                  Text(state.profile.email),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
