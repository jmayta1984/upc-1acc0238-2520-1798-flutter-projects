import 'package:easy_travel/core/enums/status.dart';
import 'package:easy_travel/features/auth/presentation/blocs/signin_bloc.dart';
import 'package:easy_travel/features/auth/presentation/blocs/signin_event.dart';
import 'package:easy_travel/features/auth/presentation/blocs/signin_state.dart';
import 'package:easy_travel/features/main/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SigninPage extends StatelessWidget {
  const SigninPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SigninBloc, SigninState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) {
        if (state.status == Status.success) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => MainPage()),
          );
        }
      },
      child: Scaffold(
        body: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    onChanged: (value) => context.read<SigninBloc>().add(
                      OnEmailChanged(email: value),
                    ),
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
                            context.read<SigninBloc>().add(
                              TogglePasswordVisibility(),
                            );
                          },
                          icon: Icon(
                            state ? Icons.visibility_off : Icons.visibility,
                          ),
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
            BlocSelector<SigninBloc, SigninState, bool>(
              selector: (state) => state.status == Status.loading,
              builder: (context, isLoading) {
                if (isLoading) {
                  return Container(
                    color: Theme.of(
                      context,
                    ).colorScheme.primaryContainer.withValues(alpha: 0.5),
                    child: Center(child: CircularProgressIndicator()),
                  );
                }
                return SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }
}
