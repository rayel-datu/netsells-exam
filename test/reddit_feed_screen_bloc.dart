import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:netsells_exam/feature/reddit_feed/domain/entities/sub_reddit_model.dart';
import 'package:netsells_exam/feature/reddit_feed/domain/repositories/reddit_feed_repository.dart';
import 'package:netsells_exam/feature/reddit_feed/domain/services/reddit_feed_service.dart';
import 'package:netsells_exam/feature/reddit_feed/presentation/bloc/reddit_feed_screen_bloc.dart';
import 'package:netsells_exam/feature/reddit_feed/presentation/bloc/reddit_feed_screen_state.dart';

class MockRedditFeedRepository extends Mock
    implements RedditFeedRepositoryImpl {}

class MockRedditFeedService extends Mock implements RedditFeedService {}


/// UGH, no time to debug.
main() {
  test('bloc test get feed', () async {
    RedditFeedService service = MockRedditFeedService();
    RedditFeedRepository repository = MockRedditFeedRepository();

    RedditFeedScreenBloc bloc = RedditFeedScreenBloc(repository);

    List<SubRedditResponseModel> items = <SubRedditResponseModel>[];

    when(service.getFeed()).thenAnswer((_) =>
        Future<List<SubRedditResponseModel>>.value(<SubRedditResponseModel>[]));

    when(repository.get())
        .thenAnswer((_) => Future<List<SubRedditResponseModel>>.value(items));

    bloc.getFeed();

    expect(bloc.state, RedditFeedScreenSuccessState);
  });
}
