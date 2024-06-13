part of 'preffrences_bloc.dart';

sealed class PreffrencesState extends Equatable {
  const PreffrencesState();
  
  @override
  List<Object> get props => [];
}

final class PreffrencesInitial extends PreffrencesState {}
