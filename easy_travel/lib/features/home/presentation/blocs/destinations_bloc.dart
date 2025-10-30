import 'dart:async';
import 'package:easy_travel/features/home/data/destination_service.dart';
import 'package:easy_travel/features/home/domain/destination.dart';
import 'package:easy_travel/features/home/presentation/blocs/destinations_event.dart';
import 'package:easy_travel/features/home/presentation/blocs/destinations_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DestinationsBloc extends Bloc<DestinationsEvent, DestinationsState> {
  final DestinationService service;

  DestinationsBloc({required this.service})
    : super(DestinationsInitialState()) {
    on<GetAllDestinationsEvent>(_getAllDestinations);

    on<GetDestinationsByCategoryEvent>(_getDestinationsByCategory);
  }

  FutureOr<void> _getAllDestinations(
    GetAllDestinationsEvent event,
    Emitter<DestinationsState> emit,
  ) async {
    emit(DestinationsLoadingState(category: state.category));
    try {
      List<Destination> destinations = await service.getDestinations();
      emit(
        DestinationsSuccessState(
          category: state.category,
          destinations: destinations,
        ),
      );
    } catch (e) {
      emit(
        DestinationsFailureState(
          category: state.category,
          message: e.toString(),
        ),
      );
    }
  }

  FutureOr<void> _getDestinationsByCategory(
    GetDestinationsByCategoryEvent event,
    Emitter<DestinationsState> emit,
  ) async {
    emit(DestinationsLoadingState(category: event.category));
    try {
      List<Destination> destinations = await service.getDestinations(
        category: event.category,
      );
      emit(
        DestinationsSuccessState(
          category: event.category,
          destinations: destinations,
        ),
      );
    } catch (e) {
      emit(
        DestinationsFailureState(
          category: event.category,
          message: e.toString(),
        ),
      );
    }
  }
}
