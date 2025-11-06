abstract class SigninEvent {
  const SigninEvent();
}

class Signin extends SigninEvent {
  const Signin();
}

class OnEmailChanged extends SigninEvent {
  final String email;
  const OnEmailChanged({required this.email});
}

class OnPasswordChanged extends SigninEvent {
  final String password;
  const OnPasswordChanged({required this.password});
}

class TogglePasswordVisibility extends SigninEvent {
  const TogglePasswordVisibility();
}
