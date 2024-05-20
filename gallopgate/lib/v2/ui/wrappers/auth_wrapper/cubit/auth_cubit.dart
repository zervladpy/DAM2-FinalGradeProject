import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gallopgate/v2/models/profile.dart';
import 'package:gallopgate/v2/repositories/auth_repository.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  late StreamSubscription<Profile> _authStreamSubscription;

  AuthCubit(
    Stream<Profile> authStream,
  ) : super(const AuthState.unauthenticated()) {
    _authStreamSubscription = authStream.listen((profile) {
      if (profile.isNotEmpty) {
        emit(AuthState.authenticated(profile));
      } else {
        emit(const AuthState.unauthenticated());
      }
    });
  }

  @override
  Future<void> close() {
    _authStreamSubscription.cancel();
    return super.close();
  }
}
