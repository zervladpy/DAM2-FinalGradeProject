import 'package:equatable/equatable.dart';

import 'package:json_annotation/json_annotation.dart';

enum GThemeMode { dark, light, system }

enum GNotificationMode { on, off }

@JsonSerializable(fieldRename: FieldRename.snake)
class Prefferences extends Equatable {
  const Prefferences({
    this.themeMode = GThemeMode.system,
    this.notificationMode = GNotificationMode.on,
  });

  final GThemeMode themeMode;
  final GNotificationMode notificationMode;

  static const String table = 'prefferences';

  Prefferences copyWith({
    GThemeMode? themeMode,
    GNotificationMode? notificationMode,
  }) {
    return Prefferences(
      themeMode: themeMode ?? this.themeMode,
      notificationMode: notificationMode ?? this.notificationMode,
    );
  }

  @override
  List<Object?> get props => [themeMode, notificationMode];
}
