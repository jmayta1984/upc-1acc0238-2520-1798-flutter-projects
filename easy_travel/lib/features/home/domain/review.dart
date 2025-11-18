class Review {
  final String userName;
  final String userEmail;
  final String comment;
  final int rating;

  const Review({
    required this.userName,
    required this.userEmail,
    required this.comment,
    required this.rating,
  });

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      userName: '${json['user']['firstName']} ${json['user']['lastName']}',
      userEmail: json['user']['email'],
      comment: json['comment'],
      rating: json['rating'],
    );
  }
}
