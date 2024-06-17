import 'package:flutter/material.dart';

class GListTile extends StatelessWidget {
  const GListTile({
    super.key,
    required this.item,
    this.contentPadding,
  });

  final ListTileItem item;
  final EdgeInsets? contentPadding;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: item.leading,
      contentPadding: contentPadding,
      title: Text(item.title),
      subtitle: item.subtitle != null ? Text(item.subtitle!) : null,
      trailing: item.trailing,
      onTap: item.navigate,
    );
  }
}

class ListTileItem {
  ListTileItem({
    required this.title,
    this.subtitle,
    this.leading,
    this.trailing,
    this.navigate,
  });

  final String title;
  final String? subtitle;
  final Widget? leading;
  final Widget? trailing;
  final void Function()? navigate;
}
