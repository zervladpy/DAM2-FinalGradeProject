import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallopgate/v1/features_v1/organization/presentation/controllers/bloc/join_organization_bloc.dart';
import 'package:iconsax/iconsax.dart';

class JoinOrganizationPage extends StatelessWidget {
  const JoinOrganizationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // search field
        TextField(
          decoration: InputDecoration(
            hintText: 'Search organization',
            prefixIcon: const Icon(Iconsax.search_normal_1),
            suffixIcon: IconButton(
              onPressed: () {},
              icon: const Icon(Iconsax.filter),
            ),
          ),
        ),

        // list of organizations
        BlocBuilder<JoinOrganizationBloc, JoinOrganizationState>(
          buildWhen: (prev, curr) => prev.items != curr.items,
          builder: (context, state) {
            if (state.items.isEmpty) {
              return const Center(
                child: Text("No organization found"),
              );
            }

            return ListView.builder(
              itemCount: state.items.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final organization = state.items[index];
                return ListTile(
                  title: Text(organization.name),
                  subtitle: Text(organization.description),
                );
              },
            );
          },
        )
      ],
    );
  }
}
