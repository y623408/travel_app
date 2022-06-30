import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/misc/colors.dart';
import 'package:travel_app/widgets/app_large_text.dart';
import 'package:travel_app/widgets/app_text.dart';
import 'package:url_launcher/url_launcher.dart';

import '../cubit/app_cubit_states.dart';
import '../cubit/app_cubits.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  var images = {
    "balloning.png": "Balloning",
    "hiking.png": "Hiking",
    "kayaking.png": "Kayaking",
    "snorkling.png": "Snorkelling"
  };
  List urls = [
    Uri.parse("https://www.tourism-of-india.com/blog/where-to-go-hot-air-balloon-ride-in-india/"),
    Uri.parse("https://www.thrillophilia.com/top-hiking-destinations-in-india"),
    Uri.parse("https://traveltriangle.com/blog/kayaking-in-india/"),
    Uri.parse("https://www.holidify.com/pages/snorkelling-in-inda-3699.html")
  ];
  List inspirationImages = [
  "https://i.pinimg.com/564x/57/9f/20/579f2026a6d71b50b0076bb6d331c5ec.jpg",
    "https://i.pinimg.com/564x/bf/e5/c8/bfe5c8d4797c1cfcdf0834bfa56cfd33.jpg",
    "https://i.pinimg.com/564x/11/03/fc/1103fcce0cd5c5b9b77012e2e7f079e1.jpg",
    "https://i.pinimg.com/564x/07/34/60/0734600955adb5b082def576156f1311.jpg",
    "https://i.pinimg.com/564x/65/35/bb/6535bbf6b723dd4fe4b7d6ac34d76c48.jpg"
  ];
  List emotionImages = [
    "https://gretastravels.com/wp-content/uploads/2017/05/2-1-683x1024.jpg",
    "https://static.saltinourhair.com/wp-content/uploads/2019/03/23140738/best-travel-quotes-bali-575x810.jpg",
    "https://www.atlasandboots.com/wp-content/uploads/2020/12/New-inspirational-travel-quotes-5.jpg",
    "https://www.theintrepidguide.com/wp-content/webp-express/webp-images/uploads/2016/11/Best-inspirational-travel-quotes-Jawaharial-Nehru.jpg.webp",
    "https://cdn-bmalj.nitrocdn.com/uirOOtSrYrqqUksKHkiSCjZGZlPeXsmk/assets/static/optimized/rev-0404f4f/images/travel-quotes-comfort-zone-640x960.jpg"
  ];
  final Uri _url = Uri.parse("https://www.linkedin.com/in/anu02/");
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    return Scaffold(body: BlocBuilder<AppCubits, CubitStates>(
      builder: (context, state) {
        if (state is LoadedState) {
          var info = state.places;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //menu text
              Container(
                padding: const EdgeInsets.only(top: 70, left: 20),
                child: Row(
                  children: [
                    //Icon(Icons.arrow_back, size: 30, color: Colors.black54),

                    InkWell(
                        onTap: () async {
                          if (!await launchUrl(_url))
                            throw 'Could not launch $_url';
                        },
                        child: AppLargeText(text: "Ananya Pandey")),
                    Expanded(child: Container()),
                    Container(
                      child: Icon(Icons.person,size:30),
                      margin: const EdgeInsets.only(right: 20),
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey.withOpacity(0.5)),
                    ),
                  ],
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(left: 20),
                  child: AppText(text: "102066002")),
              SizedBox(
                height: 30,
              ),
              //discover text
              Container(
                margin: const EdgeInsets.only(left: 20),
                child: AppLargeText(text: "Discover"),
              ),
              SizedBox(
                height: 20,
              ),
              //tabbar
              Container(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: TabBar(
                    labelPadding: const EdgeInsets.only(left: 20, right: 20),
                    controller: _tabController,
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.grey,
                    isScrollable: true,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicator: CircleTabIndicator(
                        color: AppColors.mainColor, radius: 4),
                    tabs: [
                      Tab(text: "Places"),
                      Tab(text: "Inspirations"),
                      Tab(text: "Emotions"),
                    ],
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 20),
                height: 300,
                width: double.maxFinite,
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    ListView.builder(
                      itemCount: info.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            BlocProvider.of<AppCubits>(context)
                                .detailPage(info[index]);
                          },
                          child: Container(
                            margin: const EdgeInsets.only(right: 15, top: 10),
                            width: 200,
                            height: 300,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                                image: DecorationImage(
                                  image: NetworkImage(
                                      "http://mark.bslmeiyu.com/uploads/" +
                                          info[index].img),
                                  fit: BoxFit.cover,
                                )),
                          ),
                        );
                      },
                    ),
                    ListView.builder(
                      itemCount: 5,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return //GestureDetector(
                          //onTap: () {
                          //  BlocProvider.of<AppCubits>(context)
                          //      .detailPage(info[index]);
                          //},
                          //child:
                        Container(
                            margin: const EdgeInsets.only(right: 15, top: 10),
                            width: 200,
                            height: 300,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                                image: DecorationImage(
                                  image: NetworkImage(inspirationImages[index]),
                                  fit: BoxFit.cover,
                                )),
                          );//,
                        //);
                      },
                    ),
                    ListView.builder(
                      itemCount: 5,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return //GestureDetector(
                          //onTap: () {
                          //  BlocProvider.of<AppCubits>(context)
                          //      .detailPage(info[index]);
                          //},
                          //child:
                          Container(
                            margin: const EdgeInsets.only(right: 15, top: 10),
                            width: 200,
                            height: 300,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                                image: DecorationImage(
                                  image: NetworkImage(emotionImages[index]),
                                  fit: BoxFit.fill,
                                )),
                          );//,
                        //);
                      },
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppLargeText(
                      text: "Explore more",
                      size: 22,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 120,
                width: double.maxFinite,
                margin: const EdgeInsets.only(left: 20),
                child: ListView.builder(
                    itemCount: 4,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_, index) {
                      return InkWell(
                        onTap: () async {
                          if (!await launchUrl(urls[index]))
                            throw 'Could not launch $urls[index]';
                        },
                        child: Container(
                          margin: const EdgeInsets.only(right: 30),
                          child: Column(
                            children: [
                              Container(
                                //margin: const EdgeInsets.only(right: 50),
                                width: 80,
                                height: 80,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white,
                                    image: DecorationImage(
                                      image: AssetImage(
                                          "img/" + images.keys.elementAt(index)),
                                      fit: BoxFit.cover,
                                    )),
                              ),
                              SizedBox(height: 10),
                              Container(
                                child: AppText(
                                  text: images.values.elementAt(index),
                                  color: AppColors.textColor2,
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
              )
            ],
          );
        } else {
          return Container();
        }
      },
    ));
  }
}

class CircleTabIndicator extends Decoration {
  final Color color;
  double radius;
  CircleTabIndicator({required this.color, required this.radius});
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    // TODO: implement createBoxPainter
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final Color color;
  double radius;
  _CirclePainter({required this.color, required this.radius});
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint _paint = Paint();
    _paint.color = color;
    _paint.isAntiAlias = true;
    final Offset circleOffset = Offset(
        configuration.size!.width / 2 - radius / 2,
        configuration.size!.height - radius);
    canvas.drawCircle(offset + circleOffset, radius, _paint);
  }
}
