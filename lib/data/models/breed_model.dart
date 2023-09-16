// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:the_dog_myapp/data/models/eight_model.dart';
import 'package:the_dog_myapp/domain/entities/breed.dart';

class BreedModel extends Equatable {
  final EightModel? weight;
  final EightModel? height;
  final int? id;
  final String? name;
  final String? bredFor;
  final String? breedGroup;
  final String? lifeSpan;
  final String? temperament;
  final String? referenceImageId;

  BreedModel({
    this.weight,
    this.height,
    this.id,
    this.name,
    this.bredFor,
    this.breedGroup,
    this.lifeSpan,
    this.temperament,
    this.referenceImageId,
  });

  factory BreedModel.fromJson(Map<String, dynamic> json) => BreedModel(
        weight:
            json["weight"] == null ? null : EightModel.fromJson(json["weight"]),
        height:
            json["height"] == null ? null : EightModel.fromJson(json["height"]),
        id: json["id"],
        name: json["name"],
        bredFor: json["bred_for"],
        breedGroup: json["breed_group"],
        lifeSpan: json["life_span"],
        temperament: json["temperament"],
        referenceImageId: json["reference_image_id"],
      );

  Map<String, dynamic> toJson() => {
        "weight": weight?.toJson(),
        "height": height?.toJson(),
        "id": id,
        "name": name,
        "bred_for": bredFor,
        "breed_group": breedGroup,
        "life_span": lifeSpan,
        "temperament": temperament,
        "reference_image_id": referenceImageId,
      };

  Breed toEntity() {
    return Breed(
        weight: weight?.toEntity(),
        height: height?.toEntity(),
        id: id,
        name: name,
        bredFor: bredFor,
        breedGroup: breedGroup,
        lifeSpan: lifeSpan,
        temperament: temperament,
        referenceImageId: referenceImageId);
  }

  @override
  List<Object?> get props {
    return [
      weight,
      height,
      id,
      name,
      bredFor,
      breedGroup,
      lifeSpan,
      temperament,
      referenceImageId,
    ];
  }
}
