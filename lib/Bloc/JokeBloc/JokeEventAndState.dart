abstract class JokeEvent {}

class JokeEventFetch extends JokeEvent {}

abstract class JokeState {}

class JokeStateInitial extends JokeState {}

class JokeStateLoading extends JokeState {}

class JokeStateSuccess extends JokeState {
  final String setup;
  final String punchline;

  JokeStateSuccess({
    required this.setup,
    required this.punchline,
  });
}

class JokeStateError extends JokeState {
  final String message;

  JokeStateError({
    required this.message,
  });
}
