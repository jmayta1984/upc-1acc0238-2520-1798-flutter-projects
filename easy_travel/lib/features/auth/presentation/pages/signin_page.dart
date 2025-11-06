import 'package:easy_travel/features/auth/presentation/blocs/signin_bloc.dart';
import 'package:easy_travel/features/auth/presentation/blocs/signin_event.dart';
import 'package:easy_travel/features/auth/presentation/blocs/signin_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SigninPage extends StatelessWidget {
  const SigninPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) =>
                  context.read<SigninBloc>().add(OnEmailChanged(email: value)),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                hintText: "Email",
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: BlocSelector<SigninBloc, SigninState, bool>(
              selector: (state) => state.isPasswordVisible,
              builder: (context, state) => TextField(
                onChanged: (value) => context.read<SigninBloc>().add(
                  OnPasswordChanged(password: value),
                ),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  hintText: "Password",
                  suffixIcon: IconButton(
                    onPressed: () {
                      context.read<SigninBloc>().add(TogglePasswordVisibility());
                    },
                    icon: Icon(state ? Icons.visibility_off : Icons.visibility),
                  ),
                ),
                obscureText: !state,
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: () {
                 context.read<SigninBloc>().add(Signin());
                },
                child: Text("Sign in"),
              ),
            ),
          ),

          TextButton(onPressed: () {}, child: Text("Sign up")),
        ],
      ),
    );
  }
}
