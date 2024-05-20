import 'package:gallopgate/v2/models/profile.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProfileRepository {
  const ProfileRepository({
    required this.client,
  });

  final SupabaseClient client;

  Future<Profile?> currentProfile() async {
    return client.auth.currentUser != null
        ? fetchProfile(client.auth.currentUser!.id)
        : null;
  }

  Future<Profile?> fetchProfile(String id) {
    return client
        .from(Profile.table)
        .select()
        .eq(
          'id',
          id,
        )
        .single()
        .withConverter(Profile.fromJson);
  }

  Future<Profile?> updateProfile(Profile profile) async {
    Profile res = await client
        .from(Profile.table)
        .update(profile.toJson())
        .eq('id', profile.id)
        .single()
        .withConverter(Profile.fromJson);

    return res;
  }

  Future<Profile?> fetchProfileByOrganization(String organizationId) async {
    return client
        .from(Profile.table)
        .select()
        .eq(
          'organization_id',
          organizationId,
        )
        .single()
        .withConverter(Profile.fromJson);
  }
}
