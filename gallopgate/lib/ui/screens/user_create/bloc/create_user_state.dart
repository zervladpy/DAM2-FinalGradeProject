part of 'create_user_bloc.dart';

class CreateUserState extends Equatable {
  const CreateUserState._(
    this.status,
    this.firstName,
    this.lastName,
    this.email,
    this.selectedRoles,
    this.roles,
    this.firstNameError,
    this.lastNameError,
    this.emailError,
    this.error,
  );

  final Status status;
  final String firstName, lastName, email;
  final List<Role> selectedRoles;
  final List<Role> roles;
  final String? firstNameError, lastNameError, emailError, error;

  factory CreateUserState.initial() => const CreateUserState._(
      Status.initial, '', '', '', [], [], null, null, null, null);

  CreateUserState copyWith({
    Status? status,
    String? firstName,
    String? lastName,
    String? email,
    List<Role>? selectedRoles,
    List<Role>? roles,
    String? firstNameError,
    String? lastNameError,
    String? emailError,
    String? error,
  }) {
    return CreateUserState._(
      status ?? this.status,
      firstName ?? this.firstName,
      lastName ?? this.lastName,
      email ?? this.email,
      selectedRoles ?? this.selectedRoles,
      roles ?? this.roles,
      firstNameError ?? this.firstNameError,
      lastNameError ?? this.lastNameError,
      emailError ?? this.emailError,
      error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [
        status,
        firstName,
        lastName,
        email,
        selectedRoles,
        roles,
        firstNameError,
        lastNameError,
        emailError,
        error,
      ];
}
