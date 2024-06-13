part of 'horses_bloc.dart';

abstract class HorsesEvent extends Equatable {
  const HorsesEvent();

  @override
  List<Object> get props => [];
}

class Fetch extends HorsesEvent {}
