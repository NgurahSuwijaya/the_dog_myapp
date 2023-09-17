import 'package:equatable/equatable.dart';
import 'package:the_dog_myapp/domain/entities/favourite.dart';
import 'package:bloc/bloc.dart';
import 'package:the_dog_myapp/domain/usecases/post_the_dog_fav_usecase.dart';

import '../../../../domain/entities/response.dart';
import '../../../../domain/usecases/get_the_dog_fav_usecase.dart';

part 'the_dog_fav_state.dart';
part 'the_dog_fav_event.dart';

class TheDogFavBloc extends Bloc<TheDogFavEvent, TheDogFavState> {
  final PostTheDogFavUseCase _postTheDogFavUseCase;
  final GetTheDogFavUseCase _getTheDogFavUsecase;

  TheDogFavBloc(this._getTheDogFavUsecase, this._postTheDogFavUseCase)
      : super(TheDogFavEmpty()) {
    on<OnTheDogFavEvent>(
      (event, emit) async {
        emit(TheDogFavLoading());

        final result = await _getTheDogFavUsecase.execute();

        result.fold((l) => emit(TheDogFavError(l.message)),
            (r) => emit(TheDogFavHasData(r)));
      },
    );
    on<OnPostTheDogFavEvent>(
      (event, emit) async {
        final id = event.id;

        final result = await _postTheDogFavUseCase.execute(id: id);

        result.fold(
          (l) => emit(TheDogFavError(l.message)),
          (r) => emit(TheDogPostFavSuccess(r)),
        );
      },
    );
    on<ClearTheDogFavEvent>((event, emit) {
      emit(TheDogFavEmpty());
    });
  }
}
