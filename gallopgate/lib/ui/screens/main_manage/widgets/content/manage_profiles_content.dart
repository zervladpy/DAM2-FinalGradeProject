import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallopgate/models/profile/profile.dart';
import 'package:gallopgate/ui/screens/loading_page/loading_page.dart';
import 'package:gallopgate/ui/screens/main_manage/widgets/manage_top_bar.dart';
import 'package:gallopgate/ui/wrappers/main_wrapper/main_bloc/main_bloc.dart';
import 'package:go_router/go_router.dart';

class ManageProfilesContent extends StatelessWidget {
  const ManageProfilesContent({
    super.key,
    required this.fetch,
  });

  final Future<List<Profile>?>? Function() fetch;

  @override
  Widget build(BuildContext context) {
    final organizationId = context.read<MainBloc>().state.organization.id;
    log(organizationId);

    return FutureBuilder<List<Profile>?>(
      future: fetch(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingPage();
        }

        if (snapshot.hasError) {
          return Center(
            child: Text('Failed to load profiles: ${snapshot.error}'),
          );
        }

        final List<Profile> profiles = snapshot.data!;

        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            primary: true,
            children: [
              ManageTopBar(
                count: profiles.length,
                onAddPressed: () {
                  context.push(
                    '/users/create',
                    extra: {'organization-id': organizationId},
                  );
                },
              ),
              const SizedBox(height: 16.0),
              _ProfileListView(profiles: profiles),
            ],
          ),
        );
      },
    );
  }
}

class _ProfileListView extends StatelessWidget {
  const _ProfileListView({
    required this.profiles,
  });

  final List<Profile> profiles;

  @override
  Widget build(BuildContext context) {
    void navigateToProfile(String id) {
      context.push('/users/$id');
    }

    return ListView.builder(
      shrinkWrap: true,
      primary: false,
      itemCount: profiles.length,
      itemBuilder: (context, index) {
        var profile = profiles.elementAt(index);
        return _ProfileListTile(profile: profile, onTap: navigateToProfile);
      },
    );
  }
}

class _ProfileListTile extends StatelessWidget {
  const _ProfileListTile({
    required this.profile,
    this.onTap,
  });

  final Profile profile;
  final Function(String id)? onTap;

  @override
  Widget build(BuildContext context) {
    log(profile.toString());
    return ListTile(
      onTap: () => onTap?.call(profile.id!),
      title: Text(profile.fullName),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: profile.roles
            .map((e) => Padding(
                  padding: const EdgeInsets.only(right: 5.0),
                  child: Text(e.name),
                ))
            .toList(),
      ),
      leading: CircleAvatar(
        child: Text(profile.fullName.substring(0, 1)),
      ),
    );
  }
}
