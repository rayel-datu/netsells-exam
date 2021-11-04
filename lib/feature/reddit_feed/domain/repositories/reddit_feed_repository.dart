import 'package:netsells_exam/feature/reddit_feed/domain/entities/sub_reddit_model.dart';
import 'package:netsells_exam/feature/reddit_feed/domain/services/reddit_feed_service.dart';

abstract class RedditFeedRepository {
  Future<List<SubRedditResponseModel>> get();
}

class RedditFeedRepositoryImpl extends RedditFeedRepository {
  RedditFeedRepositoryImpl(this.redditFeedService);

  final RedditFeedService redditFeedService;

  @override
  Future<List<SubRedditResponseModel>> get() async {
    List<SubRedditResponseModel> items = await redditFeedService.getFeed();
    return items;
  }
}
