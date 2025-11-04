import 'package:easy_travel/core/enums/status.dart';
import 'package:easy_travel/features/home/domain/destination.dart';


enum CategoryType {
  all(label: 'All'),
  beach(label: 'Beach'),
  adventure(label: 'Adventure'),
  city(label: 'City'),
  cultural(label: 'Cultural');

  final String label;
  const CategoryType({required this.label});
}

class HomeState {
  final Status status;
  final CategoryType selectedCategory;
  final List<Destination> destinations;
  final String? message;

  const HomeState({
    this.status = Status.initial,
    this.selectedCategory = CategoryType.all,
    this.destinations = const [],
    this.message,
  });

  HomeState copyWith({
    Status? status,
    CategoryType? selectedCategory,
    List<Destination>? destinations,
    String? message,
  }) {
    return HomeState(
      status: status ?? this.status,
      selectedCategory: selectedCategory ?? this.selectedCategory,
      destinations: destinations ?? this.destinations,
      message: message ?? this.message,
    );
  }
}
