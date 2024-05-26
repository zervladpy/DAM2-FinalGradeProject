part of 'org_details_bloc.dart';

enum OrgDetailsStatus { initial, loading, success, error }

class OrgDetailsState extends Equatable {
  const OrgDetailsState._(this.status, this.item);

  final OrgDetailsStatus status;
  final OrgDetailsDto item;

  factory OrgDetailsState.initial() => const OrgDetailsState._(
        OrgDetailsStatus.initial,
        OrgDetailsDto.empty,
      );

  OrgDetailsState copyWith({
    OrgDetailsStatus? status,
    OrgDetailsDto? item,
  }) {
    return OrgDetailsState._(
      status ?? this.status,
      item ?? this.item,
    );
  }

  @override
  List<Object> get props => [status, item];
}
