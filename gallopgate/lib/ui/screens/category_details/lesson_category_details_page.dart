import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallopgate/common/enums/status.dart';
import 'package:gallopgate/common/utils/date_utils.dart';
import 'package:gallopgate/config/dependency_injection/locator_intializer.dart';
import 'package:gallopgate/ui/screens/category_details/bloc/lesson_bloc.dart';
import 'package:gallopgate/ui/screens/category_details/widgets/lesson_detail_sliver_appbar.dart';
import 'package:gallopgate/ui/widgets/loading/sliver_linear_loading.dart';
import 'package:gallopgate/ui/widgets/snackbars/snackbar.dart';
import 'package:gallopgate/ui/widgets/tiles/list_tile.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class LessonCategoryDetailsPage extends StatelessWidget {
  const LessonCategoryDetailsPage(this.id, {super.key});

  final String id;

  static page(String id) => MaterialPage(child: LessonCategoryDetailsPage(id));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_) => LessonBloc(
          profileRepository: locator.get(),
          lectureRepository: locator.get(),
        )..add(Fetch(id)),
        child: const _LessonDetailsPage(),
      ),
    );
  }
}

class _LessonDetailsPage extends StatelessWidget {
  const _LessonDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LessonBloc, LessonState>(
      listener: (context, state) {
        if (state.status == Status.error) {
          GSnackbar.error(
            context: context,
            message: state.error ?? 'Failed to load lesson details.',
          );
          context.pop();
        }
      },
      builder: (context, state) {
        return CustomScrollView(
          slivers: [
            const LessonDetailSliverAppbar(),
            if (state.status == Status.loading) const SliverLinearLoading(),
            const SliverToBoxAdapter(
              child: SizedBox(height: 16.0),
            ),
            if (state.status != Status.loading) const _CreatorListTile(),
            if (state.status != Status.loading)
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      _TitleTextField(),
                      SizedBox(height: 16.0),
                      _DescriptionTextField(),
                    ],
                  ),
                ),
              )
          ],
        );
      },
    );
  }
}

class _TitleTextField extends StatelessWidget {
  const _TitleTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LessonBloc, LessonState>(
      buildWhen: (prev, curr) => prev.lesson.title != curr.lesson.title,
      builder: (context, state) {
        return TextFormField(
          initialValue: state.lesson.title,
          onChanged: (value) {},
          decoration: const InputDecoration(
            labelText: 'Title',
            hintText: 'Enter lesson title',
          ),
        );
      },
    );
  }
}

class _DescriptionTextField extends StatelessWidget {
  const _DescriptionTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LessonBloc, LessonState>(
      buildWhen: (prev, curr) =>
          prev.lesson.description != curr.lesson.description,
      builder: (context, state) {
        return TextFormField(
          initialValue: state.lesson.description,
          maxLines: 5,
          maxLength: 250,
          buildCounter: (
            context, {
            required currentLength,
            required isFocused,
            required maxLength,
          }) {
            return Text('$currentLength/$maxLength');
          },
          onChanged: (value) {},
          decoration: const InputDecoration(
            labelText: 'Description',
            hintText: 'Enter lesson description',
          ),
        );
      },
    );
  }
}

class _CreatorListTile extends StatelessWidget {
  const _CreatorListTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final profile = context.watch<LessonBloc>().state.creator;
    final creationDate = context.watch<LessonBloc>().state.lesson.createdAt;

    final item = ListTileItem(
      title: profile.fullName,
      subtitle: 'Created at ${GDateUtils.formatDateToString(
        creationDate ?? DateTime.now(),
      )}',
      leading: const Icon(Iconsax.user),
    );

    return SliverToBoxAdapter(child: GListTile(item: item));
  }
}

class _UpdateButton extends StatelessWidget {
  const _UpdateButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LessonBloc, LessonState>(
      buildWhen: (previous, current) => previous.isEdited != current.isEdited,
      builder: (context, state) {
        return ElevatedButton(
          onPressed: () {
            context.read<LessonBloc>().add(const Update());
          },
          child: const Text("Update"),
        );
      },
    );
  }
}
