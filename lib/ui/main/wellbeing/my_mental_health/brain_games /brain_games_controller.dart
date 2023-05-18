import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:social_value/network/wellbing_repo.dart';
import '../../../../../api/api_extension.dart';
import '../../../../../models/games_model.dart';
import '../../../../../theme/app_helpers.dart';

class BrainGamesController extends GetxController {
  RxBool isLoading = false.obs;
  List<GamesList> gamesList = [];

  getGames() async {
    gamesList.clear();
    FocusManager.instance.primaryFocus?.unfocus();
    isLoading.value = true;
    dynamic result;
    result = await WellbeingRepo.instance.getGames();
    try {
      print("data123${json.decode(result)}");
      var data = gamesListFromJson(result ?? []);
      gamesList = data;
    } catch (e) {
      print(e);
      showAppSnackBar(errorText);
    }
    isLoading.value = false;
    update();
  }
}
