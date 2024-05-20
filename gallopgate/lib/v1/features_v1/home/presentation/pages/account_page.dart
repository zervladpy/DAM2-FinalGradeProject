import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallopgate/v1/common/controllers/auth_bloc/auth_bloc.dart';
import 'package:gallopgate/v1/common/controllers/cache_bloc/cache_bloc.dart';
import 'package:gallopgate/v1/config/extension/double.dart';
import 'package:gallopgate/v1/config/navigation/navigation.dart';
import 'package:iconsax/iconsax.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Account"),
        scrolledUnderElevation: 0.0,
      ),
      body: const _AccountPage(),
    );
  }
}

class _AccountPage extends StatelessWidget {
  const _AccountPage();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: 16.0.paddingAll,
      child: Column(
        children: [
          const _ProfileDetails(),
          const Divider(),
          const SizedBox(height: 16.0),
          Expanded(
            child: SingleChildScrollView(
              primary: true,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text("Account Settings"),
                  ListTile(
                    leading: const Icon(Iconsax.user_edit),
                    title: const Text("Edit account details"),
                    onTap: () => navigateToUserDetails(context),
                  ),
                  ListTile(
                    leading: const Icon(Iconsax.security),
                    title: const Text("Privacy"),
                    onTap: () {},
                  ),
                  const Divider(),
                  const SizedBox(height: 16.0),
                  const Text("App Settings"),
                  ListTile(
                    leading: const Icon(Iconsax.sun_1),
                    title: const Text("App theme mode"),
                    trailing: DropdownMenu(
                      inputDecorationTheme: InputDecorationTheme(
                        contentPadding: 16.0.paddingAll,
                        border: InputBorder.none,
                      ),
                      initialSelection: ThemeMode.system,
                      dropdownMenuEntries: const [
                        DropdownMenuEntry(
                            value: ThemeMode.system, label: "System"),
                        DropdownMenuEntry(
                            value: ThemeMode.light, label: "Light"),
                        DropdownMenuEntry(value: ThemeMode.dark, label: "Dark"),
                      ],
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Iconsax.notification),
                    title: const Text("Push notifications"),
                    trailing: Switch(
                      value: true,
                      onChanged: (value) {},
                    ),
                  ),
                  const Divider(),
                  const SizedBox(height: 16.0),
                  const Text("Help"),
                  const ListTile(
                    leading: Icon(Iconsax.message_question),
                    title: Text("Help"),
                  ),
                  const ListTile(
                    leading: Icon(Iconsax.information),
                    title: Text("Bug report"),
                  ),
                  const ListTile(
                    leading: Icon(Iconsax.designtools),
                    title: Text("App Information"),
                  ),
                  BlocListener<AuthBloc, AuthState>(
                    listenWhen: (prev, curr) => prev.status != curr.status,
                    listener: (context, state) {
                      if (state.status == AuthStatus.unauthenticated) {
                        navigateToLogin(context);
                        context.read<CacheBloc>().add(const ClearCacheEvent());
                      }
                    },
                    child: ListTile(
                      leading: const Icon(Iconsax.logout),
                      title: const Text("Logout"),
                      onTap: () {
                        context.read<AuthBloc>().add(AuthLogoutEvent());
                      },
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _ProfileDetails extends StatelessWidget {
  const _ProfileDetails();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return BlocBuilder<CacheBloc, CacheState>(
      buildWhen: (prev, curr) => prev.user != curr.user,
      builder: (context, state) {
        log(state.user.toString());
        return Row(
          children: [
            const CircleAvatar(
              radius: 40,
            ),
            const SizedBox(width: 16.0),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  state.user.name,
                  style: textTheme.bodyLarge,
                ),
                Text(
                  state.user.email,
                  style: textTheme.bodySmall,
                )
              ],
            ),
            if (state.user.roles.isNotEmpty) const Spacer(),
            if (state.user.roles.isNotEmpty)
              Chip(
                label: Text(state.user.roles.first.name),
                shape: const StadiumBorder(),
              )
          ],
        );
      },
    );
  }
}
