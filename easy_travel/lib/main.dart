import 'package:easy_travel/core/ui/theme.dart';
import 'package:easy_travel/features/auth/data/auth_service.dart';
import 'package:easy_travel/features/auth/presentation/blocs/signin_bloc.dart';
import 'package:easy_travel/features/auth/presentation/pages/signin_page.dart';
import 'package:easy_travel/features/favorites/data/favorite_dao.dart';
import 'package:easy_travel/features/favorites/data/favorite_repository_impl.dart';
import 'package:easy_travel/features/favorites/presentation/blocs/favorite_list_bloc.dart';
import 'package:easy_travel/features/favorites/presentation/blocs/favorite_list_event.dart';
import 'package:easy_travel/features/home/data/destination_repository_impl.dart';
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
    final DestinationService destinationService = DestinationService();
    final DestinationRepositoryImpl destinationRepository =
        DestinationRepositoryImpl(service: destinationService);

    final FavoriteDao favoriteDao = FavoriteDao();
    final FavoriteRepositoryImpl favoriteRepository = FavoriteRepositoryImpl(
      dao: favoriteDao,
    );
    final MaterialTheme theme = MaterialTheme(TextTheme());
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeBloc(
            destinationRepository: destinationRepository,
            favoriteRepository: favoriteRepository,
          )..add(GetDestinationsByCategory(category: CategoryType.all)),
        ),
        BlocProvider(create: (context) => SigninBloc(service: AuthService())),
        BlocProvider(
          create: (context) =>
              FavoriteListBloc(repository: favoriteRepository)
                ..add(GetAllFavorites()),
        ),
      ],
      child: MaterialApp(
        theme: theme.light(),
        darkTheme: theme.dark(),
        debugShowCheckedModeBanner: false,
        home: SigninPage(),
      ),
    );
  }
}
