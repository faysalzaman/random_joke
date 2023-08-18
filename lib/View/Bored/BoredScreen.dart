import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_joke/Bloc/BoredBloc/BoredBloc.dart';
import 'package:random_joke/Bloc/BoredBloc/BoredEventAndState.dart';

class BoredScreen extends StatefulWidget {
  const BoredScreen({super.key});

  @override
  State<BoredScreen> createState() => _BoredScreenState();
}

class _BoredScreenState extends State<BoredScreen> {
  BoredBloc boredBloc = BoredBloc();
  @override
  void initState() {
    boredBloc = boredBloc..add(BoredFetch());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Are you Bored ?'),
      ),
      body: BlocBuilder<BoredBloc, BoredState>(
        bloc: boredBloc,
        builder: (context, state) {
          if (state is BoredLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is BoredError) {
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
          if (state is BoredSuccess) {
            return Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              padding: const EdgeInsets.all(10),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Activity:\n${state.activity}",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "Price:\n\$${state.price}",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    SelectableText(
                      "Link:\n${state.link}",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    // refresh button
                    ElevatedButton(
                      onPressed: () {
                        boredBloc.add(BoredFetch());
                      },
                      child: const Text('Refresh'),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
