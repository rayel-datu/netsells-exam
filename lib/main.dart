import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netsells_exam/feature/reddit_feed/domain/repositories/reddit_feed_repository.dart';
import 'package:netsells_exam/feature/reddit_feed/domain/services/reddit_feed_service.dart';
import 'package:netsells_exam/feature/reddit_feed/presentation/screens/reddit_feed_screen.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Dio dio = Dio();

    RedditFeedService redditFeedService = RedditFeedService(dio);

    return MultiProvider(
      providers: [
        Provider<RedditFeedRepository>(
          create: (context) => RedditFeedRepositoryImpl(redditFeedService),
        ),

      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: Routes.onGenerateRoute,
        initialRoute: RedditFeedScreen.route,
      ),
    );
  }
}

class Routes {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final Object? args = settings.arguments;
    switch (settings.name) {
      case RedditFeedScreen.route:
        return MaterialPageRoute<Widget>(
            builder: (_) => const RedditFeedScreen());
      default:
        return MaterialPageRoute<Widget>(
            builder: (_) => const RedditFeedScreen());
    }
  }
}
