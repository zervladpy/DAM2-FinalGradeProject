import 'package:gallopgate/common/interfaces/initializer.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabeseInitializer extends Initializer {
  @override
  Future<void> init() async {
    await Supabase.initialize(
      url: 'https://nmawcdwvqnmokamzjgjj.supabase.co',
      anonKey:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im5tYXdjZHd2cW5tb2thbXpqZ2pqIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTYxODczMTAsImV4cCI6MjAzMTc2MzMxMH0.qONVqPkRjZMkqcKSuVy-5ZhKn5_jSBm4r_6qGF47MrA',
      authOptions: const FlutterAuthClientOptions(
        authFlowType: AuthFlowType.pkce,
      ),
      realtimeClientOptions: const RealtimeClientOptions(
        logLevel: RealtimeLogLevel.info,
      ),
      storageOptions: const StorageClientOptions(
        retryAttempts: 10,
      ),
    );
  }
}
