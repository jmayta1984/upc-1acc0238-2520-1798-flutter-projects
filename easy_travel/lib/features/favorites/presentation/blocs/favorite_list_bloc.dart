import 'dart:async';
import 'package:easy_travel/features/favorites/presentation/blocs/favorite_list_event.dart';
import 'package:easy_travel/features/favorites/presentation/blocs/favorite_list_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteListBloc extends Bloc<FavoriteListEvent, FavoriteListState> {
  FavoriteListBloc() : super(FavoriteListState()) {
    on<GetAllFavorites>(_getAllFavorites);

    on<RemoveFavorite>(_removeFavorite);
  }

  FutureOr<void> _getAllFavorites(
    GetAllFavorites event,
    Emitter<FavoriteListState> emit,
  ) {}

  FutureOr<void> _removeFavorite(
    RemoveFavorite event,
    Emitter<FavoriteListState> emit,
  ) {}
}
