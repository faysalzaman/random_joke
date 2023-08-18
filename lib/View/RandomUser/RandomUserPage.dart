import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_joke/Bloc/RandomUserBloc/RandomUserBloc.dart';
import 'package:random_joke/Bloc/RandomUserBloc/RandomUserStateAndEvent.dart';

class RandomUserPage extends StatefulWidget {
  const RandomUserPage({super.key});

  @override
  State<RandomUserPage> createState() => _RandomUserPageState();
}

class _RandomUserPageState extends State<RandomUserPage> {
  RandomUserBloc randomUserBloc = RandomUserBloc();

  @override
  void initState() {
    randomUserBloc = randomUserBloc..add(FetchRandomUserEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Random User"),
        centerTitle: true,
        // refresh button
        actions: [
          IconButton(
            onPressed: () {
              randomUserBloc.add(FetchRandomUserEvent());
            },
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: BlocConsumer<RandomUserBloc, RandomUserState>(
        bloc: randomUserBloc,
        listener: (context, state) {},
        builder: (context, state) {
          if (state is RandomUserLoadingState) {
            return const Center(child: Text("Loading"));
          } else if (state is RandomUserLoadedState) {
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.center,
                      child: Image.network(
                        "${state.randomUserData.picture!.large}",
                        height: 200,
                        width: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      margin: const EdgeInsets.only(left: 10, right: 10),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                        ),
                      ),
                      child: Text(
                        "Name: ${state.randomUserData.name!.title} ${state.randomUserData.name!.first} ${state.randomUserData.name!.last}",
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      margin: const EdgeInsets.only(left: 10, right: 10),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                        ),
                      ),
                      child: Text(
                        "Street # ${state.randomUserData.location!.street!.number}, ${state.randomUserData.location!.street!.name}, ${state.randomUserData.location!.city}, ${state.randomUserData.location!.state}, ${state.randomUserData.location!.country}.",
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      margin: const EdgeInsets.only(left: 10, right: 10),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                        ),
                      ),
                      child: Text(
                        "Phone: ${state.randomUserData.phone}",
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      margin: const EdgeInsets.only(left: 10, right: 10),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                        ),
                      ),
                      child: Text(
                        "Age: ${state.randomUserData.dob!.age}",
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else if (state is RandomUserErrorState) {
            return Center(child: Text(state.message));
          } else {
            return const Center(child: Text("Something went wrong"));
          }
        },
      ),
    );
  }
}
