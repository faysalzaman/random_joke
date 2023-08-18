import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_joke/Bloc/JokeBloc/JokeBloc.dart';
import 'package:random_joke/Bloc/JokeBloc/JokeEventAndState.dart';

class JokeScreen extends StatefulWidget {
  const JokeScreen({super.key});

  @override
  State<JokeScreen> createState() => _JokeScreenState();
}

class _JokeScreenState extends State<JokeScreen> {
  JokeBloc jokeBloc = JokeBloc();

  @override
  void initState() {
    jokeBloc = jokeBloc..add(JokeEventFetch());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Joke'),
      ),
      body: BlocBuilder<JokeBloc, JokeState>(
        bloc: jokeBloc,
        builder: (context, state) {
          if (state is JokeStateLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is JokeStateError) {
            return Center(
              child: Text(
                state.message,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            );
          }
          if (state is JokeStateSuccess) {
            return Container(
              padding: const EdgeInsets.all(10),
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Setup:\n${state.setup}",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 40),
                    Text(
                      "Punchline:\n${state.punchline}",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        jokeBloc.add(JokeEventFetch());
                      },
                      child: const Text('Refresh'),
                    ),
                  ],
                ),
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
