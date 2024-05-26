part of 'org_create_bloc.dart';

abstract class OrgCreateEvent extends Equatable {
  const OrgCreateEvent();
}

class OrgCreateOnNameChanged extends OrgCreateEvent {
  const OrgCreateOnNameChanged(this.name);

  final String name;

  @override
  List<Object?> get props => [name];
}

class OrgCreateOnDescriptionChanged extends OrgCreateEvent {
  const OrgCreateOnDescriptionChanged(this.description);

  final String description;

  @override
  List<Object?> get props => [description];
}

class OrgCreateSubmit extends OrgCreateEvent {
  const OrgCreateSubmit();

  @override
  List<Object?> get props => [];
}
