class News {
  String? image;
  String? description;
  String? title;
  String? date;
  String? urlSite;

  News(this.image, this.description, this.title, this.date, this.urlSite);

  News.fromJson(Map<String, dynamic> json) {
    image = json['urlToImage'];
    description = json['description'];
    title = json['title'];
    date = json['publishedAt'];
    urlSite = json['url'];
  }
}
