import 'package:firebase_core/firebase_core.dart';
import 'package:gallopgate/core/service/i_service.dart';
import 'package:gallopgate/utils/firebase/firebase_options.dart';

class FirebaseServiceInitializer extends IService {
  @override
  Future<void> init() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform
    );
  }
}