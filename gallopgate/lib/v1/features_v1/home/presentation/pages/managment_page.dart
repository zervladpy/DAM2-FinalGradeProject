import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallopgate/v1/common/widgets/scaffolds/tabbar_scaffold.dart';
import 'package:gallopgate/v1/config/extension/double.dart';
import 'package:gallopgate/v1/config/navigation/navigation.dart';
import 'package:gallopgate/v1/features_v1/home/presentation/controllers/lecture_managment_bloc/lecture_managment_bloc.dart';
import 'package:iconsax/iconsax.dart';

class ManagmentPage extends StatelessWidget {
  const ManagmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return TabbarScaffold(
      appBar: AppBar(
        title: const Text("Managment"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Iconsax.add),
          ),
        ],
      ),
      tabs: const [
        Tab(text: "Users"),
        Tab(text: "Horeses"),
        Tab(text: "Lectures"),
      ],
      pages: const [
        _UserManagmentView(),
        _HorseManagmentView(),
        _LectureManagmentView(),
      ],
    );
  }
}

class _UserManagmentView extends StatelessWidget {
  const _UserManagmentView();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: 16.0.paddingAll,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () {},
              child: const Text("Add new User"),
            ),
          ],
        ),
      ),
    );
  }
}

class _HorseManagmentView extends StatelessWidget {
  const _HorseManagmentView();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: 16.0.paddingAll,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () {},
              child: const Text("Add new Horse"),
            ),
          ],
        ),
      ),
    );
  }
}

class _LectureManagmentView extends StatelessWidget {
  const _LectureManagmentView();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LectureManagmentBloc(),
      child: Builder(
        builder: (context) {
          return Padding(
            padding: 16.0.paddingAll,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ElevatedButton(
                    onPressed: () => navigateToCreateLecture(context),
                    child: const Text("Add new Lecture"),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
