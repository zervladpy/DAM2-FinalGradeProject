import 'dart:async';
import 'dart:developer';

import 'package:gallopgate/models/profile/profile.dart';
import 'package:gallopgate/models/profile/profile_preview_dto.dart';
import 'package:gallopgate/models/role/role.dart';
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

  Stream<List<ProfilePreviewDto>> watchAll(String organizationId) {
    return query
        .select(
            'id, first_name, last_name, avatar_url, profile_role ( roles (name) )')
        .eq('organization_id', organizationId)
        .asStream()
        .map((event) {
      log(event.toString());
      return event.map(ProfilePreviewDto.fromJson).toList();
    });
  }

  Future<Profile?> currentProfile() async {
    return client.auth.currentUser != null
        ? fetchProfile(client.auth.currentUser!.id)
        : null;
  }

  Future<Profile?> fetchProfile(String id) async {
    Profile profile = await client
        .from(Profile.table)
        .select('*')
        .eq('id', id)
        .single()
        .withConverter(Profile.fromJson);

    List<Role> roles = await client
        .from('profile_role')
        .select('roles (*)')
        .eq('profile_id', profile.id!)
        .withConverter(
      (records) {
        log(records.toString());
        return records.map(
          (record) {
            var role = Role.fromJson(record['roles']);
            log(role.toString());
            return role;
          },
        ).toList();
      },
    );

    profile = profile.copyWith(roles: roles);

    return profile..copyWith(roles: roles);
  }

  Future<Profile?> updateProfile(Profile profile) async {
    Profile res = await client
        .from(Profile.table)
        .update(profile.toJson())
        .eq('id', profile.id!)
        .select()
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

  Future<List<Profile>> fetchAllProfiles(String organizationId) {
    return client
        .from(Profile.table)
        .select()
        .eq('organization_id', organizationId)
        .withConverter((v) => v.map(Profile.fromJson).toList());
  }
}
