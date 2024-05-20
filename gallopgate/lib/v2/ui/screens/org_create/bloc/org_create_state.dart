part of 'org_create_bloc.dart';

enum OrgCreateStatus { initial, loading, success, error }

class OrgCreateState extends Equatable {
  const OrgCreateState._(this.status, this.name, this.description, this.error);

  final OrgCreateStatus status;
  final String name, description, error;

  factory OrgCreateState.initial() =>
      const OrgCreateState._(OrgCreateStatus.initial, '', '', '');

  OrgCreateState copyWith({
    OrgCreateStatus? status,
    String? name,
    String? description,
    String? error,
  }) {
    return OrgCreateState._(
      status ?? this.status,
      name ?? this.name,
      description ?? this.description,
      error ?? this.error,
    );
  }

  @override
  List<Object> get props => [status, name, description, error];
}
