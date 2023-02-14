import 'package:hive/hive.dart';

import '../models/hive/news_hive.dart';
import '../models/news.dart';

class NewsHiveRepository {
  Future putNewsHive(List<News> data, String typeNews) async {
    var box = Hive.box<NewsHive>(typeNews);
    NewsHive newsHive;
    await box.clear();

    for (var d in data) {
      newsHive = NewsHive(d.image, d.description, d.title, d.date, d.urlSite);
      box.add(newsHive);
    }
  }

  Future<List<News>> getAllNewsHive(String typeNews) async {
    var box = Hive.box<NewsHive>(typeNews);
    if (box.toMap().values.toList() != []) {
      List<News> news = await box.values
          .map((nwess) => News(nwess.image, nwess.description, nwess.title,
              nwess.date, nwess.urlSite))
          .toList();
      return news;
    } else {
      return [];
    }
  }
}
