part of 'horse_managment_bloc.dart';

sealed class HorseManagmentState extends Equatable {
  const HorseManagmentState();
  
  @override
  List<Object> get props => [];
}

final class HorseManagmentInitial extends HorseManagmentState {}
