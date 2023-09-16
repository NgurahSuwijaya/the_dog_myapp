part of 'the_dogs_bloc.dart';

abstract class TheDogsEvent extends Equatable {
  const TheDogsEvent();
}

class OnTheDogsEvent extends TheDogsEvent {
  @override
  List<Object?> get props => [];
}
