import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallopgate/ui/screens/main_manage/widgets/buttons/manage_add_button.dart';
import 'package:gallopgate/ui/wrappers/main_wrapper/main_bloc/main_bloc.dart';
import 'package:go_router/go_router.dart';

class ManageHorsesContent extends StatelessWidget {
  const ManageHorsesContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // -- List View
        AddButton(
          label: "Add a horse",
          onPressed: () {
            context.push('/horses/create', extra: {
              'organization_id': context.read<MainBloc>().state.organization.id,
            });
          },
        )
      ],
    );
  }
}
