import 'package:flutter/material.dart';
import 'package:gallopgate/common/utils/role_utils.dart';
import 'package:gallopgate/config/extensions/context.dart';
import 'package:gallopgate/config/theme/utils/colors.dart';
import 'package:gallopgate/models/lesson/lesson_dto.dart';
import 'package:gallopgate/models/lesson_member/lesson_member.dart';
import 'package:gallopgate/ui/screens/lesson/controllers/lesson/lesson_bloc.dart';
import 'package:gallopgate/ui/screens/lesson/controllers/member/member_cubit.dart';
import 'package:gallopgate/ui/screens/org_create/library.dart';
import 'package:gallopgate/ui/widgets/buttons/g_icon_button.dart';
import 'package:gallopgate/ui/widgets/inputs/dropdowns/horse_dropdown.dart';
import 'package:gallopgate/ui/widgets/inputs/dropdowns/profile_dropdown.dart';
import 'package:gallopgate/ui/wrappers/main_wrapper/main_bloc/main_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class MemberGrid extends StatelessWidget {
  const MemberGrid({
    super.key,
    required this.members,
  });

  final List<LessonMember> members;

  @override
  Widget build(BuildContext context) {
    final editor = context.read<MainBloc>().state.profile;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${members.length} Members',
              style: context.textTheme.bodyLarge,
            ),
            ElevatedButton.icon(
              onPressed: () => _openMemberDialog(
                context: context,
                bloc: context.read(),
              ),
              label: const Text('Add Member'),
              icon: const Icon(Iconsax.add),
            ),
          ],
        ),
        ListView.builder(
          itemCount: members.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return MemberGridItem(
                member: members[index],
                showEditDialog: (member) {
                  _openMemberDialog(
                    context: context,
                    bloc: context.read(),
                    memeber: member,
                  );
                },
                isAdmin: GRolesUtils.isAdmin(editor.roles));
          },
        ),
        const SizedBox(height: 48.0)
      ],
    );
  }

  Future<void> _openMemberDialog({
    required BuildContext context,
    required LessonBloc bloc,
    LessonMember? memeber,
  }) async {
    final editor = context.read<MainBloc>().state.profile;

    await showMaterialModalBottomSheet(
      context: context,
      backgroundColor: GColor.surfaceLight,
      builder: (modalContext) {
        return MemeberDialog(
          bloc: bloc,
          member: memeber,
          isAdmin: GRolesUtils.isAdmin(editor.roles),
        );
      },
    );
  }
}

class MemberGridItem extends StatelessWidget {
  const MemberGridItem({
    super.key,
    required this.member,
    this.showEditDialog,
    this.isAdmin = false,
  });

  final bool isAdmin;
  final LessonMember member;
  final void Function(
    LessonMember? memeber,
  )? showEditDialog;

  @override
  Widget build(BuildContext context) {
    final profile = member.profile;
    final horse = member.horse;

    return InkWell(
      onTap: isAdmin ? () => showEditDialog?.call(member) : null,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Iconsax.user),
                    const SizedBox(width: 8),
                    Text(profile.fullName),
                  ],
                ),
                const SizedBox(height: 16.0),
                Row(
                  children: [
                    const Icon(Iconsax.activity),
                    const SizedBox(width: 8),
                    Text(horse.alias ?? horse.fullName),
                  ],
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: Icon(Iconsax.edit),
          )
        ],
      ),
    );
  }
}

class MemeberDialog extends StatelessWidget {
  const MemeberDialog({
    super.key,
    required this.bloc,
    this.member,
    this.isAdmin = false,
  });

  final bool isAdmin;
  final LessonBloc bloc;
  final LessonMember? member;

  @override
  Widget build(BuildContext context) {
    final lesson = bloc.state.lesson;

    final dto = LessonDto(
      id: lesson.id,
      title: lesson.title,
      categoryTitle: lesson.category.title,
    );

    final rider = member?.profile;
    final horse = member?.horse;

    final cubit = MemberCubit(lesson: dto);

    if (rider != null) {
      cubit.setProfile(rider);
    }

    if (horse != null) {
      cubit.setHorse(horse);
    }

    return BlocProvider(
      create: (context) => cubit,
      child: Builder(builder: (context) {
        final controller = context.read<MemberCubit>();

        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text('Add Member'),
              const SizedBox(height: 16),
              ProfileDropdown(
                label: 'Riders',
                initialValue: member?.profile,
                items: bloc.state.riders,
                isAdmin: isAdmin,
                onChanged: (p) {
                  if (p == null) return;
                  controller.setProfile(p);
                },
              ),
              const SizedBox(height: 16),
              HorseDropdown(
                label: 'Horses',
                initialValue: member?.horse,
                items: bloc.state.horses,
                isAdmin: isAdmin,
                onChanged: (h) {
                  if (h == null) return;
                  controller.setHorse(h);
                },
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () async {
                  if (member == null) {
                    final m = controller.getLessonMember();
                    bloc.add(AddMember(m));
                  } else {
                    var m =
                        controller.getLessonMember().copyWith(id: member!.id);
                    bloc.add(UpdateMember(m));
                  }

                  context.pop();
                },
                child: member == null
                    ? const Text('Add Member')
                    : const Text('Update Member'),
              ),
            ],
          ),
        );
      }),
    );
  }
}
