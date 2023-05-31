import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
part 'cat_fact.g.dart';

@JsonSerializable()
@HiveType(typeId: 0)
class CatFact extends HiveObject{
  @HiveField(0)
  final String fact;
  @HiveField(1)
  final int length;

  CatFact({required this.fact, required this.length});

  factory CatFact.fromJson(Map<String, dynamic> json) =>
      _$CatFactFromJson(json);

  Map<String, dynamic> toJson() => _$CatFactToJson(this);

}

@JsonSerializable()
@HiveType(typeId: 1)
class PageLink extends HiveObject {
  @HiveField(0)
  final String? url;
  @HiveField(1)
  final String label;
  @HiveField(2)
  final bool active;

  PageLink({this.url, required this.label, required this.active});

  factory PageLink.fromJson(Map<String, dynamic> json) =>
      _$PageLinkFromJson(json);

  Map<String, dynamic> toJson() => _$PageLinkToJson(this);
}

@JsonSerializable()
@HiveType(typeId: 2)
class CatFactsResponse extends HiveObject {
  @JsonKey(name:'current_page')
  @HiveField(0)
  final int currentPage;
  @HiveField(1)
  final List<CatFact> data;
  @HiveField(2)
  @JsonKey(name:'first_page_url')
  final String firstPageUrl;
  @HiveField(3)
  final int from;
  @HiveField(4)
  @JsonKey(name:'last_page')
  final int lastPage;
  @HiveField(5)
  @JsonKey(name:'last_page_url')
  final String lastPageUrl;
  @HiveField(6)
  final List<PageLink> links;
  @HiveField(7)
  @JsonKey(name:'next_page_url')
  final String nextPageUrl;
  @HiveField(8)
  final String path;
  @HiveField(9)
  @JsonKey(name:'per_page')
  final int perPage;
  @HiveField(10)
  @JsonKey(name:'prev_page_url')
  final String? prevPageUrl;
  @HiveField(11)
  final int to;
  @HiveField(12)
  final int total;

  CatFactsResponse({
    required this.currentPage,
    required this.data,
    required this.firstPageUrl,
    required this.from,
    required this.lastPage,
    required this.lastPageUrl,
    required this.links,
    required this.nextPageUrl,
    required this.path,
    required this.perPage,
    this.prevPageUrl,
    required this.to,
    required this.total,
  });

  factory CatFactsResponse.fromJson(Map<String, dynamic> json) =>
      _$CatFactsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CatFactsResponseToJson(this);
}