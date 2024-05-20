part of 'users_managment_bloc.dart';

sealed class UsersManagmentState extends Equatable {
  const UsersManagmentState();
  
  @override
  List<Object> get props => [];
}

final class UsersManagmentInitial extends UsersManagmentState {}
