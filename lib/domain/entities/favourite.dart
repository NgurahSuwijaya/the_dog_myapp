// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class Favourite extends Equatable {
  final int? id;
  final String? userId;
  final String? imageId;
  final DateTime? createdAt;
  final Image? image;

  Favourite(this.id, this.userId, this.imageId, this.createdAt, this.image);

  @override
  List<Object?> get props {
    return [
      id,
      userId,
      imageId,
      createdAt,
      image,
    ];
  }
}

class Image extends Equatable {
  final String? id;
  final String? url;

  Image(this.id, this.url);

  @override
  List<Object?> get props => [id, url];
}
