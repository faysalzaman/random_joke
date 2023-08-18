// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_joke/Bloc/CatFactBloc/CatFactBloc.dart';
import 'package:random_joke/Bloc/CatFactBloc/CatFactEventAndState.dart';

class CatFact extends StatefulWidget {
  const CatFact({super.key});

  @override
  State<CatFact> createState() => _CatFactState();
}

class _CatFactState extends State<CatFact> {
  CatFactBloc catFactBloc = CatFactBloc();
  @override
  void initState() {
    // event registered | event fire
    catFactBloc = catFactBloc..add(CatFactEventFetch());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cat Fact'),
      ),
      body: BlocBuilder<CatFactBloc, CatFactState>(
        bloc: catFactBloc,
        builder: (context, state) {
          if (state is CatFactStateLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is CatFactStateSuccess) {
            return Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        "Do you know ?\n\n${state.fact}",
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 20),
                    // refresh button
                    ElevatedButton(
                      onPressed: () {
                        catFactBloc.add(CatFactEventFetch());
                      },
                      child: const Text('Refresh'),
                    ),
                  ],
                ),
              ),
            );
          } else if (state is CatFactStateError) {
            return Center(
              child: Text(state.message),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
