import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_joke/Bloc/UniversityBloc/UniversityStateAndEvent.dart';

import '../../Controller/Universities/UniversitiesListController.dart';

class UniversityBloc extends Bloc<UniversityEvent, UniversityState> {
  UniversityBloc() : super(UniversityInitialState()) {
    on<FetchUniversityEvent>((event, emit) async {
      emit(UniversityLoadingState());
      try {
        final value = await UniversityListController().getModel();
        emit(UniversityLoadedState(universityData: value));
      } catch (e) {
        // check internet
        if (e.toString().contains("SocketException")) {
          emit(UniversityErrorState(message: "No Internet Connection"));
          return;
        }
        emit(UniversityErrorState(
            message: e.toString().replaceAll("Exception:", "")));
      }
    });
  }
}
