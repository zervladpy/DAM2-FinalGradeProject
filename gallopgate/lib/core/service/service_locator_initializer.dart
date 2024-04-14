import 'package:gallopgate/core/service/i_service.dart';
import 'package:gallopgate/utils/locator/locator.dart';

class LocatorServiceInitializer extends IService {
  @override
  Future<void> init() async {
    GLocator().init();
  }

}