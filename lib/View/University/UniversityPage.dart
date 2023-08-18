import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_joke/Bloc/UniversityBloc/UniversityBloc.dart';

import '../../Bloc/UniversityBloc/UniversityStateAndEvent.dart';

class UniversityScreen extends StatefulWidget {
  const UniversityScreen({super.key});

  @override
  State<UniversityScreen> createState() => _UniversityScreenState();
}

class _UniversityScreenState extends State<UniversityScreen> {
  UniversityBloc universityBloc = UniversityBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Universities in USA"),
        centerTitle: true,
      ),
      body: BlocConsumer<UniversityBloc, UniversityState>(
        bloc: universityBloc..add(FetchUniversityEvent()),
        listener: (context, state) {},
        builder: (context, state) {
          if (state is UniversityInitialState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is UniversityLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is UniversityLoadedState) {
            return ListView.builder(
              itemCount: state.universityData.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 5,
                  child: ListTile(
                      title: Text(
                        state.universityData[index].name ?? "",
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      subtitle: Text(
                        state.universityData[index].country ?? "",
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                      trailing: Text(
                        index.toString(),
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      )),
                );
              },
            );
          } else if (state is UniversityErrorState) {
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
