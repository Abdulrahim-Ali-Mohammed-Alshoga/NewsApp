import 'package:dio/dio.dart';

import '../../constants/conction.dart';


class NewsWebServices {
  late Dio dio;

  NewsWebServices() {
    BaseOptions baseOptions = BaseOptions(
        baseUrl: Conction().baseeUrl,
        receiveTimeout: 20 * 1000,
        connectTimeout: 20 * 1000,
        receiveDataWhenStatusError: true);
    dio = Dio(baseOptions);
  }

  Future<List<dynamic>> getAllNews(String typeNews) async {
    Response response = await dio.get('v2/everything', queryParameters: {
      "q": typeNews,
      "apiKey": "8b64149574d04d98a2389dcbdd039813"
    });


    return response.data['articles'];
  }
}
