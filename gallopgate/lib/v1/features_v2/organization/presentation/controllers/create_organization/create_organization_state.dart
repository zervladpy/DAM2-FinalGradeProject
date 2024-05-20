part of 'create_organization_bloc.dart';

sealed class CreateOrganizationState extends Equatable {
  const CreateOrganizationState();
  
  @override
  List<Object> get props => [];
}

final class CreateOrganizationInitial extends CreateOrganizationState {}
