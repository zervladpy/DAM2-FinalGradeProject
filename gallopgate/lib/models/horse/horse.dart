import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'horse.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class Horse extends Equatable {
  const Horse({
    this.id,
    required this.fullName,
    required this.organizationId,
    this.alias,
    this.birthDate,
    this.ownerId,
  });

  final String? id;
  final String fullName;
  final String? alias;
  final DateTime? birthDate;
  final String organizationId;
  final String? ownerId;

  static const table = 'horses';

  static const empty = Horse(
    fullName: '',
    organizationId: '',
  );

  Horse copyWith({
    String? id,
    String? fullName,
    String? alias,
    DateTime? birthDate,
    String? organizationId,
    String? ownerId,
  }) {
    return Horse(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      alias: alias ?? this.alias,
      birthDate: birthDate ?? this.birthDate,
      organizationId: organizationId ?? this.organizationId,
      ownerId: ownerId ?? this.ownerId,
    );
  }

  factory Horse.fromJson(Map<String, dynamic> json) => _$HorseFromJson(json);

  Map<String, dynamic> toJson() => _$HorseToJson(this);

  @override
  List<Object?> get props => [
        id,
        fullName,
        alias,
        birthDate,
        organizationId,
        ownerId,
      ];
}
