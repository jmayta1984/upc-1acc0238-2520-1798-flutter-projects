import 'package:easy_travel/features/favorites/presentation/blocs/favorite_list_bloc.dart';
import 'package:easy_travel/features/favorites/presentation/blocs/favorite_list_state.dart';
import 'package:easy_travel/features/home/domain/destination.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteListPage extends StatelessWidget {
  const FavoriteListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteListBloc, FavoriteListState>(
      builder: (context, state) {
        final List<Destination> destinations = state.destinations;
        return ListView.builder(
          itemCount: destinations.length,
          itemBuilder: (context, index) {
            final Destination destination = destinations[index];
            return Text(destination.title);
          },
        );
      },
    );
  }
}
