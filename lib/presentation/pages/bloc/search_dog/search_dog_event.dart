part of "search_dog_bloc.dart";

class SearchDogEvent extends Equatable {
  const SearchDogEvent();

  @override
  List<Object?> get props => [];
}

class OnDogQueryChanged extends SearchDogEvent {
  final String query;

  OnDogQueryChanged(this.query);

  @override
  List<Object?> get props => [query];
}
