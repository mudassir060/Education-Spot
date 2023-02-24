import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;
import '../../Widgets/myAppBar.dart';
import '../../Widgets/myLoading.dart';
import 'AdmissionCard.dart';

class AdmissionsScreen extends StatefulWidget {
  const AdmissionsScreen({Key? key}) : super(key: key);

  @override
  State<AdmissionsScreen> createState() => _AdmissionsScreenState();
}

class Article {
  final String institute;
  final String level;
  final String url;
  final String last_date;
  final String discipline_type;
  final String img;

  const Article({
    required this.institute,
    required this.level,
    required this.url,
    required this.last_date,
    required this.discipline_type,
    required this.img,
  });
}

class _AdmissionsScreenState extends State<AdmissionsScreen> {
  List<Article> articles = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getWebsiteData();
  }

  Future getWebsiteData() async {
    final url = Uri.parse("https://www.eduvision.edu.pk/admissions.php");
    final response = await http.get(url);
    dom.Document html = dom.Document.html(response.body);
    final urls = html.querySelectorAll("a").map((e) => "$url${e.attributes["href"]}").toList();
    final textdata = html.querySelectorAll("td").map((e) => e.text).toList();
    final imgs = html.querySelectorAll("img").map((e) => e.attributes["src"]).toList();
    print(" Url===> ${urls.length} textdata===> ${textdata} ");
    print("  img===> ${imgs.length}");
    for (final url in textdata) {
      debugPrint("=====>${url}");
    }
    setState(() {
      articles = List.generate(
          20,
          (index) => Article(
                institute: textdata[(index * 5 + 1)],
                level: textdata[(index * 5 + 2)],
                url: urls[(index) + 126].toString(),
                last_date: textdata[index * 5 + 4],
                discipline_type: textdata[(index * 5 + 3)],
                img: imgs[(index) + 4].toString(),
              ));
    });
  }

  @override
  Widget build(BuildContext context) {
    var vwidth = MediaQuery.of(context).size.width;
    var vheight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              myAppBar(
                titel: "Admissions",
                linewidth: 140,
              ),
              articles.length != 0
                  ? Container(
                width: vwidth,
                    child: ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: articles.length - 4,
                        itemBuilder: (context, index) {
                          return AdmissionCard(
                            level: articles[index].level,
                            last_date: articles[index].last_date,
                            discipline_type: articles[index].discipline_type,
                            institute: articles[index].institute,
                            url: articles[index].url,
                            img: articles[index].img,
                          );
                          //   Card(
                          //   child: Column(
                          //     children: [
                          //       Text("1=${articles[index].institute}"),
                          //       Text("2=${articles[index].level}"),
                          //       Text("3=${articles[index].url}"),
                          //       Text("4=${articles[index].last_date}"),
                          //       Text("5=${articles[index].discipline_type}"),
                          //       Text("6=${articles[index].img}"),
                          //     ],
                          //   ),
                          // );
                        }),
                  )
                  :  Center(child: myLoading()),
            ],
          ),
        ),
      ),
    );
  }
}
