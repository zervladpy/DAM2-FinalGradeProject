import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gallopgate/models/profile/profile.dart';
import 'package:gallopgate/repositories/auth_repository.dart';
import 'package:gallopgate/repositories/profile_repository.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  late StreamSubscription<AuthStatus> _authStreamSubscription;

  final ProfileRepository repository;

  AuthCubit(
    Stream<AuthStatus> authStream,
    this.repository,
  ) : super(const AuthState.unauthenticated()) {
    _authStreamSubscription = authStream.listen((status) async {
      if (status == AuthStatus.authenticated) {
        await _authenticate();
      } else {
        emit(const AuthState.unauthenticated());
      }
    });
  }

  Future<void> _authenticate() async {
    var profile = await repository.currentProfile();

    if (profile == null) {
      emit(const AuthState.unauthenticated());
      return;
    }

    emit(AuthState.authenticated(profile));
  }

  @override
  Future<void> close() {
    _authStreamSubscription.cancel();
    return super.close();
  }
}
