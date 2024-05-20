part of 'lecture_managment_bloc.dart';

sealed class LectureManagmentState extends Equatable {
  const LectureManagmentState();
  
  @override
  List<Object> get props => [];
}

final class LectureManagmentInitial extends LectureManagmentState {}
