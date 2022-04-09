import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:task1/coursename.dart';

class Hpage extends StatefulWidget {
  const Hpage({Key? key}) : super(key: key);

  @override
  State<Hpage> createState() => _HpageState();
}

class _HpageState extends State<Hpage> {
  @override
  final List<String> imageList = [
    "images/s1.jpg",
    "images/s2.jpg",
    "images/s3.jpg",
    "images/s4.jpg",
  ];
  int activeindex = 0;
  CarouselController cont = CarouselController();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tutorial App"),
        elevation: 0,
        // toolbarHeight: 70,
        // centerTitle: true,
        backgroundColor: Colors.teal[700],
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Hero(
            tag: "hello",
            child: Image.asset(
              "images/logo1.png",
              // height: 20,
              // width: 20,
              // fit: BoxFit.fill,
            ),
          ),
        ),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))],
      ),
      body: ListView(
        children: [
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.orangeAccent),
                color: Colors.white.withOpacity(0.5)),
            margin: const EdgeInsets.all(15),
            width: 3000,
            padding: EdgeInsets.all(20.0),
            child: Card("Welcom User", "12 courses completed", 25, 19),
          ),
          Container(
            margin: EdgeInsets.all(15),
            child: CarouselSlider.builder(
              itemCount: imageList.length,
              carouselController: cont,
              options: CarouselOptions(
                onPageChanged: (index, reason) => {
                  setState(() {
                    activeindex = index;
                  })
                },
                // enlargeCenterPage: true,
                height: 200,
                autoPlay: true,
                // pauseAutoPlayOnTouch: true,
                // pauseAutoPlayOnManualNavigate: true,

                autoPlayInterval: Duration(seconds: 3),
                reverse: false,
                aspectRatio: 5.0,
              ),
              itemBuilder: (context, i, id) {
                return GestureDetector(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: Colors.white,
                        )),
                    child: Container(
                      // borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        imageList[i],
                        width: 500,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  onTap: () {},
                );
              },
            ),
          ),
          Center(
            child: AnimatedSmoothIndicator(
              
              activeIndex: activeindex,
              count: imageList.length,
              effect: WormEffect(activeDotColor: Colors.teal),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 8, 15, 8),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Card("Courses", "", 25, 19)),
          ),
          _tabSection(context),
        ],
      ),
    );
  }

  Widget Card(String a, String b, double x, double y) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, 
        children: [
        Text(
          a,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: x),
        ),
        SizedBox(
          height: 3,
        ),
        Text(
          b,
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: y),
        )
      ]),
    );
  }

  Widget PurchasedC(String pic, String c, String dis, void fn()) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.teal),
          color: Colors.white.withOpacity(0.5)),
      margin: const EdgeInsets.all(15),
      padding: EdgeInsets.all(8.0),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, 
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(pic,height: 50,width: 50,fit: BoxFit.fill,),
        Card(c, dis, 19, 13),
        FlatButton(onPressed: (){setState(() {
          fn();
        });}, child: Text("Continue",style: TextStyle(color: Colors.white),),color: Colors.orangeAccent,)
        // IconButton(
        //     onPressed: () {}, icon: Icon(Icons.play_circle_fill_outlined),iconSize: 40,)
        // Card("Flutter Bassics", "3/10 Chapters completed", 25, 19)
      ]),
    );
  }


  Widget _tabSection(BuildContext context) {
  return DefaultTabController(
    length: 2,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          child: TabBar(
              labelColor: Colors.black,
              indicatorColor: Colors.teal[700],
              tabs: [
                Tab(text: "Purchased"),
                Tab(text: "All"),
              ]),
        ),
        Container(
          height: MediaQuery.of(context).size.height,
          child: TabBarView(children: [
            ListView(
              children: [
                Container(
                  child: PurchasedC("images/pc1.jpg", "Flutter Basics", "3/10 Chapters completed",(){Navigator.push(context, MaterialPageRoute(builder: (context) => Course()));}),
                ),
              ],
            ),
            Container(
              child: Text("Coming SOON !!!"),
            ),
          ]),
        ),
      ],
    ),
  );
}
}


