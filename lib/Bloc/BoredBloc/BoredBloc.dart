// ignore_for_file: file_names

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_joke/Bloc/BoredBloc/BoredEventAndState.dart';
import 'package:random_joke/Controller/Bored/BoredController.dart';

class BoredBloc extends Bloc<BoredEvent, BoredState> {
  BoredBloc() : super(BoredInitial()) {
    on<BoredFetch>(
      (event, emit) async {
        emit(BoredLoading());
        try {
          final response = await BoredController.getModel();
          emit(
            BoredSuccess(
              activity: response.activity.toString(),
              type: response.type.toString(),
              participants: response.participants as num,
              price: response.price as num,
              link: response.link.toString(),
              key: response.key.toString(),
              accessibility: response.accessibility as num,
            ),
          );
        } catch (e) {
          // check internet
          if (e.toString().contains("SocketException")) {
            emit(BoredError(message: "No Internet Connection"));
            return;
          }
          emit(BoredError(message: e.toString().replaceAll("Exception:", "")));
        }
      },
    );
  }
}
