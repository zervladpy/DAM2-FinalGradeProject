part of 'manage_bloc.dart';

enum ManageStatus { initial, loading, success, failure }

class ManageState extends Equatable {
  const ManageState._(this.status, this.profiles, this.lessons);

  final ManageStatus status;
  final List<ProfilePreviewDto> profiles;
  final List<LessonPreviewDto> lessons;

  factory ManageState.initial() => const ManageState._(
        ManageStatus.initial,
        [],
        [],
      );

  ManageState copyWith({
    ManageStatus? status,
    List<ProfilePreviewDto>? profiles,
    List<LessonPreviewDto>? lessons,
  }) {
    return ManageState._(
      status ?? this.status,
      profiles ?? this.profiles,
      lessons ?? this.lessons,
    );
  }

  @override
  List<Object> get props => [status, profiles, lessons];
}
