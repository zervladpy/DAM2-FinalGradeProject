import 'dart:async';
import 'dart:developer';

import 'package:gallopgate/models/profile/profile.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProfileRepository {
  ProfileRepository(this.client) : query = client.from(Profile.table);

  final SupabaseClient client;
  final SupabaseQueryBuilder query;

  Stream<Profile?> watch(String id) {
    return query.select().eq('id', id).asStream().map((event) {
      return event.isNotEmpty ? Profile.fromJson(event.first) : null;
    });
  }

  Future<Profile?> currentProfile() async {
    final auth = client.auth;

    if (auth.currentUser == null) {
      try {
        auth.signOut();
        return null;
      } catch (e) {
        return null;
      }
    }

    if (auth.currentUser?.id == null) {
      try {
        auth.signOut();
        return null;
      } catch (e) {
        return null;
      }
    }

    try {
      final profile = await fetchProfile(client.auth.currentUser!.id);

      return profile;
    } catch (e) {
      await auth.signOut();
      return null;
    }
  }

  Future<Profile?> fetchProfile(String id) async {
    return await client
        .from(Profile.table)
        .select('*, profile_role ( roles (id, name))')
        .eq('id', id)
        .single()
        .withConverter(Profile.fromJson);
  }

  Future<Profile?> updateProfile(Profile profile) async {
    Profile res = await client
        .from(Profile.table)
        .update(profile.toJson())
        .eq('id', profile.id)
        .select()
        .single()
        .withConverter(Profile.fromJson);

    return res;
  }

  Future<Profile?> fetchProfileByOrganization(String organizationId) async {
    return client
        .from(Profile.table)
        .select('*, profile_role ( roles (id, name))')
        .eq('organization_id', organizationId)
        .single()
        .withConverter(Profile.fromJson);
  }

  Future<Profile?> createProfile(Profile profile) async {
    List<int> roleIds = profile.roles.map((e) => e.id).toList();

    return await client
        .from(Profile.table)
        .insert(profile.toJson())
        .select()
        .single()
        .then((value) async {
      if (roleIds.isEmpty) return;

      List<Map<String, dynamic>> relation = roleIds.map((roleId) {
        return {'profile_id': value['id'], 'role_id': roleId};
      }).toList();

      await client.from('profile_role').insert(relation);
      return null;
    });
  }

  Future<List<Profile>> fetchProfiles(String organizationId) {
    log('fetching profiles');
    return client
        .from(Profile.table)
        .select('*, profile_role ( roles (id, name))')
        .eq('organization_id', organizationId)
        .withConverter((v) => v.map(Profile.fromJson).toList());
  }

  Future<List<Profile>> fetchRiders(String organizationId) async {
    List<Profile> profiles = await fetchProfiles(organizationId);

    return profiles
        .where((p) => p.roles.map((r) => r.name).contains('rider'))
        .toList();
  }

  Future<List<Profile>> fetchInstructors(String organizationId) async {
    List<Profile> profiles = await fetchProfiles(organizationId);

    return profiles
        .where((p) => p.roles.map((r) => r.name).contains('instructor'))
        .toList();
  }
}
