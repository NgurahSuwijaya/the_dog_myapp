// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class Response extends Equatable {
  final String? message;
  final int? id;

  Response(this.message, this.id);

  @override
  List<Object?> get props => [message, id];
}
