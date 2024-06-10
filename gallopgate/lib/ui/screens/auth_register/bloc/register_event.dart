part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();
}

class RegisterNameChanged extends RegisterEvent {
  const RegisterNameChanged(this.name);

  final String name;

  @override
  List<Object> get props => [name];
}

class RegisterEmailChanged extends RegisterEvent {
  const RegisterEmailChanged(this.email);

  final String email;

  @override
  List<Object> get props => [email];
}

class RegisterPasswordChanged extends RegisterEvent {
  const RegisterPasswordChanged(this.password);

  final String password;

  @override
  List<Object> get props => [password];
}

class RegisterRepeatPasswordChanged extends RegisterEvent {
  const RegisterRepeatPasswordChanged(this.repeatPassword);

  final String repeatPassword;

  @override
  List<Object> get props => [repeatPassword];
}

class RegisterShowPasswordChanged extends RegisterEvent {
  const RegisterShowPasswordChanged(this.showPassword);

  final bool showPassword;

  @override
  List<Object> get props => [showPassword];
}

class RegisterAcceptTermsChanged extends RegisterEvent {
  const RegisterAcceptTermsChanged(this.acceptTerms);

  final bool acceptTerms;

  @override
  List<Object> get props => [acceptTerms];
}

class RegisterSubmitted extends RegisterEvent {
  const RegisterSubmitted();

  @override
  List<Object> get props => [];
}
