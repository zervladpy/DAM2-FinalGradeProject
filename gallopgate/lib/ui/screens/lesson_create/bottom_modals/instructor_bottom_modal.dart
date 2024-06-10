import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallopgate/models/horse/horse.dart';
import 'package:gallopgate/models/profile/profile.dart';
import 'package:gallopgate/ui/screens/lesson_create/controllers/member/member_cubit.dart';
import 'package:gallopgate/ui/screens/lesson_create/library.dart';

class InstructorBottomModal extends StatelessWidget {
  const InstructorBottomModal({
    super.key,
    this.profiles = const [],
    this.horses = const [],
    this.onSubmit,
  });

  final List<Profile> profiles;
  final List<Horse> horses;
  final void Function(Profile profile, Horse? horse)? onSubmit;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
      constraints: BoxConstraints(
        maxHeight: MediaQuery.sizeOf(context).height * 0.3,
      ),
      child: BlocProvider(
        create: (_) => MemberCubit(save: onSubmit),
        child: _Content(
          profiles: profiles,
          horses: horses,
        ),
      ),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content({
    super.key,
    required this.profiles,
    required this.horses,
  });

  final List<Profile> profiles;
  final List<Horse> horses;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _SelectProfile(profiles: profiles),
        const SizedBox(height: 16.0),
        _SelectHorse(horses: horses),
        const SizedBox(height: 16.0),
        const _AddButton(),
      ],
    );
  }
}

class _SelectProfile extends StatelessWidget {
  const _SelectProfile({super.key, required this.profiles});

  final List<Profile> profiles;

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<MemberCubit>();

    return BlocBuilder<MemberCubit, MemberState>(
      buildWhen: (prev, curr) => prev.profile != curr.profile,
      builder: (context, state) {
        return SelectProfile(
          label: 'Select Instructor',
          selected: state.profile,
          items: profiles,
          onSelect: cubit.setProfile,
          validator: _validator,
        );
      },
    );
  }

  String? _validator(Profile? profile) {
    if (profile == null) return 'required';
    if (profile == Profile.empty) return 'required';
    return null;
  }
}

class _SelectHorse extends StatelessWidget {
  const _SelectHorse({
    super.key,
    required this.horses,
  });

  final List<Horse> horses;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MemberCubit, MemberState>(
      buildWhen: (prev, curr) => prev.horse != curr.horse,
      builder: (context, state) {
        return SelectHorse(
          label: 'Select Horse',
          selected: state.horse,
          items: horses,
          onSelect: context.read<MemberCubit>().setHorse,
        );
      },
    );
  }
}

class _AddButton extends StatelessWidget {
  const _AddButton({
    super.key,
    this.onPressed,
  });

  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<MemberCubit>();

    return ElevatedButton(
      onPressed: cubit.submit,
      child: const Text("Add"),
    );
  }
}
