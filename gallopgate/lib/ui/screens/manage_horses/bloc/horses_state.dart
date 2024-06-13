part of 'horses_bloc.dart';

class HorsesState extends Equatable {
  const HorsesState._({
    this.status = Status.initial,
    this.horses = const [],
    this.filtered = const [],
    this.error,
  });

  final Status status;
  final List<Horse> horses;
  final List<Horse> filtered;
  final String? error;

  factory HorsesState.initial() => const HorsesState._();

  HorsesState copyWith({
    Status? status,
    List<Horse>? horses,
    List<Horse>? filtered,
    String? error,
  }) {
    return HorsesState._(
      status: status ?? this.status,
      horses: horses ?? this.horses,
      filtered: filtered ?? this.filtered,
      error: error,
    );
  }

  @override
  List<Object?> get props => [status, horses, filtered, error];
}
