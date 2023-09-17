part of 'the_dog_detail_bloc.dart';

abstract class TheDogDetailState extends Equatable {
  const TheDogDetailState();

  @override
  List<Object> get props => [];
}

class TheDogDetailEmpty extends TheDogDetailState {
  @override
  List<Object> get props => [];
}

class TheDogDetailLoading extends TheDogDetailState {
  @override
  List<Object> get props => [];
}

class TheDogDetailError extends TheDogDetailState {
  String message;
  TheDogDetailError(this.message);

  @override
  List<Object> get props => [message];
}

class TheDogDetailHasData extends TheDogDetailState {
  final TheDog result;

  TheDogDetailHasData(this.result);

  @override
  List<Object> get props => [result];
}
