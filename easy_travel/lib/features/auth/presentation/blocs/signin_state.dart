import 'package:easy_travel/core/enums/status.dart';

class SigninState {
  final Status status;
  final String email;
  final String password;
  final bool isPasswordVisible;
  final String? message;

  const SigninState({
    this.status = Status.initial,
    this.email = '',
    this.password = '',
    this.isPasswordVisible = false,
    this.message,
  });

  SigninState copyWith({
    Status? status,
    String? email,
    String? password,
    bool? isPasswordVisible,
    String? message,
  }) {
    return SigninState(
      status: status ?? this.status,
      email: email ?? this.email,
      password: password ?? this.password,
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
      message: message ?? this.message,
    );
  }
}
