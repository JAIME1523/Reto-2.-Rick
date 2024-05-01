import 'dart:convert';

class CustomInfoModel {
  CustomInfoModel( {
    required this.id,
    required this.name,
    this.species,
    required this.image,
    required this.episodeName,
    required this.airDate,
    required this.imagerul,
  });

  final int id;
  final String name;

  String? species;

  final String image;
  final String imagerul;

  final String episodeName;
  final String airDate;

  factory CustomInfoModel.fromJson(String str) =>
      CustomInfoModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CustomInfoModel.fromMap(Map<String, dynamic> json) => CustomInfoModel(
        id: json["id"],
        name: json["name"],
        
        species: json["species"],
        image: json["image"],
        episodeName:json["episode_name"],
        airDate: json["air_date"], imagerul: '',
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "species": species,
        "image": image,
        "episode_name": episodeName,
        "air_date": airDate,
      };
}
