import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:netsells_exam/feature/reddit_feed/domain/entities/base_response_model.dart';

part 'sub_reddit_model.g.dart';

@JsonSerializable()
class SubRedditResponseModel extends BaseResponseModel {
  SubRedditResponseModel(
      this.authorFullName,
      this.score,
      this.numComments,
      this.linkFlairText,
      this.linkFlairBackgroundColor,
      this.permalink,
      this.url,
      this.title,
      this.selfText,
      this.selfTextHtml);

  factory SubRedditResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SubRedditResponseModelFromJson(json);

  @JsonKey(name: 'author_fullname')
  final String authorFullName;

  @JsonKey(name: 'score')
  final int score;

  @JsonKey(name: 'num_comments')
  final int numComments;

  @JsonKey(name: 'link_flair_text')
  final String linkFlairText;

  @JsonKey(name: 'link_flair_background_color')
  final String linkFlairBackgroundColor;

  @JsonKey(name: 'permalink')
  final String permalink;

  @JsonKey(name: 'url')
  final String url;

  @JsonKey(name: 'title')
  final String title;

  @JsonKey(name: 'selftext')
  final String? selfText;

  @JsonKey(name: 'selftext_html')
  final String? selfTextHtml;

  Map<String, dynamic> toJson() => _$SubRedditResponseModelToJson(this);
}
