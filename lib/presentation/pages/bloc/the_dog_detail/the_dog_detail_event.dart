part of 'the_dog_detail_bloc.dart';

abstract class TheDogDetailEvent extends Equatable {
  const TheDogDetailEvent();
}

class OnTheDogDetailEvent extends TheDogDetailEvent {
  final String id;

  OnTheDogDetailEvent(this.id);

  @override
  List<Object?> get props => [];
}
