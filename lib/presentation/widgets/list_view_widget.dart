import 'package:flutter/material.dart';

import '../../data/models/news.dart';
import 'list_title_widget.dart';

class ListViewWidget extends StatelessWidget {
   ListViewWidget({Key? key,required this.news}) : super(key: key);
  List<News> news;
  @override
  Widget build(BuildContext context) {
    return news.isNotEmpty? ListView.builder(
      itemCount: news.length,
      itemBuilder: (BuildContext context,index){
        return ListTitleWidget(image: news[index].image,description: news[index].description,date: news[index].date,
        titel: news[index].title,urlSite: news[index].urlSite,);
      },):Center(
      child: Text("لا توجد بيانات",style: TextStyle(fontSize: 26)),
    );
  }
}


