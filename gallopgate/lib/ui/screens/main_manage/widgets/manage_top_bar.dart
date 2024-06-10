import 'package:flutter/material.dart';
import 'package:gallopgate/common/utils/theme_utils.dart';
import 'package:iconsax/iconsax.dart';

class ManageTopBar extends StatelessWidget {
  const ManageTopBar({
    super.key,
    required this.count,
    required this.onAddPressed,
    this.toolTip,
    this.onFilterPressed,
  });

  final String? toolTip;
  final void Function()? onFilterPressed;
  final void Function() onAddPressed;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Filter',
                  prefixIcon: Icon(Iconsax.search_normal_1),
                  suffixIcon: IconButton(
                    onPressed: null,
                    icon: Icon(Iconsax.filter),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 5.0),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: GThemeUtils.getPrimaryColor(context),
              ),
              padding: const EdgeInsets.all(0),
              margin: const EdgeInsets.all(0),
              child: Expanded(
                child: IconButton(
                  tooltip: toolTip,
                  onPressed: onAddPressed,
                  icon: const Icon(Iconsax.add),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 5.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('Total: $count'),
          ],
        ),
      ],
    );
  }
}
