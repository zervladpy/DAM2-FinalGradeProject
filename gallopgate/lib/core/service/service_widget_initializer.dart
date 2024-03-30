import 'package:flutter/widgets.dart';
import 'package:gallopgate/core/service/i_service.dart';

class WidgetServiceInitializer extends IService {
  @override
  Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
  }

}