part of 'event_create_bloc.dart';

sealed class EventCreateState extends Equatable {
  const EventCreateState();
  
  @override
  List<Object> get props => [];
}

final class EventCreateInitial extends EventCreateState {}
