part of 'org_details_bloc.dart';

abstract class OrgDetailsEvent extends Equatable {
  const OrgDetailsEvent();
}

class OrgDetailsFetch extends OrgDetailsEvent {
  final String organizationId;

  const OrgDetailsFetch(this.organizationId);

  @override
  List<Object> get props => [organizationId];
}
