import 'package:flutter/material.dart';
import 'package:gallopgate/common/utils/date_utils.dart';
import 'package:gallopgate/config/extensions/context.dart';
import 'package:gallopgate/ui/widgets/tiles/list_tile.dart';
import 'package:iconsax/iconsax.dart';

class TimeTile extends StatelessWidget {
  const TimeTile({
    super.key,
    required this.title,
    required this.date,
    this.leading = Iconsax.clock,
    this.selectDuration,
  });

  final IconData leading;
  final String title;
  final DateTime date;
  final Function()? selectDuration;

  @override
  Widget build(BuildContext context) {
    final time = GDateUtils.formatTimeToString(date);

    return GListTile(
      item: ListTileItem(
        title: title,
        leading: Icon(leading),
        navigate: selectDuration,
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              time,
              style: context.textTheme.bodyLarge,
            ),
            const SizedBox(width: 16.0),
            const Icon(Iconsax.arrow_right_3),
          ],
        ),
      ),
    );
  }
}
