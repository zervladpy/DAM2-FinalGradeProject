import 'package:flutter/material.dart';
import 'package:gallopgate/ui/screens/main_manage/widgets/buttons/manage_add_button.dart';
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
            context.push('/horses/create');
          },
        )
      ],
    );
  }
}
