
import 'package:gallopgate/models/lesson_member/lesson_member.dart';
import 'package:gallopgate/models/organization/organization.dart';
import 'package:gallopgate/models/profile/profile.dart';
import 'package:gallopgate/models/profile/profile_dto.dart';
import 'package:intl/intl.dart';

abstract class GJsonUtils {
  static List<String> getLessonMemberIds(List<LessonMember>? items) {
    return items?.map((e) => e.id!).toList() ?? [];
  }

  static String? includeIfEmpty(String value) {
    return value.isEmpty ? null : value;
  }

  static String? getProfileId(Profile? profile) {
    return profile?.id;
  }

  static String? getProfileDtoId(ProfileDto? profile) {
    return profile?.id;
  }

  static String? getOrganizationId(Organization? organization) {
    return organization?.id;
  }

  static Organization? getOrganization(Map<String, dynamic>? json) {
    return json != null ? Organization.fromJson(json) : null;
  }

  static Profile? getProfile(Map<String, dynamic>? json) {
    return json != null ? Profile.fromJson(json) : null;
  }

  static String? toTime(DateTime? time) {
    if (time == null) return null;
    return DateFormat.Hms().format(time);
  }

  static DateTime? fromTime(String? time) {
    if (time == null) return null;
    return DateFormat.Hms().parse(time);
  }
}
