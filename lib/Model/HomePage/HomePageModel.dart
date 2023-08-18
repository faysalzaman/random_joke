// ignore_for_file: file_names

import 'package:get/get.dart';
import 'package:random_joke/View/Bored/BoredScreen.dart';
import 'package:random_joke/View/CatFact/CatFactScreen.dart';
import 'package:random_joke/View/Dogs/DogsScreen.dart';
import 'package:random_joke/View/Joke/JokeScreen.dart';
import 'package:random_joke/View/RandomUser/RandomUserPage.dart';

import '../../View/University/UniversityPage.dart';

class HomePageModel {
  static Map<String, dynamic> data = {
    "title": [
      "USA Universities",
      "Random User",
      "Cat Facts",
      "Dogs",
      "Jokes",
      "Bored",
    ],
    "image": [
      "assets/graduation.png",
      "assets/team.png",
      "assets/cat.png",
      "assets/dog.png",
      "assets/kidding.png",
      "assets/bored.png",
    ],
    "onTap": [
      () {
        Get.to(() => const UniversityScreen());
      },
      () {
        Get.to(() => const RandomUserPage());
      },
      () {
        Get.to(() => const CatFact());
      },
      () {
        Get.to(() => const DogsScreen());
      },
      () {
        Get.to(() => const JokeScreen());
      },
      () {
        Get.to(() => const BoredScreen());
      },
    ],
  };
}
