class MovieDetailsModel {
  MovieDetailsModel({
    this.variant,
    this.id,
    this.collection,
    this.statusCode,
    this.type,
  });

  String? variant;
  String? id;
  Collection? collection;
  int? statusCode;
  String? type;

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) => MovieDetailsModel(
    variant: json["variant"],
    id: json["id"],
    collection: Collection.fromJson(json["collection"]),
    statusCode: json["status_code"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "variant": variant,
    "id": id,
    "collection": collection!.toJson(),
    "status_code": statusCode,
    "type": type,
  };
}

class Collection {
  Collection({
    this.locations,
    this.sourceIds,
    this.id,
    this.weight,
    this.picture,
    this.name,
  });

  List<Location>? locations;
  SourceIds? sourceIds;
  String? id;
  int? weight;
  String? picture;
  String? name;

  factory Collection.fromJson(Map<String, dynamic> json) => Collection(
    locations: List<Location>.from(json["locations"].map((x) => Location.fromJson(x))),
    sourceIds: SourceIds.fromJson(json["source_ids"]),
    id: json["id"],
    weight: json["weight"],
    picture: json["picture"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "locations": List<dynamic>.from(locations!.map((x) => x.toJson())),
    "source_ids": sourceIds!.toJson(),
    "id": id,
    "weight": weight,
    "picture": picture,
    "name": name,
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

class SourceIds {
  SourceIds({
    this.imdb,
  });

  Imdb? imdb;

  factory SourceIds.fromJson(Map<String, dynamic> json) => SourceIds(
    imdb: Imdb.fromJson(json["imdb"]),
  );

  Map<String, dynamic> toJson() => {
    "imdb": imdb!.toJson(),
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