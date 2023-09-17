// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import '../../domain/entities/response.dart';

class ResponseModel extends Equatable {
  final String? message;
  final int? id;

  ResponseModel({
    this.message,
    this.id,
  });

  factory ResponseModel.fromJson(Map<String, dynamic> json) => ResponseModel(
        message: json["message"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "id": id,
      };

  Response toEntity() {
    return Response(message, id);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [message, id];
}
