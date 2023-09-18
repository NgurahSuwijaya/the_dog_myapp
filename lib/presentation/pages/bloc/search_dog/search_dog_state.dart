part of "search_dog_bloc.dart";

abstract class SearchDogState extends Equatable {
  const SearchDogState();

  @override
  List<Object> get props => [];
}

class SearchDogEmpty extends SearchDogState {}

class SearchDogLoading extends SearchDogState {}

class SearchDogError extends SearchDogState {
  final String message;

  SearchDogError(this.message);

  @override
  List<Object> get props => [message];
}

class SearchDogHasData extends SearchDogState {
  final List<TheDogLocal> result;

  SearchDogHasData(this.result);

  @override
  List<Object> get props => [result];
}
