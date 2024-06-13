part of 'organization_bloc.dart';

class OrganizationState extends Equatable {
  const OrganizationState._({
    this.status = Status.initial,
    this.initial = Organization.empty,
    this.organization = Organization.empty,
    this.creator = Profile.empty,
    this.edited = false,
    this.error,
  });

  final Status status;
  final Organization initial;
  final Organization organization;
  final Profile creator;
  final bool edited;
  final String? error;

  factory OrganizationState.initial() => const OrganizationState._();

  OrganizationState copyWith({
    Status? status,
    Organization? initial,
    Organization? organization,
    Profile? creator,
    String? error,
    bool? edited,
  }) {
    return OrganizationState._(
      status: status ?? this.status,
      initial: initial ?? this.initial,
      organization: organization ?? this.organization,
      creator: creator ?? this.creator,
      error: error,
      edited: edited ?? this.edited,
    );
  }

  @override
  List<Object?> get props => [
        status,
        initial,
        organization,
        creator,
        error,
        edited,
      ];
}
