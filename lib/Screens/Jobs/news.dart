import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;


class news extends StatefulWidget {
  final String banarad;

  const news({Key? key, required this.banarad}) : super(key: key);

  @override
  State<news> createState() => _newsState();
}

class Article {
  final String title;
  final String date;
  final String url;

  const Article({
    required this.title,
    required this.date,
    required this.url,
  });
}

class _newsState extends State<news> {
  List<Article> articles = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getWebsiteData();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  Future getWebsiteData() async {
    final url = Uri.parse("https://www.uet.edu.pk/");
    final response = await http.get(url);
    dom.Document html = dom.Document.html(response.body);
    final titles = html
        .querySelectorAll("header > a")
        .map((e) => e.innerHtml.trim())
        .toList();
    final urls = html
        .querySelectorAll("header > a")
        .map((e) => "$url${e.attributes["href"]}")
        .toList();
    final dates =
    html.querySelectorAll("figure").map((e) => e.innerHtml).toList();
    print(
        "titles Count ${titles.length} dates Count ${dates.length} Url Count ${urls.length}");
    // for (final url in urls) {
    //   debugPrint("=====>${url}");
    // }
    setState(() {
      articles = List.generate(
          titles.length,
              (index) => Article(
              title: titles[index],
              date: dates[index],
              url: urls[index].toString()));
    });
  }

  @override
  Widget build(BuildContext context) {
    var vwidth = MediaQuery.of(context).size.width;
    var vheight = MediaQuery.of(context).size.height;
    if (articles.length != 0) {
      return SizedBox(
        height: vheight - 370,
        child: ListView.builder(
            itemCount: articles.length - 4,
            itemBuilder: (context, index) {
              final _title = articles[index + 4].title;
              final _url = articles[index + 4].url;
              if (index == 3 && widget.banarad != "") {
                return widget.banarad == null
                    ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 50,
                    color: Colors.transparent,
                    child: AdWidget(ad: myBanner),
                  ),
                )
                    : Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20),
                  child: Image.network(
                    widget.banarad,
                    height: 60,
                    fit: BoxFit.fill,
                  ),
                );
              } else {
                return card(context, _title, _url);
              }
            }),
      );
    } else {
      return Center(
          child: loadingwidget(
            color: appBarColor,
          ));
    }
  }
}
