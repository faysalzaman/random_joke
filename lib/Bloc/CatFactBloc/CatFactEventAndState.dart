abstract class CatFactEvent {}

class CatFactEventFetch extends CatFactEvent {}

abstract class CatFactState {}

class CatFactStateInitial extends CatFactState {}

class CatFactStateLoading extends CatFactState {}

class CatFactStateSuccess extends CatFactState {
  final String fact;
  CatFactStateSuccess({required this.fact});
}

class CatFactStateError extends CatFactState {
  final String message;
  CatFactStateError({required this.message});
}
