part of 'join_organization_bloc.dart';

sealed class JoinOrganizationEvent extends Equatable {
  const JoinOrganizationEvent();

  @override
  List<Object> get props => [];
}

class JoinOrganizationInitialize extends JoinOrganizationEvent {}

class JoinOrganizationRequest extends JoinOrganizationEvent {}
