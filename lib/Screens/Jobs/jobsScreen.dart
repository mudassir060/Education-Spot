import 'package:education_spot/Screens/Jobs/recomendedCard.dart';
import 'package:education_spot/Widgets/myAppBar.dart';
import 'package:education_spot/Widgets/mySpacer.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;
import '../../constants/images.dart';
import '../../constants/style.dart';
import 'featuredCard.dart';

class jobsScreen extends StatefulWidget {
  const jobsScreen({Key? key}) : super(key: key);

  @override
  State<jobsScreen> createState() => _jobsScreenState();
}

class Article {
  final String title;
  final String lastDate;
  final String url;
  final String posetion;
  final String publishDate;
  final String location;
  final String img;

  const Article({
    required this.title,
    required this.lastDate,
    required this.url,
    required this.posetion,
    required this.publishDate,
    required this.location,
    required this.img,
  });
}

class _jobsScreenState extends State<jobsScreen> {
  List<Article> articles = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getWebsiteData();
  }

  Future getWebsiteData() async {
    final url = Uri.parse("https://dailyjobs.pk/");
    final response = await http.get(url);
    dom.Document html = dom.Document.html(response.body);
    final titles = html.querySelectorAll("h2 > a").map((e) => e.innerHtml.trim()).toList();
    final urls = html.querySelectorAll("h2 > a").map((e) => "${e.attributes["href"]}").toList();
    final lastDates = html.querySelectorAll("div > b").map((e) => e.innerHtml).toList();
    final publishDates = html.querySelectorAll("span.entry-time").map((e) => e.innerHtml).toList();
    final posetions = html.querySelectorAll("p").map((e) => e.innerHtml).toList();
    final locations = html.querySelectorAll("span.jb-location").map((e) => e.innerHtml).toList();
    final imgs = html.querySelectorAll("a > img").map((e) => e.attributes["data-src"]).toList();
    print("titles===> ${titles.length} lastDates===> ${lastDates.length} Url===> ${urls.length} posetions===> ${posetions.length}");
    print("lastDates===> ${lastDates.length} location===> ${locations.length} publishDates===> ${publishDates.length} img===> ${imgs.length}");
    // for (final url in urls) {
    //   debugPrint("=====>${url}");
    // }
    setState(() {
      articles = List.generate(
          titles.length,
          (index) => Article(
              title: titles[index],
              lastDate: lastDates[index],
              url: urls[index].toString(),
              posetion: posetions[index],
              publishDate: publishDates[index],
              location: locations[index],
              img: imgs[index].toString()));
    });
  }

  @override
  Widget build(BuildContext context) {
    var vwidth = MediaQuery.of(context).size.width;
    var vheight = MediaQuery.of(context).size.height;

    // if (articles.length != 0) {
    //   return Scaffold(
    //     // height: vheight - 370,
    //     body: ListView.builder(
    //         itemCount: articles.length - 4,
    //         itemBuilder: (context, index) {
    //           final _title = articles[index + 4].title;
    //           final _url = articles[index + 4].url;
    //           return Card(
    //             child: Column(
    //               children: [
    //                 Text("1=${articles[index].title}"),
    //                 Text("2=${articles[index].lastDate}"),
    //                 Text("3=${articles[index].url}"),
    //                 Text("4=${articles[index].posetion}"),
    //                 Text("5=${articles[index].publishDate}"),
    //                 Text("6=${articles[index].location}"),
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
            const myAppBar(titel: "Discover job", linewidth: 150),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     InkWell(onTap: (){
            //       Navigator.pop(context);
            //     }, child: Image.asset(backCurve)),
            //     mySpacer(0.0, 0.0),
            //     Column(
            //       children: [
            //         const Text(
            //           "Discover job",
            //           style:
            //           TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            //         ),
            //         mySpacer(10.0, 0.0),
            //         Container(
            //           width: 200,
            //           height: 2,
            //           color: primaryColor,
            //         )
            //       ],
            //     ),
            //     mySpacer(0.0, 0.0),
            //   ],
            // ),
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
                      color: primaryColor,
                    ),
                    padding: const EdgeInsets.only(left: 15.0),
                    child: const TextField(
                      // controller: textcontroler,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          icon: Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                          hintText: "Search a job or a position",
                          hintStyle: TextStyle(color: Colors.white),
                          border: InputBorder.none),
                    ),
                  ),
                  mySpacer(10.0, 0.0),
                  // // // // // // // // // // // Featured Jobs // // // // // // // // //
                  Row(
                    children: [
                      Text(
                        "Featured Jobs",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  // // // // // // // // // // // Featured CArd // // // // // // // // //
                  articles.length != 0
                      ? featuredCard(
                          img: images,
                          titel: articles[0].title,
                          subTitel: articles[0].posetion,
                          location: articles[0].location,
                          lastDates: articles[0].lastDate,
                        )
                      : const Text('Loading'),
                  // // // // // // // // // // // Recomended titel // // // // // // // // //

                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "Recommended",
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "See All",
                          style: TextStyle(fontSize: 16, color: Colors.grey, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  // // // // // // // // // // // Recomended Jobs // // // // // // // // //

                  Container(
                    height: 180,
                    width: vwidth,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: articles.length-1,
                        itemBuilder: (context, index) {
                          return recomendedCard(
                            img: articles[index + 1].img,
                            titel: articles[index + 1].title,
                            subTitel: articles[index + 1].posetion,
                            location: articles[index + 1].location,
                            timing: articles[index + 1].lastDate,
                            sallery: "23",
                            url: articles[index + 1].url,
                          );
                        }),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
