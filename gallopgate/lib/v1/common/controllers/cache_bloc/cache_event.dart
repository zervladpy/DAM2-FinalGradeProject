part of 'cache_bloc.dart';

sealed class CacheEvent extends Equatable {
  const CacheEvent();

  @override
  List<Object> get props => [];
}

class InitializeCacheEvent extends CacheEvent {
  const InitializeCacheEvent(this.userId);

  final String userId;

  @override
  List<Object> get props => [userId];
}

class UpdateCacheEvent extends CacheEvent {
  const UpdateCacheEvent();
}

class ClearCacheEvent extends CacheEvent {
  const ClearCacheEvent();
}
