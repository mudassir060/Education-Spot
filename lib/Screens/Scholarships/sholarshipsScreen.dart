import 'package:education_spot/Screens/Scholarships/sholarshipCard.dart';
import 'package:education_spot/Widgets/myAppBar.dart';
import 'package:education_spot/Widgets/mySpacer.dart';
import 'package:education_spot/Widgets/smallButton.dart';
import 'package:flutter/material.dart';
import '../../constants/images.dart';
import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;

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
    final titles = html.querySelectorAll("h3 > b > a").map((e) => e.innerHtml.trim()).toList();
    final urls = html.querySelectorAll("h3 > b > a").map((e) => "${e.attributes["href"]}").toList();
    final imgs = html.querySelectorAll("a > img").map((e) => e.attributes["data-src"]).toList();
    final Levels = html.querySelectorAll("b").map((e) => e.innerHtml).toList();
    final Fields = html.querySelectorAll("b").map((e) => e.innerHtml).toList();
    final Types = html.querySelectorAll("span").map((e) => e.innerHtml).toList();
    final Categorys = html.querySelectorAll("span").map((e) => e.innerHtml).toList();
    final Area = html.querySelectorAll("span").map((e) => e.innerHtml).toList();
    final Deadlines = html.querySelectorAll("span").map((e) => e.innerHtml).toList();
    print("titles===> ${titles.length} Url===> ${urls.length} img===> ${imgs.length} Level===> ${Levels.length} Fields===> ${Fields.length}");
    print("Types===> ${Types.length} Categorys===> ${Categorys.length} Area===> ${Area.length} Deadlines===> ${Deadlines.length}");
    // for (final url in urls) {
    //   debugPrint("=====>${url}");
    // }
    setState(() {
      articles = List.generate(
        titles.length,
        (index) => Article(
          title: titles[index],
          url: urls[index].toString(),
          img: imgs[index].toString(),
          level: imgs[index].toString(),
          field: imgs[index].toString(),
          type: imgs[index].toString(),
          category: imgs[index].toString(),
          area: imgs[index].toString(),
          deadline: imgs[index].toString(),
        ),
      );
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
            // // // // // // // // // // // Top Bar // // // // // // // // //
            const myAppBar(titel: "Available Scholarships", linewidth: 250),
            Padding(
              padding: const EdgeInsets.all(18.0),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      smallButton("Matric", () {}, false),
                      smallButton("Intermediate", () {}, false),
                      smallButton("University", () {}, false),
                    ],
                  ),
                  mySpacer(10.0, 0.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      smallButton("Merit base", () {}, false),
                      smallButton("Need base", () {}, false),
                      smallButton("Others", () {}, false),
                    ],
                  ),
                  // // // // // // // // // // // Featured CArd // // // // // // // // //
                  sholarshipCard(
                    img: images,
                    titel: "HEC Need Base",
                    subTitel: "GOVERNMENT UNIVERSITIES",
                    type: 'Need base',
                    date: '11 Sep 2022',
                    dagre: 'Bachelor',
                  ),
                  sholarshipCard(
                    img: images,
                    titel: "HEC Need Base",
                    subTitel: "GOVERNMENT UNIVERSITIES",
                    type: 'Need base',
                    date: '11 Sep 2022',
                    dagre: 'Bachelor',
                  ),
                  sholarshipCard(
                    img: images,
                    titel: "HEC Need Base",
                    subTitel: "GOVERNMENT UNIVERSITIES",
                    type: 'Need base',
                    date: '11 Sep 2022',
                    dagre: 'Bachelor',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
