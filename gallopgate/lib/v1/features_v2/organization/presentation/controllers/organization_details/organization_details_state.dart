part of 'organization_details_bloc.dart';

sealed class OrganizationDetailsState extends Equatable {
  const OrganizationDetailsState();
  
  @override
  List<Object> get props => [];
}

final class OrganizationDetailsInitial extends OrganizationDetailsState {}
