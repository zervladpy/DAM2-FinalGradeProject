import 'package:flutter/material.dart';
import 'package:gallopgate/common/utils/date_utils.dart';
import 'package:gallopgate/models/organization/organization.dart';
import 'package:gallopgate/ui/widgets/tiles/list_tile.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class OrgExploreListView extends StatelessWidget {
  const OrgExploreListView({
    super.key,
    this.items = const [],
  });

  final List<Organization> items;

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return GListTile(
          item: ListTileItem(
            navigate: () => context.push('/organizations/${item.id}'),
            leading: const Icon(Iconsax.building),
            title: item.name,
            subtitle: GDateUtils.formatDateToString(
              item.createdAt ?? DateTime.now(),
            ),
          ),
        );
      },
    );
  }
}
