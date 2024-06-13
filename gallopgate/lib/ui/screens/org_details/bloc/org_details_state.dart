part of 'org_details_bloc.dart';

class OrgDetailsState extends Equatable {
  const OrgDetailsState._({
    this.status = Status.initial,
    this.item = Organization.empty,
  });

  final Status status;
  final Organization item;

  factory OrgDetailsState.initial() => const OrgDetailsState._();

  OrgDetailsState copyWith({
    Status? status,
    Organization? item,
  }) {
    return OrgDetailsState._(
      status: status ?? this.status,
      item: item ?? this.item,
    );
  }

  @override
  List<Object> get props => [status, item];
}
