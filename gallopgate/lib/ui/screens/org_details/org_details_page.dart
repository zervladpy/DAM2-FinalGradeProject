import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallopgate/config/dependency_injection/locator_intializer.dart';
import 'package:gallopgate/ui/screens/error_not_found/error_not_found_page.dart';
import 'package:gallopgate/ui/screens/loading_page/loading_page.dart';
import 'package:gallopgate/ui/screens/org_details/bloc/org_details_bloc.dart';

class OrgDetailsPage extends StatelessWidget {
  const OrgDetailsPage({
    super.key,
    required this.organizationId,
  });

  static page(String organizationId) => MaterialPage(
        child: OrgDetailsPage(
          organizationId: organizationId,
        ),
      );

  final String organizationId;

  @override
  Widget build(BuildContext context) {
    log('OrgDetailsPage: $organizationId');

    return BlocProvider(
      create: (_) {
        return OrgDetailsBloc(locator.get())
          ..add(OrgDetailsFetch(organizationId));
      },
      child: const _OrgDetailsPage(),
    );
  }
}

class _OrgDetailsPage extends StatelessWidget {
  const _OrgDetailsPage();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrgDetailsBloc, OrgDetailsState>(
      buildWhen: (prev, curr) => prev.status != curr.status,
      builder: (context, state) {
        return switch (state.status) {
          OrgDetailsStatus.loading => const LoadingPage(),
          OrgDetailsStatus.success => const _OrgDetailsContent(),
          _ => const ErrorNotFoundPage(),
        };
      },
    );
  }
}

class _OrgDetailsContent extends StatelessWidget {
  const _OrgDetailsContent();

  /// TODO: Add a form to request for joining the organization

  @override
  Widget build(BuildContext context) {
    final state = context.watch<OrgDetailsBloc>().state;

    return Scaffold(
      appBar: AppBar(
        title: Text(state.item.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Description:"),
                const SizedBox(height: 8.0),
                Text(state.item.description),
              ],
            ),
            const SizedBox(height: 16.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Creator:"),
                const SizedBox(height: 8.0),
                Text(state.item.creator.name),
              ],
            )
          ],
        ),
      ),
    );
  }
}
