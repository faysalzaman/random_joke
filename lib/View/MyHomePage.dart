import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:random_joke/Model/HomePage/HomePageModel.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Funiverse"),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
            ),
            itemCount: HomePageModel.data["title"].length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: HomePageModel.data["onTap"][index],
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.cyan,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        HomePageModel.data["image"][index],
                        width: 80,
                        height: 80,
                        fit: BoxFit.fill,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      AutoSizeText(
                        HomePageModel.data["title"][index],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
