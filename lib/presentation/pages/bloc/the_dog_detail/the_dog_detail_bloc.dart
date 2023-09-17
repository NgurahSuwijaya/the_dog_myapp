import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:the_dog_myapp/domain/entities/the_dog.dart';
import 'package:the_dog_myapp/domain/usecases/get_the_dog_detail_usecase.dart';

part 'the_dog_detail_event.dart';
part 'the_dog_detail_state.dart';

class TheDogDetailBloc extends Bloc<TheDogDetailEvent, TheDogDetailState> {
  final GetTheDogDetailUsecase _getTheDogDetailUsecase;

  TheDogDetailBloc(this._getTheDogDetailUsecase) : super(TheDogDetailEmpty()) {
    on<OnTheDogDetailEvent>(
      (event, emit) async {
        final id = event.id;

        emit(TheDogDetailLoading());

        final result = await _getTheDogDetailUsecase.execute(id);

        result.fold((l) => emit(TheDogDetailError(l.message)),
            (r) => emit(TheDogDetailHasData(r)));
      },
    );
  }
}
