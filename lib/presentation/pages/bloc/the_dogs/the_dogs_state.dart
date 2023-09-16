// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'the_dogs_bloc.dart';

abstract class TheDogsState extends Equatable {
  const TheDogsState();

  @override
  List<Object> get props => [];
}

class TheDogsEmpty extends TheDogsState {
  @override
  List<Object> get props => [];
}

class TheDogsLoading extends TheDogsState {
  @override
  List<Object> get props => [];
}

class TheDogsError extends TheDogsState {
  String message;

  TheDogsError({
    required this.message,
  });

  @override
  List<Object> get props => [message];
}

class TheDogsInsertSuccess extends TheDogsState {
  String message;

  TheDogsInsertSuccess({
    required this.message,
  });

  @override
  List<Object> get props => [message];
}

class TheDogsHasData extends TheDogsState {
  final List<TheDogLocal> result;

  TheDogsHasData(this.result);

  @override
  List<Object> get props => [result];
}
