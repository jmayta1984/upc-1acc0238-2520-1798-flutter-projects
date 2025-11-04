import 'package:easy_travel/core/ui/theme.dart';
import 'package:easy_travel/features/auth/signup_page.dart';
import 'package:easy_travel/features/home/data/destination_service.dart';
import 'package:easy_travel/features/home/presentation/blocs/home_bloc.dart';
import 'package:easy_travel/features/home/presentation/blocs/home_event.dart';
import 'package:easy_travel/features/home/presentation/blocs/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final MaterialTheme theme = MaterialTheme(TextTheme());
    return BlocProvider(
      create: (context) =>
          HomeBloc(service: DestinationService())
            ..add(GetDestinationsByCategory(category: CategoryType.all)),
      child: MaterialApp(
        theme: theme.light(),
        darkTheme: theme.dark(),
        debugShowCheckedModeBanner: false,
        home: Scaffold(body: SafeArea(child: SignupPage())),
      ),
    );
  }
}
