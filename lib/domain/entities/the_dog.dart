// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'breed.dart';

class TheDog extends Equatable {
  final List<Breed>? breeds;
  final String? id;
  final String? url;
  final int? width;
  final int? height;

  TheDog(
      {required this.breeds,
      required this.id,
      required this.url,
      required this.width,
      required this.height});

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
