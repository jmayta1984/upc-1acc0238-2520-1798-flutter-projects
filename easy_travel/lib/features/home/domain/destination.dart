class Destination {
  final int id;
  final String title;
  final String posterPath;
  final String overview;

  Destination({
    required this.id,
    required this.title,
    required this.posterPath,
    required this.overview,
  });

  factory Destination.fromJson(Map<String, dynamic> json) {
    return Destination(
      id: json['id'],
      title: json['title'],
      posterPath: json['posterPath'],
      overview: json['overview'],
    );
  }
}
