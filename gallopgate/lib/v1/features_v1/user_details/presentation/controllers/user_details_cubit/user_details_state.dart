part of 'user_details_cubit.dart';

enum Status { initial, loading, success, error }

class UserDetailsState extends Equatable {
  const UserDetailsState(this.status, this.name);

  final Status status;
  final String name;

  factory UserDetailsState.initial(User? user) {
    return UserDetailsState(Status.initial, user?.name ?? '');
  }

  UserDetailsState copyWith({
    Status? status,
    String? name,
  }) {
    return UserDetailsState(
      status ?? this.status,
      name ?? this.name,
    );
  }

  @override
  List<Object> get props => [name];
}
