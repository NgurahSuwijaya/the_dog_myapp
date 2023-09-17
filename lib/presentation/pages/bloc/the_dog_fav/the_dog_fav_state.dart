part of 'the_dog_fav_bloc.dart';

abstract class TheDogFavState extends Equatable {
  const TheDogFavState();

  @override
  List<Object> get props => [];
}

class TheDogFavEmpty extends TheDogFavState {
  @override
  List<Object> get props => [];
}

class TheDogFavLoading extends TheDogFavState {
  @override
  List<Object> get props => [];
}

class ClearTheDogFavEvent extends TheDogFavEvent {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class TheDogFavError extends TheDogFavState {
  String message;
  TheDogFavError(this.message);

  @override
  List<Object> get props => [message];
}

class TheDogFavHasData extends TheDogFavState {
  final List<Favourite> result;

  TheDogFavHasData(this.result);

  @override
  List<Object> get props => [result];
}

class TheDogPostFavSuccess extends TheDogFavState {
  final Response result;

  TheDogPostFavSuccess(this.result);
}
