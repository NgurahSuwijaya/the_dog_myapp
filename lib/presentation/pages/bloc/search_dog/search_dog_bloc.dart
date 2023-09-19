import 'package:equatable/equatable.dart';
import 'package:the_dog_myapp/data/models/the_dog_local.dart';
import 'package:the_dog_myapp/domain/usecases/search_dog_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:rxdart/rxdart.dart';

part "search_dog_event.dart";
part "search_dog_state.dart";

class SearchDogBloc extends Bloc<SearchDogEvent, SearchDogState> {
  final SearchTheDogUseCase _searchTheDogUseCase;

  EventTransformer<Time> debounce<Time>(Duration duration) {
    return ((events, mapper) => events.debounceTime(duration).flatMap(mapper));
  }

  SearchDogBloc(this._searchTheDogUseCase) : super(SearchDogEmpty()) {
    on<OnDogQueryChanged>((event, emit) async {
      final query = event.query;

      if (query.isNotEmpty) {
        emit(SearchDogLoading());

        final result = await _searchTheDogUseCase.execute(query);

        result.fold(
            (l) => emit(SearchDogError(l.message)),
            (r) => {
                  if (r.isNotEmpty)
                    {emit(SearchDogHasData(r))}
                  else
                    {emit(SearchDogEmpty())}
                });
      } else {
        emit(SearchDogEmpty());
      }
    }, transformer: debounce(const Duration(milliseconds: 500)));
  }
}
