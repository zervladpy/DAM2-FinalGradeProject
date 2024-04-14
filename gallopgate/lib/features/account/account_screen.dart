import 'package:flutter/material.dart';
import 'package:gallopgate/features/_common/widgets/appbar/appbar.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  static Page<AccountScreen> get page =>
      const MaterialPage(child: AccountScreen());

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: GAppBar(
        title: Text('My Account'),
      ),
    );
  }
}
