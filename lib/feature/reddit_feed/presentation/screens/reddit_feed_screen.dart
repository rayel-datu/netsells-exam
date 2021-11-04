import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netsells_exam/core/utils/dialog_utils.dart';
import 'package:netsells_exam/feature/reddit_feed/domain/entities/sub_reddit_model.dart';
import 'package:netsells_exam/feature/reddit_feed/domain/repositories/reddit_feed_repository.dart';
import 'package:netsells_exam/feature/reddit_feed/domain/services/reddit_feed_service.dart';
import 'package:netsells_exam/feature/reddit_feed/presentation/bloc/reddit_feed_screen_bloc.dart';
import 'package:netsells_exam/feature/reddit_feed/presentation/bloc/reddit_feed_screen_state.dart';
import 'package:netsells_exam/feature/reddit_feed/presentation/widgets/reddit_feed_item_widget.dart';

import 'package:provider/provider.dart';

class RedditFeedScreen extends StatelessWidget {
  const RedditFeedScreen({Key? key}) : super(key: key);
  static const String route = '/';

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RedditFeedScreenBloc>(
        create: (BuildContext context) =>
            RedditFeedScreenBloc(context.read<RedditFeedRepository>())
              ..getFeed(),
        child: BlocConsumer<RedditFeedScreenBloc, RedditFeedScreenState>(
            listener: (BuildContext context, RedditFeedScreenState state) {
          if (state is RedditFeedScreenLoadingState) {
            DialogUtils.showLoadingProgress(context);
          } else {
            DialogUtils.dismissLoadingProgress(context);
          }
          if (state is RedditFeedScreenFailedState) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content:
                    Text('Failed to get feed, trying to show saved feeds')));
          }
        }, builder: (BuildContext context, RedditFeedScreenState state) {
          if (state is RedditFeedScreenSuccessState ||
              state is RedditFeedScreenFailedState) {
            return Scaffold(
                backgroundColor: Colors.white70,
                appBar: AppBar(
                  title: const Text('Flutter Dev Feed'),
                ),
                body: RedditFeedScreenSuccessView(
                    items: context.read<RedditFeedScreenBloc>().getItems()));
          }
          return Scaffold(
            backgroundColor: Colors.white70,
            appBar: AppBar(
              title: const Text('Flutter Dev Feed'),
            ),
          );
        }));
  }
}

class RedditFeedScreenSuccessView extends StatelessWidget {
  const RedditFeedScreenSuccessView({Key? key, required this.items})
      : super(key: key);

  final List<SubRedditResponseModel> items;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: ListView.separated(
          itemBuilder: (BuildContext context, int index) =>
              RedditFeedItemWidget(subRedditResponseModel: items[index]),
          separatorBuilder: (BuildContext context, int index) => const SizedBox(
                height: 10,
              ),
          itemCount: items.length),
    );
  }
}
