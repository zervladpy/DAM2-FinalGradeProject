import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallopgate/models/profile/profile_preview_dto.dart';
import 'package:gallopgate/ui/screens/main_manage/bloc/manage_bloc.dart';
import 'package:gallopgate/ui/screens/main_manage/widgets/buttons/manage_add_button.dart';
import 'package:gallopgate/ui/wrappers/main_wrapper/main_bloc/main_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class ManageProfilesContent extends StatelessWidget {
  const ManageProfilesContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlocBuilder<ManageBloc, ManageState>(
            buildWhen: (prev, curr) => prev.profiles != curr.profiles,
            builder: (context, state) {
              return ListView.builder(
                itemCount: state.profiles.length,
                itemBuilder: (context, index) {
                  ProfilePreviewDto previewDto =
                      state.profiles.elementAt(index);
                  return _ProfileCard(previewDto);
                },
              );
            },
          ),
        ),
        const _AddProfileButton(),
      ],
    );
  }
}

class _ProfileCard extends StatelessWidget {
  const _ProfileCard(this.profile);

  final ProfilePreviewDto profile;

  @override
  Widget build(BuildContext context) {
    bool showAvatar = profile.avatarUrl.isNotEmpty;

    return Card(
      elevation: 0.0,
      color: Colors.transparent,
      child: ListTile(
        leading: CircleAvatar(
          child: showAvatar
              ? Image.network(profile.avatarUrl)
              : const Icon(Iconsax.user),
        ),
        title: Text(profile.firstName),
        subtitle: Text(profile.lastName),
        trailing: Chip(
          label: Text(profile.roles.join(', ')),
        ),
        onTap: () {
          context.push('/users/${profile.id}');
        },
      ),
    );
  }
}

class _AddProfileButton extends StatelessWidget {
  const _AddProfileButton();

  @override
  Widget build(BuildContext context) {
    final organizationId = context.read<MainBloc>().state.organization.id;

    return AddButton(
      label: "Add Profile",
      onPressed: () {
        context.push('/users/create/$organizationId');
      },
    );
  }
}
