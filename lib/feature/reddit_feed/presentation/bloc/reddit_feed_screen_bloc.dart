import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netsells_exam/core/domain/service/shared_preference_service.dart';
import 'package:netsells_exam/feature/reddit_feed/domain/entities/sub_reddit_model.dart';
import 'package:netsells_exam/feature/reddit_feed/domain/repositories/reddit_feed_repository.dart';
import 'package:netsells_exam/feature/reddit_feed/presentation/bloc/reddit_feed_screen_state.dart';

class RedditFeedScreenBloc extends Cubit<RedditFeedScreenState> {
  RedditFeedScreenBloc(this.repository)
      : super(RedditFeedScreenState.initial());

  final RedditFeedRepository repository;

  final List<SubRedditResponseModel> _items = <SubRedditResponseModel>[];

  List<SubRedditResponseModel> getItems() => _items;

  Future<void> getFeed() async {
    emit(RedditFeedScreenState.loading(_items));
    _items.clear();
    try {
      List<SubRedditResponseModel> responseModel = await repository.get();
      _items.addAll(responseModel);
      emit(RedditFeedScreenState.success(responseModel));
    } catch (e) {
      _items.addAll(await SharedPreferenceService().getFeed());
      emit(RedditFeedScreenState.failed(_items));
    }
  }
}
