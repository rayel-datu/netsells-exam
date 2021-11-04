import 'package:flutter/material.dart';
import 'package:netsells_exam/feature/reddit_feed/domain/entities/sub_reddit_model.dart';
import 'package:netsells_exam/feature/reddit_feed/presentation/widgets/reddit_title.dart';

class RedditFeedItemWidget extends StatefulWidget {
  const RedditFeedItemWidget({Key? key, required this.subRedditResponseModel})
      : super(key: key);
  final SubRedditResponseModel subRedditResponseModel;

  @override
  _RedditFeedItemWidgetState createState() => _RedditFeedItemWidgetState();
}

class _RedditFeedItemWidgetState extends State<RedditFeedItemWidget> {
  late bool _isExpanded;

  @override
  void initState() {
    _isExpanded = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(4),
        ),
      ),
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              '${widget.subRedditResponseModel.score}',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              width: 10,
            ),
            Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  RedditTitle(
                      flairColor: widget
                          .subRedditResponseModel.linkFlairBackgroundColor,
                      flairText: widget.subRedditResponseModel.linkFlairText,
                      titleText: widget.subRedditResponseModel.title),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _isExpanded = !_isExpanded;
                        });
                      },
                      child: Text(
                        widget.subRedditResponseModel.selfText ?? '',
                        style: const TextStyle(fontSize: 14),
                        softWrap: true,
                        maxLines: _isExpanded ? null : 4,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
