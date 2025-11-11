import 'dart:async';
import 'package:easy_travel/features/favorites/domain/favorite_repository.dart';
import 'package:easy_travel/features/favorites/presentation/blocs/favorite_list_event.dart';
import 'package:easy_travel/features/favorites/presentation/blocs/favorite_list_state.dart';
import 'package:easy_travel/features/home/domain/destination.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteListBloc extends Bloc<FavoriteListEvent, FavoriteListState> {
  final FavoriteRepository repository;
  FavoriteListBloc({required this.repository}) : super(FavoriteListState()) {
    on<GetAllFavorites>(_getAllFavorites);

    on<RemoveFavorite>(_removeFavorite);
  }

  FutureOr<void> _getAllFavorites(
    GetAllFavorites event,
    Emitter<FavoriteListState> emit,
  ) async {
    List<Destination> destinations = await repository.fetchAll();
    emit(state.copyWith(destinations: destinations));
  }

  FutureOr<void> _removeFavorite(
    RemoveFavorite event,
    Emitter<FavoriteListState> emit,
  ) async {
    await repository.delete(event.id);
       List<Destination> destinations = await repository.fetchAll();
    emit(state.copyWith(destinations: destinations));
  }
}
