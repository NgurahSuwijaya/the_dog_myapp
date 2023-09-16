// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class Eight extends Equatable {
  final String? imperial;
  final String? metric;

  Eight({required this.imperial, required this.metric});

  @override
  List<Object?> get props => [imperial, metric];
}
