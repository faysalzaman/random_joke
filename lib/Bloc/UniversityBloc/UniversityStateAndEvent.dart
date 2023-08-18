import 'package:random_joke/Model/Universities/UniversitiesListModel.dart';

abstract class UniversityEvent {}

class FetchUniversityEvent extends UniversityEvent {}

abstract class UniversityState {}

class UniversityInitialState extends UniversityState {}

class UniversityLoadingState extends UniversityState {}

class UniversityLoadedState extends UniversityState {
  final List<UniversitiesListModel> universityData;
  UniversityLoadedState({required this.universityData});
}

class UniversityErrorState extends UniversityState {
  final String message;
  UniversityErrorState({required this.message});
}
