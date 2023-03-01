import 'dart:convert';

import 'package:education_spot/Screens/Scholarships/sholarshipCard.dart';
import 'package:education_spot/Widgets/myAppBar.dart';
import 'package:education_spot/Widgets/mySpacer.dart';
import 'package:education_spot/Widgets/smallButton.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../constants/images.dart';
import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;
import '../../Widgets/myLoading.dart';

class sholarshipsScreen extends StatefulWidget {
  const sholarshipsScreen({Key? key}) : super(key: key);

  @override
  State<sholarshipsScreen> createState() => _sholarshipsScreenState();
}

class Article {
  final String title;
  final String url;
  final String img;
  final String level;
  final String field;
  final String type;
  final String category;
  final String area;
  final String deadline;

  const Article({
    required this.title,
    required this.url,
    required this.img,
    required this.level,
    required this.field,
    required this.type,
    required this.category,
    required this.area,
    required this.deadline,
  });
}

class _sholarshipsScreenState extends State<sholarshipsScreen> {
  List<Article> articles = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getWebsiteData();
  }

  Future getWebsiteData() async {
    final url = Uri.parse("https://www.eduvision.edu.pk/scholarships/");
    final response = await http.get(url);
    dom.Document html = dom.Document.html(response.body);
    final titles = html
        .querySelectorAll("h3 > b > a")
        .map((e) => e.innerHtml.trim())
        .toList();
    final urls = html
        .querySelectorAll("h3 > b > a")
        .map((e) => "$url${e.attributes["href"]}")
        .toList();
    final imgs = html
        .querySelectorAll("a > img")
        .map((e) => e.attributes["src"])
        .toList();
    final LevelsFields =
        html.querySelectorAll("p > b").map((e) => e.text).toList();
    final span = html.querySelectorAll("span").map((e) => e.text).toList();
    // print("titles===> ${titles.length} Url===> ${urls.length} img===> ${imgs.length} LevelsFields===> ${LevelsFields.length}");
    // for (final url in urls) {
    //   debugPrint("=====>${url}");
    // }
    setState(() {
      articles = List.generate(
        titles.length,
        (index) => Article(
          title: titles[index],
          url: urls[index].toString(),
          img: imgs[index].toString().contains('https:') == true
              ? imgs[index].toString()
              : "https://www.eduvision.edu.pk/scholarships/${imgs[index].toString()}",
          level: LevelsFields[index * 2].toString(),
          field: LevelsFields[index * 2 + 1].toString(),
          type: span[(index + 1) * 8 - 3].toString(),
          category: span[(index + 1) * 8 - 5].toString(),
          area: span[(index + 1) * 8 - 1].toString(),
          deadline: span[(index + 1) * 8 + 1].toString(),
        ),
      );
    });
  }

  static Future setdata(List<Map> data) async {
    List<String> dataString = [];
    data.forEach((element) {
      dataString.add(json.encode(element));
    });
    final prefs = await SharedPreferences.getInstance();

    await prefs.setStringList("_keyUsername", dataString);
  }

  static Future<List<Map>> getdata() async {
    final prefs = await SharedPreferences.getInstance();

    List<String> dataString = prefs.getStringList("_keyUsername") ?? [];
    List<Map> data = [];
    if (dataString.isNotEmpty) {
      dataString.forEach((element) {
        data.add(json.decode(element));
      });
    }
    return data;
  }

  @override
  Widget build(BuildContext context) {
    var vwidth = MediaQuery.of(context).size.width;
    var vheight = MediaQuery.of(context).size.height;

    // if (articles.isNotEmpty) {
    //   return Scaffold(
    //     // height: vheight - 370,
    //     body: ListView.builder(
    //         itemCount: articles.length ,
    //         itemBuilder: (context, index) {
    //           return Card(
    //             child: Column(
    //               children: [
    //                 Text("1=${articles[index].title}"),
    //                 Text("2=${articles[index].url}"),
    //                 Text("3=${articles[index].img}"),
    //                 Text("4=${articles[index].level}"),
    //                 Text("5=${articles[index].field}"),
    //                 Text("7=${articles[index].category}"),
    //                 Text("8=${articles[index].type}"),
    //                 Text("9=${articles[index].area}"),
    //                 Text("10=${articles[index].deadline}"),
    //               ],
    //             ),
    //           );
    //         }),
    //   );
    // } else {
    //   return const Center(child: Text("Null"));
    // }

    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // // // // // // // // // // // Top Bar // // // // // // // // //
            const myAppBar(titel: "Available Scholarships", linewidth: 250),
            Padding(
              padding: const EdgeInsets.only(left: 18.0, right: 18),
              child: Column(
                children: [
                  // // // // // // // // // // // Search Box // // // // // // // // //
                  Container(
                    width: 350,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                    ),
                    padding: const EdgeInsets.only(left: 15.0),
                    child: const TextField(
                      // controller: textcontroler,
                      style: TextStyle(color: Colors.grey),
                      decoration: InputDecoration(
                          icon: Icon(
                            Icons.search,
                            color: Colors.grey,
                          ),
                          hintText: "Search for a scholarship",
                          hintStyle: TextStyle(color: Colors.grey),
                          border: InputBorder.none),
                    ),
                  ),
                  mySpacer(10.0, 0.0),
                  // // // // // // // // // // // Featured sholarships // // // // // // // // //
                  Wrap(
                    direction: Axis.horizontal,
                    children: [
                      smallButton("Matric", () {}, false),
                      smallButton("Intermediate", () {}, false),
                      smallButton("University", () {}, false),
                      smallButton("Merit base", () {}, false),
                      smallButton("Need base", () {}, false),
                      smallButton("Others", () {}, false),
                    ],
                  ),
                  // // // // // // // // // // // Featured CArd // // // // // // // // //

                  articles.length != 0
                      ? Container(
                          width: vwidth,
                          child: ListView.builder(
                              // scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: articles.length,
                              itemBuilder: (context, index) {
                                return sholarshipCard(
                                  img: articles[index].img,
                                  titel: articles[index].title,
                                  type: articles[index].area,
                                  url: articles[index].url,
                                  field: articles[index].field,
                                  level: articles[index].level,
                                  category: articles[index].category,
                                  deadline: articles[index].deadline,
                                  area: articles[index].area,
                                );
                              }),
                        )
                      : myLoading(),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
