abstract class ReviewsEvent {
  const ReviewsEvent();
}

class GetReviewsByDestinatioId extends ReviewsEvent {
  final int id;
  const GetReviewsByDestinatioId({required this.id});
}

class SubmitReview extends ReviewsEvent {
  final int destinationId;
  final String comment;
  final int rating;

  const SubmitReview({
    required this.destinationId,
    required this.comment,
    required this.rating,
  });
}
