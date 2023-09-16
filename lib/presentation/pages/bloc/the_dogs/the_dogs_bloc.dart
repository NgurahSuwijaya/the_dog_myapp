import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:the_dog_myapp/domain/usecases/get_the_dogs_usecase.dart';

import '../../../../domain/entities/the_dog.dart';

part 'the_dogs_event.dart';
part 'the_dogs_state.dart';

class TheDogsBloc extends Bloc<TheDogsEvent, TheDogsState> {
  final GetTheDogUseCase _getTheDogUseCase;

  TheDogsBloc(this._getTheDogUseCase) : super(TheDogsEmpty()) {
    on<OnTheDogsEvent>((event, emit) async {
      emit(TheDogsLoading());

      final result = await _getTheDogUseCase.execute();

      result.fold((l) => emit(TheDogsError(message: l.message)), (r) {
        if (r.isNotEmpty) {
          emit(TheDogsHasData(r));
        } else {
          emit(TheDogsEmpty());
        }
      });
    });
  }
}
