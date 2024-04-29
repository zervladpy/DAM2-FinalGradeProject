import 'package:flutter/material.dart';
import 'package:gallopgate/features/_common/widgets/text/text.dart';
import 'package:gallopgate/utils/constraints/_constraints_library.dart';

class GListTile extends StatelessWidget {
  const GListTile({
    super.key,
    required this.title,
    this.subtitle,
    this.leading,
    this.trailing,
    this.onTap,
  });

  final String title;
  final Widget? subtitle;
  final Widget? leading;
  final Widget? trailing;

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(GSizes.borderRadiusSm),
      ),
      leading: leading,
      title: GText(
        text: title,
        style: Theme.of(context).textTheme.displaySmall,
      ),
      subtitle: subtitle,
      trailing: trailing,
      onTap: onTap,
    );
  }
}
