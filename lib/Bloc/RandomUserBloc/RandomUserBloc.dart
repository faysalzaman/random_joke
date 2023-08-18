import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_joke/Controller/RandomUser/RandomUserController.dart';

import 'RandomUserStateAndEvent.dart';

class RandomUserBloc extends Bloc<RandomUserEvent, RandomUserState> {
  RandomUserBloc() : super(RandomUserInitialState()) {
    on<FetchRandomUserEvent>(
      (event, emit) async {
        emit(RandomUserLoadingState());
        try {
          final value = await RandomUserController().getModel();
          emit(RandomUserLoadedState(randomUserData: value));
        } catch (e) {
          if (e.toString().contains("SocketException")) {
            emit(RandomUserErrorState(message: "No Internet Connection"));
            return;
          }
          emit(RandomUserErrorState(
              message: e.toString().replaceAll("Exception:", "")));
        }
      },
    );
  }
}
