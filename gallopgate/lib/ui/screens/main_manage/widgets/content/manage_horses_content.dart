import 'package:flutter/material.dart';
import 'package:gallopgate/models/horse/horse.dart';
import 'package:gallopgate/ui/screens/loading_page/loading_page.dart';
import 'package:go_router/go_router.dart';

class ManageHorsesContent extends StatelessWidget {
  const ManageHorsesContent({
    super.key,
    required this.fetch,
  });

  final Future<List<Horse>?> Function() fetch;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: FutureBuilder(
        future: fetch(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LoadingPage();
          }

          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }

          final horses = snapshot.data as List<Horse>;

          return ListView(
            primary: true,
            children: [
              _HorseCount(count: horses.length),
              const SizedBox(height: 16),
              _HorseListView(horses: horses),
            ],
          );
        },
      ),
    );
  }
}

class _HorseCount extends StatelessWidget {
  const _HorseCount({super.key, required this.count});

  final int count;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text('Total: $count'),
      ],
    );
  }
}

class _HorseListView extends StatelessWidget {
  const _HorseListView({super.key, required this.horses});

  final List<Horse> horses;

  @override
  Widget build(BuildContext context) {
    void navigateToHorseDetail(String id) {
      context.push('/horses/$id');
    }

    return ListView.separated(
      itemCount: horses.length,
      primary: false,
      shrinkWrap: true,
      separatorBuilder: (context, index) {
        return const SizedBox(height: 5.0);
      },
      itemBuilder: (context, index) {
        return _HorseListTile(
          horse: horses[index],
          onTap: navigateToHorseDetail,
        );
      },
    );
  }
}

class _HorseListTile extends StatelessWidget {
  const _HorseListTile({
    super.key,
    required this.horse,
    this.onTap,
  });

  final Horse horse;
  final void Function(String id)? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(horse.fullName),
      subtitle: Text(horse.alias ?? ' - '),
      leading: CircleAvatar(
        child: Text(horse.fullName.substring(0, 1)),
      ),
      onTap: () => onTap?.call(horse.id!),
    );
  }
}
