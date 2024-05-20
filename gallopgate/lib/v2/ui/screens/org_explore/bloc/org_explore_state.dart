part of 'org_explore_bloc.dart';

enum OrgExploreStatus { initial, loading, success, error }

class OrgExploreState extends Equatable {
  const OrgExploreState(this.status, this.items);

  final OrgExploreStatus status;
  final List<ExploreOrganizationDto> items;

  factory OrgExploreState.initial() {
    return const OrgExploreState(OrgExploreStatus.initial, []);
  }

  OrgExploreState copyWith({
    OrgExploreStatus? status,
    List<ExploreOrganizationDto>? items,
  }) {
    return OrgExploreState(
      status ?? this.status,
      items ?? this.items,
    );
  }

  @override
  List<Object> get props => [status, items];
}
