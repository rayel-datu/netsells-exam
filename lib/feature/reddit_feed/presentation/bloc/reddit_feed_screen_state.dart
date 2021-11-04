import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:netsells_exam/feature/reddit_feed/domain/entities/sub_reddit_model.dart';

part 'reddit_feed_screen_state.freezed.dart';

@freezed
class RedditFeedScreenState with _$RedditFeedScreenState {
  factory RedditFeedScreenState.initial() = RedditFeedScreenInitialState;

  factory RedditFeedScreenState.loading(List<SubRedditResponseModel> model) =
      RedditFeedScreenLoadingState;

  factory RedditFeedScreenState.success(List<SubRedditResponseModel> model) =
      RedditFeedScreenSuccessState;

  factory RedditFeedScreenState.failed(List<SubRedditResponseModel> model) =
      RedditFeedScreenFailedState;
}
