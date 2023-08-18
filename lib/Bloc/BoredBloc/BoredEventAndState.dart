abstract class BoredEvent {}

class BoredFetch extends BoredEvent {}

abstract class BoredState {}

class BoredInitial extends BoredState {}

class BoredLoading extends BoredState {}

class BoredSuccess extends BoredState {
  final String activity;
  final String type;
  final num participants;
  final num price;
  final String link;
  final String key;
  final num accessibility;
  BoredSuccess({
    required this.activity,
    required this.type,
    required this.participants,
    required this.price,
    required this.link,
    required this.key,
    required this.accessibility,
  });
}

class BoredError extends BoredState {
  final String message;
  BoredError({required this.message});
}
