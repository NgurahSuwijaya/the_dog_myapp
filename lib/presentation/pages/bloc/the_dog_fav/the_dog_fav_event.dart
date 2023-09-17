part of 'the_dog_fav_bloc.dart';

abstract class TheDogFavEvent extends Equatable {
  const TheDogFavEvent();
}

class OnTheDogFavEvent extends TheDogFavEvent {
  OnTheDogFavEvent();

  @override
  List<Object?> get props => [];
}

class OnPostTheDogFavEvent extends TheDogFavEvent {
  final String id;

  OnPostTheDogFavEvent(this.id);

  @override
  List<Object?> get props => [];
}
