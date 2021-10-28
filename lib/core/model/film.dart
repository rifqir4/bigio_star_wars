class Film {
  final String id;
  final String title;
  final String director;
  final String release;
  final String detailUrl;

  Film({required this.id, required this.title, required this.director, required this.release, required this.detailUrl});

  factory Film.fromJson(Map json) => Film(
        id: json['episode_id'].toString(),
        title: json['title'],
        director: json['director'],
        release: json['release_date'],
        detailUrl: json['url'],
      );
}
