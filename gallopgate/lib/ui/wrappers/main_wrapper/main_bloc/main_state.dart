part of 'main_bloc.dart';

enum MainStatus { initial, loading, success, failure }

class MainState extends Equatable {
  const MainState._(
    this.status,
    this.profile,
    this.organization,
    this.lessons,
    this.error,
  );

  final MainStatus status;
  final Profile profile;
  final Organization organization;
  final List<Lesson> lessons;
  final String error;

  factory MainState.initial() => const MainState._(
        MainStatus.initial,
        Profile.empty,
        Organization.empty,
        [],
        '',
      );

  MainState copyWith({
    MainStatus? status,
    Profile? profile,
    Organization? organization,
    List<Lesson>? lessons,
    String? error,
  }) =>
      MainState._(
        status ?? this.status,
        profile ?? this.profile,
        organization ?? this.organization,
        lessons ?? this.lessons,
        error ?? this.error,
      );

  @override
  List<Object> get props => [status, profile, organization, lessons, error];
}
