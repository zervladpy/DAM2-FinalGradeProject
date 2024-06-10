part of 'create_schedule_bloc.dart';

sealed class CreateScheduleState extends Equatable {
  const CreateScheduleState();

  @override
  List<Object> get props => [];
}

final class CreateScheduleBlocInitial extends CreateScheduleState {}
