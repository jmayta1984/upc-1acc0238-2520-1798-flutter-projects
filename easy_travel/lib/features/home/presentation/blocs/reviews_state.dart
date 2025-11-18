import 'package:easy_travel/core/enums/status.dart';
import 'package:easy_travel/features/home/domain/review.dart';

class ReviewsState {
  final Status status;
  final List<Review> reviews;
  final String? message;

  const ReviewsState({
    this.status = Status.initial,
    this.reviews = const [],
    this.message,
  });

  ReviewsState copyWith({
    Status? status,
    List<Review>? reviews,
    String? message,
  }) {
    return ReviewsState(
      status: status ?? this.status,
      reviews: reviews ?? this.reviews,
      message: message ?? this.message,
    );
  }
}
