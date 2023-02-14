import 'package:hive/hive.dart';

import '../models/news.dart';
import '../web_services/news_web_services.dart';


class NewsRepository{
final NewsWebServices newsWebServices;
NewsRepository(this.newsWebServices);
Future<List<News>> getAllNews(String typeNews) async{
final nwes=await newsWebServices.getAllNews(typeNews);
//await putData(nwes, typeNews);
 print(nwes.map((nwess) => News.fromJson(nwess)).toList());
return nwes.map((nwess) => News.fromJson(nwess)).toList();
}
// Future putData( data,String typeNews) async{
//   var box=Hive.box(typeNews);
//   await box.clear();
//  box.put('ggg', data);
//  print(nwes.map((nwess) => News.fromJson(nwess)).toList())
//   // print(box.toMap().values.toList());
// }
}
