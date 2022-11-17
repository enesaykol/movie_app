import 'dart:convert';


Topratefilm topratefilmFromJson(String str) => Topratefilm.fromJson(json.decode(str));

String topratefilmToJson(Topratefilm data) => json.encode(data.toJson());

class Topratefilm {
  Topratefilm({
    this.page,
    this.results,
    this.totalResults,
    this.totalPages,
  });

  int? page;
  List<Result>? results;
  int? totalResults;
  int? totalPages;

  factory Topratefilm.fromJson(Map<String, dynamic> json) => Topratefilm(
    page: json["page"],
    results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
    totalResults: json["total_results"],
    totalPages: json["total_pages"],
  );

  Map<String, dynamic> toJson() => {
    "page": page,
    "results": List<dynamic>.from(results!.map((x) => x.toJson())),
    "total_results": totalResults,
    "total_pages": totalPages,
  };
}

class Result {
  Result({
    this.posterPath,
    this.id,
    this.title,
  });

  String? posterPath;
  int? id;
  String? title;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    posterPath: json["poster_path"],
    id: json["id"],
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "poster_path": posterPath,
    "id": id,
    "title": title,
  };
}
