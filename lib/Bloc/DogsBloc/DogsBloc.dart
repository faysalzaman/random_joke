import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_joke/Bloc/DogsBloc/DogsEventAndState.dart';
import 'package:random_joke/Controller/Dogs/DogsController.dart';

class DogsBloc extends Bloc<DogsEvent, DogsState> {
  DogsBloc() : super(DogsStateInitial()) {
    on<DogsEventFetch>((event, emit) async {
      emit(DogsStateLoading());
      try {
        final String data = await DogsController.getModel();
        emit(DogsStateSuccess(imageUrl: data));
      } catch (error) {
        // check internet
        if (error.toString().contains("SocketException")) {
          emit(DogsStateError(message: "No Internet Connection"));
          return;
        }
        emit(DogsStateError(
            message: error.toString().replaceAll("Exception:", "")));
      }
    });
  }
}
