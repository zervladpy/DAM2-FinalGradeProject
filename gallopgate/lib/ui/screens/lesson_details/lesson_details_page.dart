import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallopgate/common/enums/status.dart';
import 'package:gallopgate/common/utils/date_utils.dart';
import 'package:gallopgate/config/dependency_injection/locator_intializer.dart';
import 'package:gallopgate/ui/screens/lesson_details/bloc/lesson_bloc.dart';
import 'package:gallopgate/ui/screens/lesson_details/widgets/lesson_detail_sliver_appbar.dart';
import 'package:gallopgate/ui/widgets/loading/sliver_linear_loading.dart';
import 'package:gallopgate/ui/widgets/snackbars/snackbar.dart';
import 'package:gallopgate/ui/widgets/tiles/list_tile.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class LessonDetailsPage extends StatelessWidget {
  const LessonDetailsPage(this.id, {super.key});

  final String id;

  static page(String id) => MaterialPage(child: LessonDetailsPage(id));

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
            const _CreatorListTile(),
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
    final bloc = context.read<LessonBloc>();

    return TextFormField(
      initialValue: bloc.state.lesson.title,
      onChanged: (value) {},
      decoration: const InputDecoration(
        labelText: 'Title',
        hintText: 'Enter lesson title',
      ),
    );
  }
}

class _DescriptionTextField extends StatelessWidget {
  const _DescriptionTextField({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<LessonBloc>();

    return TextFormField(
      initialValue: bloc.state.lesson.description,
      onChanged: (value) {},
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
      decoration: const InputDecoration(
        labelText: 'Description',
        hintText: 'Description',
      ),
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
