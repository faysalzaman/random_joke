import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_joke/Bloc/JokeBloc/JokeEventAndState.dart';
import 'package:random_joke/Controller/Joke/JokeController.dart';

class JokeBloc extends Bloc<JokeEvent, JokeState> {
  JokeBloc() : super(JokeStateInitial()) {
    on<JokeEventFetch>((event, emit) async {
      emit(JokeStateLoading());
      try {
        final response = await JokeController.getModel();
        emit(JokeStateSuccess(
          punchline: response.punchline.toString(),
          setup: response.setup.toString(),
        ));
      } catch (e) {
        emit(JokeStateError(message: e.toString()));
      }
    });
  }
}
