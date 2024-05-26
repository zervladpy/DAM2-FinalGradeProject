import 'package:gallopgate/common/interfaces/initializer.dart';
import 'package:gallopgate/repositories/auth_repository.dart';
import 'package:gallopgate/repositories/lecture_repository.dart';
import 'package:gallopgate/repositories/organization_repository.dart';
import 'package:gallopgate/repositories/profile_repository.dart';
import 'package:gallopgate/repositories/role_repository.dart';
import 'package:gallopgate/repositories/schedule_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

GetIt locator = GetIt.instance;

class LocatorInitializer extends Initializer {
  @override
  Future<void> init() async {
    locator.registerSingleton(Supabase.instance.client);

    locator.registerSingleton(ProfileRepository(locator.get()));

    var authRepo = await AuthRepository(
      client: locator.get(),
      profileRepository: locator.get(),
    ).init();

    locator.registerSingleton(authRepo);

    locator.registerSingleton(OrganizationRepository(locator.get()));

    locator.registerSingleton(ScheduleRepository(client: locator.get()));

    locator.registerSingleton(LectureRepository(
      client: locator.get(),
      scheduleRepository: locator.get(),
    ));

    locator.registerSingleton(RoleRepository(locator.get()));
  }
}
