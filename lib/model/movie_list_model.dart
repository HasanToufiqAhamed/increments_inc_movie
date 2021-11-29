class MovieListModel {
  MovieListModel({
    this.variant,
    this.results,
    this.updated,
    this.term,
    this.statusCode,
  });

  String? variant;
  List<Result>? results;
  String? updated;
  String? term;
  int? statusCode;

  factory MovieListModel.fromJson(Map<String, dynamic> json) => MovieListModel(
    variant: json["variant"],
    results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
    updated: json["updated"],
    term: json["term"],
    statusCode: json["status_code"],
  );

  Map<String, dynamic> toJson() => {
    "variant": variant,
    "results": List<dynamic>.from(results!.map((x) => x.toJson())),
    "updated": updated,
    "term": term,
    "status_code": statusCode,
  };
}

class Result {
  Result({
    this.locations,
    this.weight,
    this.id,
    this.externalIds,
    this.picture,
    this.provider,
    this.name,
  });

  List<Location>? locations;
  int? weight;
  String? id;
  ExternalIds? externalIds;
  String? picture;
  String? provider;
  String? name;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    locations: List<Location>.from(json["locations"].map((x) => Location.fromJson(x))),
    weight: json["weight"],
    id: json["id"],
    externalIds: ExternalIds.fromJson(json["external_ids"]),
    picture: json["picture"],
    provider: json["provider"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "locations": List<dynamic>.from(locations!.map((x) => x.toJson())),
    "weight": weight,
    "id": id,
    "external_ids": externalIds!.toJson(),
    "picture": picture,
    "provider": provider,
    "name": name,
  };
}

class ExternalIds {
  ExternalIds({
    this.imdb,
    this.tmdb,
    this.iva,
    this.facebook,
    this.rottenTomatoes,
    this.wikiData,
    this.ivaRating,
    this.gracenote,
  });

  Imdb? imdb;
  Imdb? tmdb;
  Iva? iva;
  dynamic? facebook;
  dynamic? rottenTomatoes;
  Imdb? wikiData;
  dynamic? ivaRating;
  dynamic? gracenote;

  factory ExternalIds.fromJson(Map<String, dynamic> json) => ExternalIds(
    imdb: Imdb.fromJson(json["imdb"]),
    tmdb: Imdb.fromJson(json["tmdb"]),
    iva: Iva.fromJson(json["iva"]),
    facebook: json["facebook"],
    rottenTomatoes: json["rotten_tomatoes"],
    wikiData: Imdb.fromJson(json["wiki_data"]),
    ivaRating: json["iva_rating"],
    gracenote: json["gracenote"],
  );

  Map<String, dynamic> toJson() => {
    "imdb": imdb!.toJson(),
    "tmdb": tmdb!.toJson(),
    "iva": iva!.toJson(),
    "facebook": facebook,
    "rotten_tomatoes": rottenTomatoes,
    "wiki_data": wikiData!.toJson(),
    "iva_rating": ivaRating,
    "gracenote": gracenote,
  };
}

class Imdb {
  Imdb({
    this.url,
    this.id,
  });

  String? url;
  String? id;

  factory Imdb.fromJson(Map<String, dynamic> json) => Imdb(
    url: json["url"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "url": url,
    "id": id,
  };
}

class Iva {
  Iva({
    this.id,
  });

  String? id;

  factory Iva.fromJson(Map<String, dynamic> json) => Iva(
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
  };
}

class Location {
  Location({
    this.displayName,
    this.id,
    this.url,
    this.name,
    this.icon,
  });

  String? displayName;
  String? id;
  String? url;
  String? name;
  String? icon;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    displayName: json["display_name"],
    id: json["id"],
    url: json["url"],
    name: json["name"],
    icon: json["icon"],
  );

  Map<String, dynamic> toJson() => {
    "display_name": displayName,
    "id": id,
    "url": url,
    "name": name,
    "icon": icon,
  };
}