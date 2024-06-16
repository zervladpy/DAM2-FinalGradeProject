import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallopgate/common/enums/status.dart';
import 'package:gallopgate/common/utils/date_utils.dart';
import 'package:gallopgate/config/dependency_injection/locator_intializer.dart';
import 'package:gallopgate/config/extensions/context.dart';
import 'package:gallopgate/ui/screens/org_details/bloc/org_details_bloc.dart';
import 'package:gallopgate/ui/screens/org_details/widgets/org_details.library.dart';
import 'package:gallopgate/ui/widgets/containers/image_picker_container.dart';
import 'package:gallopgate/ui/widgets/loading/sliver_linear_loading.dart';

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
    return Scaffold(
      body: BlocProvider(
        create: (_) {
          return OrgDetailsBloc(
            organizationRepository: locator.get(),
          )..add(OrgDetailsFetch(organizationId));
        },
        child: const _OrgDetailsPage(),
      ),
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
        if (state.status == Status.loading) {
          return RefreshIndicator(
            onRefresh: () async {
              context
                  .read<OrgDetailsBloc>()
                  .add(OrgDetailsFetch(state.item.id!));
            },
            child: const CustomScrollView(
              slivers: [
                OrgDetailsAppBar(),
                SliverLinearLoading(),
              ],
            ),
          );
        }

        return Stack(
          children: [
            CustomScrollView(
              slivers: [
                OrgDetailsAppBar(organization: state.item),
                SliverPadding(
                  padding: const EdgeInsets.all(16.0),
                  sliver: SliverToBoxAdapter(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ImagePickerContainer(
                              imageUrl: state.item.logoUrl,
                              editable: false,
                            ),
                            Text(
                              state.item.name,
                              style: context.textTheme.titleLarge,
                              overflow: TextOverflow.ellipsis,
                            )
                          ],
                        ),
                        const SizedBox(height: 16.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Created At',
                              style: context.textTheme.bodyMedium,
                            ),
                            Text(
                              GDateUtils.formatDateToString(
                                state.item.createdAt ?? DateTime.now(),
                              ),
                              style: context.textTheme.bodyLarge,
                            ),
                          ],
                        ),
                        const SizedBox(height: 16.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Description',
                              style: context.textTheme.bodyMedium,
                            ),
                            const SizedBox(height: 8.0),
                            Text(
                              state.item.description,
                              style: context.textTheme.bodyLarge,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            const _ApplyButton(),
          ],
        );
      },
    );
  }
}

class _ApplyButton extends StatelessWidget {
  const _ApplyButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 16.0,
      left: 16.0,
      right: 16.0,
      child: ElevatedButton(
        onPressed: () => _onApply(context),
        child: const Text('Apply'),
      ),
    );
  }

  void _onApply(BuildContext context) {}
}
