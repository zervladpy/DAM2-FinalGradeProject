part of 'main_bloc.dart';

abstract class MainEvent extends Equatable {
  const MainEvent();
}

class MainEventInitialize extends MainEvent {
  const MainEventInitialize(this.profileId);

  final String profileId;

  @override
  List<Object> get props => [profileId];
}

class MainEventRefresh extends MainEvent {
  const MainEventRefresh();

  @override
  List<Object> get props => [];
}
