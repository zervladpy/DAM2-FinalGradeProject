import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallopgate/common/enums/status.dart';
import 'package:gallopgate/config/dependency_injection/locator_intializer.dart';
import 'package:gallopgate/ui/screens/org_explore/bloc/org_explore_bloc.dart';
import 'package:gallopgate/ui/screens/org_explore/widgets/org_explore.library.dart';
import 'package:gallopgate/ui/widgets/loading/sliver_linear_loading.dart';
import 'package:go_router/go_router.dart';

class OrgExplorePage extends StatelessWidget {
  const OrgExplorePage({super.key});

  static const page = MaterialPage(child: OrgExplorePage());

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrgExploreBloc(
        locator.get(),
      )..add(const OrgExploreFetch()),
      child: const Scaffold(
        body: _OrgExplorePage(),
      ),
    );
  }
}

class _OrgExplorePage extends StatelessWidget {
  const _OrgExplorePage();

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        _ExploreContent(),
        _CreateCenterButton(),
      ],
    );
  }
}

class _ExploreContent extends StatelessWidget {
  const _ExploreContent();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrgExploreBloc, OrgExploreState>(
      buildWhen: (curr, prev) => curr.status != prev.status,
      builder: (context, state) {
        if (state.status == Status.loading) {
          return const CustomScrollView(
            slivers: [
              OrgExploreAppbar(),
              SliverLinearLoading(),
            ],
          );
        }

        return CustomScrollView(
          slivers: [
            const OrgExploreAppbar(),
            SliverPadding(
              padding: const EdgeInsets.all(16),
              sliver: OrgExploreListView(
                items: context.watch<OrgExploreBloc>().state.items,
              ),
            )
          ],
        );
      },
    );
  }
}

class _CreateCenterButton extends StatelessWidget {
  const _CreateCenterButton();

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 16,
      right: 16,
      left: 16,
      child: ElevatedButton(
        onPressed: () {
          context.push('/organizations/create');
        },
        child: const Text('Or create one!'),
      ),
    );
  }
}
