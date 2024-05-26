part of 'manage_bloc.dart';

abstract class ManageEvent extends Equatable {
  const ManageEvent();
}

class ManageEventInitialize extends ManageEvent {
  const ManageEventInitialize();

  @override
  List<Object> get props => [];
}

class ManageEventLessonsUpdated extends ManageEvent {
  final List<LessonPreviewDto> lessons;

  const ManageEventLessonsUpdated(this.lessons);

  @override
  List<Object> get props => [lessons];
}

class ManageEventProfilesUpdated extends ManageEvent {
  final List<ProfilePreviewDto> profiles;

  const ManageEventProfilesUpdated(this.profiles);

  @override
  List<Object> get props => [profiles];
}
