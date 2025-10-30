import 'package:easy_travel/features/home/domain/destination.dart';

abstract class DestinationsState {
  final String category;
  const DestinationsState({required this.category});
}

class DestinationsInitialState extends DestinationsState {
  const DestinationsInitialState() : super(category: 'All');
}

class DestinationsLoadingState extends DestinationsState {
  const DestinationsLoadingState({required super.category});
}

class DestinationsSuccessState extends DestinationsState {
  final List<Destination> destinations;
  const DestinationsSuccessState({
    required super.category,
    required this.destinations,
  });
}

class DestinationsFailureState extends DestinationsState {
  final String message;
  const DestinationsFailureState({
    required super.category,
    required this.message,
  });
}
