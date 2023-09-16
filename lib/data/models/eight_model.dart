// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:the_dog_myapp/domain/entities/eight.dart';

class EightModel extends Equatable {
  final String? imperial;
  final String? metric;

  EightModel({
    this.imperial,
    this.metric,
  });

  factory EightModel.fromJson(Map<String, dynamic> json) => EightModel(
        imperial: json["imperial"],
        metric: json["metric"],
      );

  Map<String, dynamic> toJson() => {
        "imperial": imperial,
        "metric": metric,
      };

  Eight toEntity() {
    return Eight(imperial: imperial, metric: metric);
  }

  @override
  List<Object?> get props => [imperial, metric];
}
