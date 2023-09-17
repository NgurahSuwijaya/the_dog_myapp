// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:the_dog_myapp/domain/entities/favourite.dart';

class FavouriteModel extends Equatable {
  final int? id;
  final String? userId;
  final String? imageId;
  final DateTime? createdAt;
  final ImageModel? image;

  FavouriteModel({
    this.id,
    this.userId,
    this.imageId,
    this.createdAt,
    this.image,
  });

  factory FavouriteModel.fromJson(Map<String, dynamic> json) => FavouriteModel(
        id: json["id"],
        userId: json["user_id"],
        imageId: json["image_id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        image:
            json["image"] == null ? null : ImageModel.fromJson(json["image"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "image_id": imageId,
        "created_at": createdAt?.toIso8601String(),
        "image": image?.toJson(),
      };

  Favourite toEntity() {
    return Favourite(id, userId, imageId, createdAt, image?.toEntity());
  }

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

class ImageModel extends Equatable {
  final String? id;
  final String? url;

  ImageModel({
    this.id,
    this.url,
  });

  factory ImageModel.fromJson(Map<String, dynamic> json) => ImageModel(
        id: json["id"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "url": url,
      };

  Image toEntity() {
    return Image(id, url);
  }

  @override
  List<Object?> get props => [id, url];
}
