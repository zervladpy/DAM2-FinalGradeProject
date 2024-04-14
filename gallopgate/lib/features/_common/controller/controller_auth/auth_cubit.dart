import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallopgate/core/domain/repository/auth/i_auth_repository.dart';
import 'package:gallopgate/utils/enums/auth_state.dart';
import 'package:gallopgate/utils/locator/locator.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.context) : super(AuthState.initial()) {
    IAuthRepository repository = GLocator.locator.get();

    if (repository.isAuthenticated) {
      authenticate();
    }
  }

  final BuildContext context;

  late StreamController<bool> authStream;

  void authenticate() {
    emit(AuthState.authenticated());
  }

  void unAuthenticate() {
    emit(AuthState.initial());
  }
}
