import 'dart:async';

import 'package:easy_travel/core/storage/secure_storage.dart';
import 'package:easy_travel/features/auth/presentation/blocs/auth_event.dart';
import 'package:easy_travel/features/auth/presentation/blocs/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthState()) {
    on<AppStart>(_appStarted);
  }

  FutureOr<void> _appStarted(AppStart event, Emitter<AuthState> emit) async {
    Future.delayed(const Duration(seconds: 1));
    final token = await SecureStorage().read();
    emit(
      token != null
          ? state.copyWith(status: AuthStatus.authenticated)
          : state.copyWith(status: AuthStatus.unauthenticated),
    );
  }
}
