import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallopgate/models/horse/horse.dart';
import 'package:gallopgate/models/profile/profile.dart';
import 'package:gallopgate/ui/screens/lesson_create/controllers/member/member_cubit.dart';
import 'package:gallopgate/ui/screens/lesson_create/widgets/appbar/add_instructor_appbar.dart';
import 'package:gallopgate/ui/screens/lesson_create/widgets/inputs/select_horse.dart';
import 'package:gallopgate/ui/screens/lesson_create/widgets/inputs/select_profile.dart';

class AddInstructorPage extends StatelessWidget {
  const AddInstructorPage({
    super.key,
    required this.title,
    this.profiles = const [],
    this.horses = const [],
  });

  final String title;
  final List<Profile> profiles;
  final List<Horse> horses;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          AddInstructorAppbar(title: title),
          SliverPadding(
            padding: const EdgeInsets.all(16.0),
            sliver: BlocProvider(
              create: (_) => MemberCubit(),
              child: _Content(
                profiles: profiles,
                horses: horses,
              ),
            ),
          ),
        ],
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
    return SliverToBoxAdapter(
      child: Stack(
        children: [
          Column(
            children: [
              _SelectProfile(profiles: profiles),
              const SizedBox(height: 16.0),
              _SelectHorse(horses: horses),
            ],
          )
        ],
      ),
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
