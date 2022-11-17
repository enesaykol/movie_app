class Film extends Object{
  Film({
    this.id,
    this.title,
    this.posterPath,
    this.overview,
    this.popularity,
    this.backdrop_path,
  });

  String? posterPath;
  int? id;
  String? title;
  String? overview;
  double? popularity;
  String? backdrop_path;

  factory Film.fromJson(Map<String, dynamic> json) {
    final int? id = json["id"];
    final String? title = json["title"];
    final String? posterPath = json["poster_path"];
    final String? overview = json["overview"];
    final double popularity = json["popularity"];
    final String? backdrop_path = json["backdrop_path"];

    return Film(
        id: id,
        title: title,
        posterPath: posterPath,
        overview: overview,
        popularity: popularity,
        backdrop_path: backdrop_path
    );
  }
}
