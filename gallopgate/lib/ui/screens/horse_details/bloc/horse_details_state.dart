part of 'horse_details_bloc.dart';

sealed class HorseDetailsState extends Equatable {
  const HorseDetailsState();
  
  @override
  List<Object> get props => [];
}

final class HorseDetailsInitial extends HorseDetailsState {}
