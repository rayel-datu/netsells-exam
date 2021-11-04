import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:netsells_exam/core/domain/service/shared_preference_service.dart';
import 'package:netsells_exam/feature/reddit_feed/domain/entities/sub_reddit_model.dart';

class RedditFeedService {
  RedditFeedService(this.dio);

  final Dio dio;

  Future<List<SubRedditResponseModel>> getFeed() async {
    final Response response =
        await dio.get('https://www.reddit.com/r/FlutterDev.json');

    final jsonString = json.encode(response.data);

    final jsonMap = json.decode(jsonString);

    List<SubRedditResponseModel> items =
        (jsonMap['data']['children'] as List).map((element) {
      return SubRedditResponseModel.fromJson(element['data']);
    }).toList();

    SharedPreferenceService().saveFeed(jsonString);

    return items;
  }
}
