import 'package:gallopgate/models/organization/organization.dart';
import 'package:gallopgate/ui/router/router.library.dart';
import 'package:gallopgate/ui/screens/lesson/controllers/lesson/lesson_bloc.dart';
import 'package:gallopgate/ui/screens/org_create/library.dart';
import 'package:gallopgate/ui/widgets/appbar/sliver_appbar.dart';
import 'package:gallopgate/ui/widgets/buttons/g_icon_button.dart';
import 'package:gallopgate/ui/widgets/text/titles.dart';
import 'package:iconsax/iconsax.dart';

class LessonDetailsSliverAppbar extends StatelessWidget {
  const LessonDetailsSliverAppbar({
    super.key,
    required this.organization,
    this.isAdmin = false,
  });

  final Organization organization;
  final bool isAdmin;

  @override
  Widget build(BuildContext context) {
    return GSliverAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const GAppbarTitle('Lesson Details'),
          GAppbarSubtitle(organization.name),
        ],
      ),
      actions: [
        if (isAdmin)
          GIconButton.filled(
            icon: Iconsax.trash,
            color: Colors.red,
            onPressed: () {
              context.read<LessonBloc>().add(const Delete());
              context.pop();
            },
          ),
      ],
    );
  }
}
