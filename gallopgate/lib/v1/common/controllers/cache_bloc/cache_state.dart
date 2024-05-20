part of 'cache_bloc.dart';

enum CacheStatus { initial, loading, loaded, error }

class CacheState extends Equatable {
  const CacheState(this.status, this.user, this.organization);

  final CacheStatus status;
  final User user;
  final Organization organization;

  factory CacheState.initial() {
    return const CacheState(
      CacheStatus.initial,
      User.empty,
      Organization.empty,
    );
  }

  CacheState copyWith({
    CacheStatus? status,
    User? user,
    Organization? organization,
  }) {
    return CacheState(
      status ?? this.status,
      user ?? this.user,
      organization ?? this.organization,
    );
  }

  @override
  List<Object> get props => [status, user, organization];
}
