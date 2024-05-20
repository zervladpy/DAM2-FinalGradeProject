part of 'explore_organizations_bloc.dart';

sealed class ExploreOrganizationsState extends Equatable {
  const ExploreOrganizationsState();
  
  @override
  List<Object> get props => [];
}

final class ExploreOrganizationsInitial extends ExploreOrganizationsState {}
