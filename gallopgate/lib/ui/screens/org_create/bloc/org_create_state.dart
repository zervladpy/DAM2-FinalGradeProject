part of 'org_create_bloc.dart';

class OrgCreateState extends Equatable {
  const OrgCreateState._(this.status, this.name, this.description, this.error);

  final Status status;
  final String name, description, error;

  factory OrgCreateState.initial() =>
      const OrgCreateState._(Status.initial, '', '', '');

  OrgCreateState copyWith({
    Status? status,
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
