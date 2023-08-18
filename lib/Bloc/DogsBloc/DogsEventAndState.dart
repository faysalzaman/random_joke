abstract class DogsEvent {}

class DogsEventFetch extends DogsEvent {}

abstract class DogsState {}

class DogsStateInitial extends DogsState {}

class DogsStateLoading extends DogsState {}

class DogsStateSuccess extends DogsState {
  final String imageUrl;
  DogsStateSuccess({required this.imageUrl});
}

class DogsStateError extends DogsState {
  final String message;
  DogsStateError({required this.message});
}
