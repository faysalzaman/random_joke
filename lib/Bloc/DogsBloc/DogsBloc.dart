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
        emit(DogsStateError(message: error.toString()));
      }
    });
  }
}
