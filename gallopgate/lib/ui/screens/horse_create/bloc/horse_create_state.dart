part of 'horse_create_bloc.dart';

sealed class HorseCreateState extends Equatable {
  const HorseCreateState();
  
  @override
  List<Object> get props => [];
}

final class HorseCreateInitial extends HorseCreateState {}
