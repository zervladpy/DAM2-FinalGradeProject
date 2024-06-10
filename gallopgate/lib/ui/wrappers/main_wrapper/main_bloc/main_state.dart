part of 'main_bloc.dart';

enum MainStatus { initial, loading, success, failure }

class MainState extends Equatable {
  const MainState._(
    this.status,
    this.profile,
    this.organization,
    this.lectures,
  );

  final MainStatus status;
  final Profile profile;
  final Organization organization;
  final List<LessonCategory> lectures;

  factory MainState.initial() => const MainState._(
        MainStatus.initial,
        Profile.empty,
        Organization.empty,
        [],
      );

  MainState copyWith({
    MainStatus? status,
    Profile? profile,
    Organization? organization,
    List<LessonCategory>? lectures,
  }) =>
      MainState._(
        status ?? this.status,
        profile ?? this.profile,
        organization ?? this.organization,
        lectures ?? this.lectures,
      );

  @override
  List<Object> get props => [status, profile, organization, lectures];
}
