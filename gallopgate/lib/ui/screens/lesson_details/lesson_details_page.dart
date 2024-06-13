import 'package:flutter/material.dart';
import 'package:gallopgate/ui/widgets/appbar/sliver_appbar.dart';

class LessonDetailsPage extends StatelessWidget {
  const LessonDetailsPage({
    super.key,
    required this.id,
  });

  final String id;

  static page(String id) => LessonDetailsPage(id: id);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        slivers: [
          GSliverAppBar(
            title: Text('Lesson Details'),
          ),
        ],
      ),
    );
  }
}
