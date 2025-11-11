import 'package:easy_travel/features/home/domain/destination.dart';
import 'package:easy_travel/features/home/presentation/blocs/home_state.dart';

abstract class HomeEvent {
  const HomeEvent();
}

class GetDestinationsByCategory extends HomeEvent {
  final CategoryType category;
  const GetDestinationsByCategory({required this.category});
}

class ToggleFavorite extends HomeEvent {
  final Destination destination;
  const ToggleFavorite({required this.destination});
}