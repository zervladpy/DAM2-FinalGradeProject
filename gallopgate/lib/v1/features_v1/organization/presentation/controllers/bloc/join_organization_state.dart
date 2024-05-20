part of 'join_organization_bloc.dart';

enum JoinOrganizationStatus { initial, loading, loaded, error }

class JoinOrganizationState extends Equatable {
  const JoinOrganizationState._(
    this.status,
    this.items,
  );

  final JoinOrganizationStatus status;
  final List<Organization> items;

  const JoinOrganizationState.initial()
      : this._(
          JoinOrganizationStatus.initial,
          const [],
        );

  JoinOrganizationState copyWith({
    JoinOrganizationStatus? status,
    List<Organization>? items,
  }) {
    return JoinOrganizationState._(
      status ?? this.status,
      items ?? this.items,
    );
  }

  @override
  List<Object> get props => [items];
}
