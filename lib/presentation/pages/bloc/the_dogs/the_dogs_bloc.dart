import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:the_dog_myapp/data/models/the_dog_local.dart';
import 'package:the_dog_myapp/domain/usecases/get_the_dogs_usecase.dart';
import 'package:the_dog_myapp/domain/usecases/get_the_local_dogs_usecase.dart';

import '../../../../domain/entities/the_dog.dart';
import '../../../../domain/usecases/insert_the_dog_usecase.dart';

part 'the_dogs_event.dart';
part 'the_dogs_state.dart';

class TheDogsBloc extends Bloc<TheDogsEvent, TheDogsState> {
  final GetTheDogUseCase _getTheDogUseCase;
  final InsertTheDogUseCase _insertTheDogUseCase;
  final GetTheLocaLDogUseCase _getTheLocaLDogUseCase;

  bool _apiDataFetched = false;

  TheDogsBloc(this._getTheDogUseCase, this._insertTheDogUseCase,
      this._getTheLocaLDogUseCase)
      : super(TheDogsEmpty()) {
    //get data from api
    on<OnTheDogsEvent>((event, emit) async {
      emit(TheDogsLoading());

      if (!_apiDataFetched) {
        final result = await _getTheDogUseCase.execute();

        result.fold((l) => emit(TheDogsError(message: l.message)), (r) {
          if (r.isNotEmpty) {
            add(OnInsertTheDogsEvent(dogs: r));
            _apiDataFetched = true;
            add(OnGetLocalTheDogsEvent());
          }
        });
      } else {
        add(OnGetLocalTheDogsEvent());
      }
    });

    //insert data to database
    on<OnInsertTheDogsEvent>((event, emit) async {
      final List<TheDog> dogs = event.dogs;
      final result = await _insertTheDogUseCase.execute(dogs);

      result.fold(
        (l) => emit(TheDogsError(message: l.message)),
        (r) => emit(TheDogsInsertSuccess(message: r)),
      );
    });

    // Get local data
    on<OnGetLocalTheDogsEvent>((event, emit) async {
      final result = await _getTheLocaLDogUseCase.execute();
      result.fold(
        (l) => emit(TheDogsError(message: l.message)),
        (r) => emit(TheDogsHasData(r)),
      );
    });
  }
}
