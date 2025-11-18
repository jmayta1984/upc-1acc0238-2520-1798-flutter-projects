abstract class ReviewsEvent {
  const ReviewsEvent();
}

class GetReviewsByDestinatioId extends ReviewsEvent {
  final int id;
  const GetReviewsByDestinatioId({required this.id});
}
