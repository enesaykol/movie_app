class Film extends Object{
  Film({
    this.id,
    this.title,
    this.posterPath,
  });

  String? posterPath;
  int? id;
  String? title;

  factory Film.fromJson(Map<String, dynamic> json) {
    final int? id = json["id"];
    final String? title = json["title"];
    final String? posterPath = json["posterPath"];

    return Film(
        id: id,
        title: title,
        posterPath: posterPath);
  }
}
