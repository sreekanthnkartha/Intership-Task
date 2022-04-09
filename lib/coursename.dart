import 'package:flutter/material.dart';

class Course extends StatefulWidget {
  const Course({ Key? key }) : super(key: key);

  @override
  State<Course> createState() => _CourseState();
}

class _CourseState extends State<Course> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Flutter Devolpment"),elevation: 0,),
      body: SafeArea(
        child: ListView(
          children: [
            _tabSection(context)
          ],
        ),
      ),      
    );
  }

  Widget _tabSection(BuildContext context) {
  return DefaultTabController(
    length: 3,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          child: TabBar(
              labelColor: Colors.black,
              indicatorColor: Colors.teal[700],
              tabs: [
                Tab(text: "Chapters"),
                Tab(text: "Practice"),
                Tab(text: "Test"),
              ]),
        ),
        Container(
          height: MediaQuery.of(context).size.height,
          child: TabBarView(children: [
            ListView(
              children: [
                Container(
                  child: PurchasedC("images/ch1.jpg", "Installation", "10:30 minutes",(){}),
                ),
                Container(
                  child: PurchasedC("images/ch2.jpg", "Basics of dart", "15:00 minutes",(){}),
                ),
                Container(
                  child: PurchasedC("images/ch3.jpg", "UI Designing", "30:00 minutes",(){}),
                ),
              ], 
            ),
            ListView(
              children: [
                PractiseQ("Login Page UI", "Start", "images/ui1.jpg", "images/ui2.jpg", "Estimated time : 1 day"),
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
        Image.asset(pic,height: 50,width: 70,fit: BoxFit.fill,),
        Card(c, dis, 19, 13),
        SizedBox(width: 40,),
        // FlatButton(onPressed: (){setState(() {
        //   fn();
        // });}, child: Text("Continue",style: TextStyle(color: Colors.white),),color: Colors.orangeAccent,)
        IconButton(
            onPressed: () {setState(() {
              fn();
            });}, icon: Icon(Icons.play_circle_fill_outlined),iconSize: 40,)
        // Card("Flutter Bassics", "3/10 Chapters completed", 25, 19)
      ]),
    );
  }

  Widget PractiseQ(String titile,String bname,String pic1,String pic2,String estd)
  {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.teal),
          color: Colors.white.withOpacity(0.5)),
      margin: const EdgeInsets.all(15),
      padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(titile,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
              ),
              FlatButton(onPressed: (){}, child: Text(bname,style: TextStyle(color: Colors.white),),color: Colors.orange,)
            ],
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(pic1,fit: BoxFit.cover,height: 120,width: 60,),
              Image.asset(pic2,fit: BoxFit.cover,height: 120,width: 60,)
            ],
          ),
          SizedBox(height: 20,),
          Align(
            alignment: Alignment.centerRight,
            child: Text(estd,
                style: TextStyle(fontWeight: FontWeight.w300, fontSize: 16),
                ),
          ),
      ]),
    );
  }
}