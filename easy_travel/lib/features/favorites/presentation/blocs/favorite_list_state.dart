import 'package:easy_travel/core/enums/status.dart';
import 'package:easy_travel/features/home/domain/destination.dart';

class FavoriteListState {
  final Status status;
  final List<Destination> destinations;
  final String? message;

  const FavoriteListState({
    this.status = Status.initial,
    this.destinations = const [],
    this.message,
  });

  FavoriteListState copyWith({
    Status? status,
    List<Destination>? destinations,
    String? message,
  }) {
    return FavoriteListState(
      status: status ?? this.status,
      destinations: destinations ?? this.destinations,
      message: message ?? this.message,
    );
  }
}