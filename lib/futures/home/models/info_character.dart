// ignore_for_file: constant_identifier_names

import 'dart:convert';

class InfoCharacter {
  InfoCharacter({
    required this.id,
    required this.name,
    this.species,
    required this.image,
    required this.episode,
    required this.url,
  });

  final int id;
  final String name;

  String? species;

  final String image;
  final List<String> episode;
  final String url;

  factory InfoCharacter.fromJson(String str) =>
      InfoCharacter.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory InfoCharacter.fromMap(Map<String, dynamic> json) => InfoCharacter(
        id: json["id"],
        name: json["name"],
        species: json["species"],
        image: json["image"],
        episode: List<String>.from(json["episode"].map((x) => x)),
        url: json["url"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "species": species,
        "image": image,
        "episode": List<dynamic>.from(episode.map((x) => x)),
        "url": url,
      };
}
