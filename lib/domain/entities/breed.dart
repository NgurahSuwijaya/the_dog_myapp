// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'eight.dart';

class Breed extends Equatable {
  final int? id;
  final String? name;
  final String? bredFor;
  final String? breedGroup;
  final String? lifeSpan;
  final String? temperament;
  final String? referenceImageId;

  Breed({
    this.id,
    this.name,
    this.bredFor,
    this.breedGroup,
    this.lifeSpan,
    this.temperament,
    this.referenceImageId,
  });

  @override
  List<Object?> get props {
    return [
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
