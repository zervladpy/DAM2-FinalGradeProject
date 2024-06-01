part of 'horse_create_bloc.dart';

abstract class HorseCreateEvent extends Equatable {
  const HorseCreateEvent();

  @override
  List<Object> get props => [];
}

class HorseCreateInitialize extends HorseCreateEvent {
  const HorseCreateInitialize();
}

class HorseCreateNameChanged extends HorseCreateEvent {
  const HorseCreateNameChanged(this.value);

  final String value;

  @override
  List<Object> get props => [value];
}

class HorseCreateAliasChanged extends HorseCreateEvent {
  const HorseCreateAliasChanged(this.value);

  final String value;

  @override
  List<Object> get props => [value];
}

class HorseCreateBirthDateChanged extends HorseCreateEvent {
  const HorseCreateBirthDateChanged(this.value);

  final DateTime value;

  @override
  List<Object> get props => [value];
}

class HorseCreateOwnerIdChanged extends HorseCreateEvent {
  const HorseCreateOwnerIdChanged(this.value);

  final String value;

  @override
  List<Object> get props => [value];
}

class HorseCreateSubmitt extends HorseCreateEvent {
  const HorseCreateSubmitt();
}
