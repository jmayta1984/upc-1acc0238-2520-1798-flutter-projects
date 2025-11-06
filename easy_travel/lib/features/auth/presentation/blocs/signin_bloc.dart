import 'dart:async';
import 'package:easy_travel/core/enums/status.dart';
import 'package:easy_travel/features/auth/data/auth_service.dart';
import 'package:easy_travel/features/auth/presentation/blocs/signin_event.dart';
import 'package:easy_travel/features/auth/presentation/blocs/signin_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SigninBloc extends Bloc<SigninEvent, SigninState> {
  final AuthService service;
  SigninBloc({required this.service}) : super(SigninState()) {
    on<OnEmailChanged>(
      (event, emit) => emit(state.copyWith(email: event.email)),
    );

    on<OnPasswordChanged>(
      (event, emit) => emit(state.copyWith(password: event.password)),
    );

    on<TogglePasswordVisibility>(
      (event, emit) =>
          emit(state.copyWith(isPasswordVisible: !state.isPasswordVisible)),
    );

    on<Signin>(_signin);
  }

  FutureOr<void> _signin(Signin event, Emitter<SigninState> emit) async {
    emit(state.copyWith(status: Status.loading));
    try {
      await service.sigin(state.email, state.password);
      emit(state.copyWith(status: Status.success));
    } catch (e) {
      emit(state.copyWith(status: Status.failure, message: e.toString()));
    }
  }
}
