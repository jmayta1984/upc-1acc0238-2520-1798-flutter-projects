import 'package:easy_travel/features/auth/user.dart';

abstract class SigninState {
  final bool isVisible;
  const SigninState({required this.isVisible});
}

class SigninInitialState extends SigninState {
  const SigninInitialState() : super(isVisible: false);
}

class SiginLoadingState extends SigninState {
  const SiginLoadingState({required super.isVisible});
}

class SiginSuccessState extends SigninState {
  final User user;
  const SiginSuccessState({required super.isVisible, required this.user});
}

class SiginFailureState extends SigninState {
  final String message;
  const SiginFailureState({required super.isVisible, required this.message});
}

