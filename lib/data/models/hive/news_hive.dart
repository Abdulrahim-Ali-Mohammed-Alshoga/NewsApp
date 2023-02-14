import 'package:hive/hive.dart';

part 'news_hive.g.dart';

@HiveType(typeId: 1)
class NewsHive extends HiveObject {
  @HiveField(0)
  String? image;
  @HiveField(1)
  String? description;
  @HiveField(2)
  String? title;
  @HiveField(3)
  String? date;
  @HiveField(4)
  String? urlSite;

  NewsHive(this.image, this.description, this.title, this.date, this.urlSite);
}
//flutter packages pub run build_runner build
