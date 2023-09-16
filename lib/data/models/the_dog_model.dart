import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:the_dog_myapp/data/models/breed_model.dart';
import 'package:the_dog_myapp/domain/entities/the_dog.dart';

class TheDogModel extends Equatable {
  final List<BreedModel>? breeds;
  final String? id;
  final String? url;
  final int? width;
  final int? height;

  TheDogModel({
    this.breeds,
    this.id,
    this.url,
    this.width,
    this.height,
  });

  factory TheDogModel.fromJson(Map<String, dynamic> json) => TheDogModel(
        breeds: json["breeds"] == null
            ? []
            : List<BreedModel>.from(
                json["breeds"]!.map((x) => BreedModel.fromJson(x))),
        id: json["id"],
        url: json["url"],
        width: json["width"],
        height: json["height"],
      );

  Map<String, dynamic> toJson() => {
        "breeds": breeds == null
            ? []
            : List<dynamic>.from(breeds!.map((x) => x.toJson())),
        "id": id,
        "url": url,
        "width": width,
        "height": height,
      };

  factory TheDogModel.fromEntity(TheDog? dog) => TheDogModel(
        breeds: dog?.breeds
            ?.map((breed) => BreedModel(
                  id: breed.id,
                  name: breed.name,
                  bredFor: breed.bredFor,
                  breedGroup: breed.breedGroup,
                  lifeSpan: breed.lifeSpan,
                  temperament: breed.temperament,
                  referenceImageId: breed.referenceImageId,
                ))
            .toList(),
        id: dog?.id,
        url: dog?.url,
        width: dog?.width,
        height: dog?.height,
      );

  TheDog toEntity() {
    return TheDog(
        breeds: breeds?.map((e) => e.toEntity()).toList(),
        id: id,
        url: url,
        width: width,
        height: height);
  }

  @override
  List<Object?> get props {
    return [
      breeds,
      id,
      url,
      width,
      height,
    ];
  }
}
