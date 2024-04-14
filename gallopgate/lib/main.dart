import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallopgate/core/service/service_firebase_initializer.dart';
import 'package:gallopgate/core/service/service_locator_initializer.dart';
import 'package:gallopgate/core/service/service_widget_initializer.dart';
import 'package:gallopgate/features/_common/controller/controller_auth/auth_cubit.dart';
import 'package:gallopgate/features/app/app.dart';

Future<void> main() async {
  // --- Instantiate Services --- //
  await WidgetServiceInitializer().init();
  await FirebaseServiceInitializer().init();
  await LocatorServiceInitializer().init();

  // --- Run APP --- //
  runApp(MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthCubit(context)),
      ],
      child: const GApp(),
  )
  );
}
