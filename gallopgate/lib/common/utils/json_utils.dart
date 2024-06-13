import 'dart:developer';

import 'package:gallopgate/models/organization/organization.dart';
import 'package:gallopgate/models/profile/profile.dart';
import 'package:intl/intl.dart';

abstract class GJsonUtils {
  static String? includeIfEmpty(String value) {
    return value.isEmpty ? null : value;
  }

  static String? getProfileId(Profile? profile) {
    return profile?.id;
  }

  static String? getOrganizationId(Organization? organization) {
    return organization?.id;
  }

  static Organization? getOrganization(Map<String, dynamic>? json) {
    log(json.toString());

    return json != null ? Organization.fromJson(json) : null;
  }

  static Profile? getProfile(Map<String, dynamic>? json) {
    log(json.toString());
    return json != null ? Profile.fromJson(json) : null;
  }

  static String? toTime(DateTime? time) {
    if (time == null) return null;
    return DateFormat.Hms().format(time);
  }
}
