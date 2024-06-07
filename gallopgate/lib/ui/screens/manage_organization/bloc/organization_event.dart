part of 'organization_bloc.dart';

abstract class OrganizationEvent extends Equatable {
  const OrganizationEvent();

  @override
  List<Object> get props => [];
}

class Fetch extends OrganizationEvent {
  const Fetch(this.id);

  final String id;

  @override
  List<Object> get props => [id];
}

class LogoChanged extends OrganizationEvent {
  const LogoChanged(this.logo);

  final File logo;

  @override
  List<Object> get props => [logo];
}

class NameChanged extends OrganizationEvent {
  const NameChanged(this.name);

  final String name;

  @override
  List<Object> get props => [name];
}

class DescriptionChanged extends OrganizationEvent {
  const DescriptionChanged(this.description);

  final String description;

  @override
  List<Object> get props => [description];
}

class Update extends OrganizationEvent {
  const Update();
}
