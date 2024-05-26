import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallopgate/config/dependency_injection/locator_intializer.dart';
import 'package:gallopgate/repositories/auth_repository.dart';
import 'package:gallopgate/ui/screens/main_settings/widgets/settings_profile_card.dart';
import 'package:gallopgate/ui/wrappers/main_wrapper/main_bloc/main_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class MainSettingsPage extends StatelessWidget {
  const MainSettingsPage({super.key});

  static const page = MaterialPage(child: MainSettingsPage());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account'),
      ),
      body: const _MainSettingsPage(),
    );
  }
}

class _MainSettingsPage extends StatelessWidget {
  const _MainSettingsPage();

  @override
  Widget build(BuildContext context) {
    final profile = context.watch<MainBloc>().state.profile;
    final addBadge = profile.firstName.isEmpty || profile.lastName.isEmpty;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SettingsProfileCard(profile: profile),
            const Divider(),
            const SizedBox(height: 16.0),
            const Text("Account settings"),
            ListTile(
              leading: const Icon(Iconsax.user_edit),
              title: const Text('Account details'),
              subtitle: const Text('Edit your account details'),
              trailing: Badge(
                isLabelVisible: addBadge,
                child: const Icon(Iconsax.arrow_right_3),
              ),
              onTap: () {
                context.push('/users/${profile.id}/edit');
              },
            ),
            const ListTile(
              leading: Icon(Iconsax.notification),
              title: Text('Notifications'),
              subtitle: Text('Enable or disable notifications'),
            ),
            const ListTile(
              leading: Icon(Iconsax.sun_1),
              title: Text('Theme mode'),
              subtitle: Text('Set your preffered theme mode'),
            ),
            const SizedBox(height: 16.0),
            const Text("Security settings"),
            const ListTile(
              leading: Icon(Iconsax.lock),
              title: Text('Change password'),
              subtitle: Text('Change your password'),
            ),
            const ListTile(
              leading: Icon(Iconsax.shield),
              title: Text('Two-factor authentication'),
              subtitle: Text('Enable or disable two-factor authentication'),
            ),
            const SizedBox(height: 16.0),
            const Text("Support"),
            const ListTile(
              leading: Icon(Iconsax.info_circle),
              title: Text('Help & support'),
              subtitle: Text('Get help and support'),
            ),
            const ListTile(
              leading: Icon(Iconsax.message_question),
              title: Text('Contact us'),
              subtitle: Text('Contact us for more information'),
            ),
            ListTile(
              leading: const Icon(Iconsax.logout),
              title: const Text('Logout'),
              subtitle: const Text('Logout from your account'),
              onTap: () async {
                context.go('/auth');
                await locator.get<AuthRepository>().logout();
              },
            ),
          ],
        ),
      ),
    );
  }
}
