import 'package:flutter/cupertino.dart';
import 'package:netsells_exam/core/presentation/widget/flair_widget.dart';
import 'package:netsells_exam/core/utils/extensions.dart';

class RedditTitle extends StatelessWidget {
  const RedditTitle(
      {Key? key,
      required this.flairColor,
      required this.flairText,
      required this.titleText})
      : super(key: key);
  final String flairColor;
  final String flairText;
  final String titleText;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        FlairWidget(color: flairColor.toColor(), text: flairText),
        const SizedBox(
          width: 10,
        ),
        Flexible(
          child: Text(
            titleText,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            maxLines: 2,
          ),
        )
      ],
    );
  }
}
