part of 'the_dogs_bloc.dart';

abstract class TheDogsEvent extends Equatable {
  const TheDogsEvent();
}

class OnTheDogsEvent extends TheDogsEvent {
  @override
  List<Object?> get props => [];
}

class OnGetLocalTheDogsEvent extends TheDogsEvent {
  @override
  List<Object?> get props => [];
}

class OnInsertTheDogsEvent extends TheDogsEvent {
  final List<TheDog> dogs;

  const OnInsertTheDogsEvent({required this.dogs});

  @override
  List<Object> get props => [dogs];
}
