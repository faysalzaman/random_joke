// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_joke/Bloc/DogsBloc/DogsBloc.dart';
import 'package:random_joke/Bloc/DogsBloc/DogsEventAndState.dart';

class DogsScreen extends StatefulWidget {
  const DogsScreen({super.key});

  @override
  State<DogsScreen> createState() => _DogsScreenState();
}

class _DogsScreenState extends State<DogsScreen> {
  DogsBloc dogsBloc = DogsBloc();

  @override
  void initState() {
    super.initState();
    dogsBloc = dogsBloc..add(DogsEventFetch());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dogs'),
      ),
      body: BlocBuilder<DogsBloc, DogsState>(
        bloc: dogsBloc,
        builder: (context, state) {
          if (state is DogsStateLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is DogsStateError) {
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
          } else if (state is DogsStateSuccess) {
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  Image.network(
                    state.imageUrl,
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.4,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        dogsBloc.add(DogsEventFetch());
                      });
                    },
                    child: const Text('Refresh'),
                  ),
                ],
              ),
            );
          } else {
            return const Center(
                child: Text('Something went wrong!, please try again later.'));
          }
        },
      ),
    );
  }
}
