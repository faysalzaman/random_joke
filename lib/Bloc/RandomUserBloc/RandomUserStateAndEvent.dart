import 'package:random_joke/Model/RandomUser/RamdomUserModel.dart';

abstract class RandomUserEvent {}

class FetchRandomUserEvent extends RandomUserEvent {}

abstract class RandomUserState {}

class RandomUserInitialState extends RandomUserState {}

class RandomUserLoadingState extends RandomUserState {}

class RandomUserLoadedState extends RandomUserState {
  RandomUserModel randomUserData;
  RandomUserLoadedState({required this.randomUserData});
}

class RandomUserErrorState extends RandomUserState {
  String message;
  RandomUserErrorState({required this.message});
}
