import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallopgate/ui/screens/horse_create/bloc/horse_create_bloc.dart';

class HorseCreatePage extends StatelessWidget {
  const HorseCreatePage({super.key});

  static const page = MaterialPage(child: HorseCreatePage());

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HorseCreateBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Create Horse'),
        ),
      ),
    );
  }
}
