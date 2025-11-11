import 'dart:async';
import 'package:easy_travel/core/enums/status.dart';
import 'package:easy_travel/features/favorites/domain/favorite_repository.dart';
import 'package:easy_travel/features/home/domain/destination.dart';
import 'package:easy_travel/features/home/domain/destination_repository.dart';
import 'package:easy_travel/features/home/presentation/blocs/home_event.dart';
import 'package:easy_travel/features/home/presentation/blocs/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final DestinationRepository destinationRepository;
  final FavoriteRepository favoriteRepository;
  HomeBloc({
    required this.destinationRepository,
    required this.favoriteRepository,
  }) : super(HomeState()) {
    on<GetDestinationsByCategory>(_getDestinationsByCategory);

    on<ToggleFavorite>(_toggleFavorite);
  }

  FutureOr<void> _toggleFavorite(
    ToggleFavorite event,
    Emitter<HomeState> emit,
  ) async {
    bool isFavorite = await favoriteRepository.isFavorite(event.destination.id);
    if (isFavorite) {
      favoriteRepository.delete(event.destination.id);
    } else {
      favoriteRepository.insert(event.destination);
    }
  }

  FutureOr<void> _getDestinationsByCategory(
    GetDestinationsByCategory event,
    Emitter<HomeState> emit,
  ) async {
    if (state.selectedCategory == event.category &&
        state.destinations.isNotEmpty) {
      return;
    }

    emit(
      state.copyWith(status: Status.loading, selectedCategory: event.category),
    );

    try {
      List<Destination> destinations = await destinationRepository
          .getDestinationsByCategory(event.category.label);
      emit(state.copyWith(status: Status.success, destinations: destinations));
    } catch (e) {
      emit(state.copyWith(status: Status.failure, message: e.toString()));
    }
  }
}
