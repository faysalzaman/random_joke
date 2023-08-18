// ignore_for_file: unused_element

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_joke/Bloc/CatFactBloc/CatFactEventAndState.dart';
import 'package:random_joke/Controller/CatFact/CatFactController.dart';

class CatFactBloc extends Bloc<CatFactEvent, CatFactState> {
  CatFactBloc() : super(CatFactStateInitial()) {
    // event handle
    on<CatFactEventFetch>((event, emit) async {
      emit(CatFactStateLoading());
      try {
        final String data = await CatFactController.getModel();
        emit(CatFactStateSuccess(fact: data));
      } catch (error) {
        emit(CatFactStateError(message: error.toString()));
      }
    });
  }
}
