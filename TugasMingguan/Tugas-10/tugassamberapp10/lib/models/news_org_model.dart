class NewsOrgModel {
  String? author;
  String? title;
  String? description;
  String? urlToImage;
  String? url;
  String? publishedAt;
  String? content;

  NewsOrgModel({
    this.author,
    this.title,
    this.description,
    this.urlToImage,
    this.url,
    this.publishedAt,
    this.content,
  });

  NewsOrgModel.fromJson(Map<String, dynamic> json) {
    author = json['author'];
    title = json['title'];
    description = json['description'];
    urlToImage = json['urlToImage'];
    url = json['url'];
    publishedAt = json['publishedAt'];
    content = json['content'];
  }
}
