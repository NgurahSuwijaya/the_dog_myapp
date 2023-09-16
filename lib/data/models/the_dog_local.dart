// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class TheDogLocal extends Equatable {
  final int id;
  final String? dogId;
  final String? name;
  final String? breedGroup;
  final String? url;

  TheDogLocal(
      {required this.id,
      required this.dogId,
      required this.name,
      required this.breedGroup,
      required this.url});

  factory TheDogLocal.fromMap(Map<String, dynamic> map) => TheDogLocal(
      id: map['id'],
      dogId: map['dog_id'],
      name: map['name'],
      breedGroup: map['breed_group'],
      url: map['url']);

  @override
  List<Object?> get props {
    return [
      id,
      dogId,
      name,
      breedGroup,
      url,
    ];
  }
}
