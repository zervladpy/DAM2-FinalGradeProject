import 'package:flutter/material.dart';
import 'package:gallopgate/config/extensions/context.dart';
import 'package:gallopgate/ui/widgets/appbar/sliver_appbar.dart';
import 'package:gallopgate/ui/widgets/text/titles.dart';
import 'package:iconsax/iconsax.dart';

class AuthTermsPage extends StatelessWidget {
  const AuthTermsPage({super.key});

  static get page => const MaterialPage(child: AuthTermsPage());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const GSliverAppBar(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GAppbarTitle('Terms of Service'),
                GAppbarSubtitle('GallopGate'),
              ],
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(16.0),
            sliver: SliverToBoxAdapter(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Terms of Service',
                    style: context.textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 8.0),
                  const Text('Last update on 16 June 2024'),
                  const SizedBox(height: 16.0),
                  const Text(
                    'Welcome to GallopGate. By using our services, you agree to comply with and be bound by the following terms of service. Please review the terms carefully. If you do not agree to these terms, you should not use our services.',
                  ),
                  const SizedBox(height: 16.0),
                  Text(
                    '1. Acceptance of Terms',
                    style: context.textTheme.bodyLarge,
                  ),
                  const Text(
                    'By accessing or using our services, you acknowledge that you have read, understood, and agree to be bound by these terms and any other applicable laws and regulations.',
                  ),
                  const SizedBox(height: 16.0),
                  Text(
                    '2. Privacy and Data Use',
                    style: context.textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 8.0),
                  const Text(
                    'We are committed to protecting your privacy. We do not share your data with any third-party services. All data collected is used solely for the purpose of providing and improving our services.',
                  ),
                  const SizedBox(height: 16.0),
                  Text(
                    '3. Cookies',
                    style: context.textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 8.0),
                  const Text(
                    'The only cookie we use is for user authentication. This cookie is essential for the operation of our website and ensures that you remain logged in during your session.',
                  ),
                  const SizedBox(height: 16.0),
                  Text(
                    '4. User Responsibilities',
                    style: context.textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 8.0),
                  const Row(
                    children: [
                      Icon(Iconsax.tick_square),
                      SizedBox(width: 8.0),
                      Flexible(
                        child: Text(
                          'You agree not to use our services for any unlawful purpose.',
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 8.0),
                  const Row(
                    children: [
                      Icon(Iconsax.tick_square),
                      SizedBox(width: 8.0),
                      Flexible(
                        child: Text(
                          'You agree not to engage in any activity that could harm or disrupt our services.',
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 8.0),
                  const Row(
                    children: [
                      Icon(Iconsax.tick_square),
                      SizedBox(width: 8.0),
                      Flexible(
                        child: Text(
                          'You agree not to use our services to send spam or other unsolicited messages.',
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 8.0),
                  const Row(
                    children: [
                      Icon(Iconsax.tick_square),
                      SizedBox(width: 8.0),
                      Flexible(
                        child: Text(
                          'You agree not to use our services to distribute malware or other harmful software.',
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 8.0),
                  const Row(
                    children: [
                      Icon(Iconsax.tick_square),
                      SizedBox(width: 8.0),
                      Flexible(
                        child: Text(
                          'You agree not to use our services to violate the privacy of others.',
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  Text(
                    '5. Modifications to Terms',
                    style: context.textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 8.0),
                  const Text(
                    'We reserve the right to modify these terms at any time. Any changes will be posted on this page, and your continued use of our services constitutes your acceptance of the new terms.',
                  ),
                  const SizedBox(height: 16.0),
                  Text(
                    '6. Contact Information',
                    style: context.textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 8.0),
                  const Text(
                    'If you have any questions about these terms, please contact us at a19vladislavz@iessnaclemnte.net',
                  ),
                  const SizedBox(height: 16.0),
                  Text(
                    'By using our services, you agree to these terms. Thank you for choosing GallopGate.',
                    style: context.textTheme.bodyLarge,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
