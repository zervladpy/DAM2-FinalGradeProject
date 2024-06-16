import 'package:gallopgate/models/profile/profile.dart';
import 'package:gallopgate/repositories/profile_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

enum AuthStatus {
  authenticated,
  unauthenticated,
}

class AuthRepository {
  AuthRepository({
    required this.client,
    required this.profileRepository,
  });

  final SupabaseClient client;
  final ProfileRepository profileRepository;

  Profile? currentProfile;

  Stream<AuthStatus> get authStateChanges {
    return client.auth.onAuthStateChange.map((state) {
      return state.session != null
          ? AuthStatus.authenticated
          : AuthStatus.unauthenticated;
    });
  }

  Future<AuthRepository> init() async {
    User? user = client.auth.currentUser;

    if (user != null) {
      try {
        currentProfile = await profileRepository.fetchProfile(user.id);
      } catch (e) {
        await client.auth.signOut();
      }
    }

    return this;
  }

  Future<Profile?> createAccount({
    required String email,
    required String password,
  }) async {
    AuthResponse response = await client.auth.signUp(
        email: email,
        password: password,
        emailRedirectTo: "io.supabase.flutterquickstart://login-callback/");

    if (response.user != null) {
      var res = await client
          .from(Profile.table)
          .select()
          .eq(
            'id',
            response.user!.id,
          )
          .single()
          .withConverter(Profile.fromJson);
      currentProfile = res;
      return res;
    }

    return null;
  }

  Future<Profile?> login({
    required String email,
    required String password,
  }) async {
    AuthResponse response = await client.auth.signInWithPassword(
      email: email,
      password: password,
    );

    if (response.user != null) {
      var res = await client
          .from(Profile.table)
          .select()
          .eq(
            'id',
            response.user!.id,
          )
          .single()
          .withConverter(Profile.fromJson);

      currentProfile = res;
      return res;
    }

    return null;
  }

  Future<void> logout() async {
    currentProfile = null;
    await client.auth.signOut();
  }
}
