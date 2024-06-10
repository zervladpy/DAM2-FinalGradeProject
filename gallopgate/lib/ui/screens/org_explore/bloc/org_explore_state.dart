part of 'org_explore_bloc.dart';

class OrgExploreState extends Equatable {
  const OrgExploreState._({
    this.status = Status.initial,
    this.items = const [],
  });

  final Status status;
  final List<Organization> items;

  factory OrgExploreState.initial() => const OrgExploreState._();

  OrgExploreState copyWith({
    Status? status,
    List<Organization>? items,
  }) {
    return OrgExploreState._(
      status: status ?? this.status,
      items: items ?? this.items,
    );
  }

  @override
  List<Object> get props => [status, items];
}
