part of 'org_explore_bloc.dart';

abstract class OrgExploreEvent extends Equatable {
  const OrgExploreEvent();
}

class OrgExploreFetch extends OrgExploreEvent {
  const OrgExploreFetch();

  @override
  List<Object> get props => [];
}

class OrgExploreRefresh extends OrgExploreEvent {
  const OrgExploreRefresh();

  @override
  List<Object> get props => [];
}
