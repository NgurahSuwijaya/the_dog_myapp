// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'eight.dart';

class Breed extends Equatable {
  final Eight? weight;
  final Eight? height;
  final int? id;
  final String? name;
  final String? bredFor;
  final String? breedGroup;
  final String? lifeSpan;
  final String? temperament;
  final String? referenceImageId;

  Breed({
    required this.weight,
    required this.height,
    required this.id,
    required this.name,
    required this.bredFor,
    required this.breedGroup,
    required this.lifeSpan,
    required this.temperament,
    required this.referenceImageId,
  });

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
