import 'dart:convert';

import 'package:netsells_exam/feature/reddit_feed/domain/entities/sub_reddit_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceService {
  void saveFeed(String feed) async {
    SharedPreferences _sharedPreferences =
        await SharedPreferences.getInstance();
    _sharedPreferences.setString('feed', feed);
  }

  Future<List<SubRedditResponseModel>> getFeed() async {
    SharedPreferences _sharedPreferences =
        await SharedPreferences.getInstance();

    final jsonString = _sharedPreferences.getString('feed');

    if (jsonString == null) {
      return <SubRedditResponseModel>[];
    }

    final jsonMap = json.decode(jsonString);

    List<SubRedditResponseModel> items =
        (jsonMap['data']['children'] as List).map((element) {
      return SubRedditResponseModel.fromJson(element['data']);
    }).toList();

    return items;
  }
}
