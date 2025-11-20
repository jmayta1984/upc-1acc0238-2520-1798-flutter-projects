import 'dart:async';

import 'package:easy_travel/core/enums/status.dart';
import 'package:easy_travel/features/home/data/review_service.dart';
import 'package:easy_travel/features/home/domain/review.dart';
import 'package:easy_travel/features/home/presentation/blocs/reviews_event.dart';
import 'package:easy_travel/features/home/presentation/blocs/reviews_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReviewsBloc extends Bloc<ReviewsEvent, ReviewsState> {
  final ReviewService service;
  ReviewsBloc({required this.service}) : super(const ReviewsState()) {
    on<GetReviewsByDestinatioId>(_getReviewsByDestinationId);
    on<SubmitReview>(_submitReview);
  }

  FutureOr<void> _getReviewsByDestinationId(
    GetReviewsByDestinatioId event,
    Emitter<ReviewsState> emit,
  ) async {
    emit(state.copyWith(status: Status.loading));

    try {
      List<Review> reviews = await service.getReviewsByDestinationId(event.id);
      emit(state.copyWith(status: Status.success, reviews: reviews));
    } catch (e) {
      emit(state.copyWith(status: Status.failure, message: e.toString()));
    }
  }

  FutureOr<void> _submitReview(
    SubmitReview event,
    Emitter<ReviewsState> emit,
  ) async {
    try {
      await service.submitReview(
        event.destinationId,
        event.comment,
        event.rating,
      );
      List<Review> reviews = await service.getReviewsByDestinationId(event.destinationId);

      emit(state.copyWith(status: Status.success, reviews: reviews));
    } catch (e) {
      emit(state.copyWith(status: Status.failure, message: e.toString()));
    }
  }
}
