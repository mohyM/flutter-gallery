import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gallerywidget/template/viewSourceCode.dart';
import 'package:gallerywidget/values/style.dart';

import 'detailhotelbooking.dart';

class HotelBookingAppScreen extends StatefulWidget {
  @override
  _HotelBookingAppScreenState createState() => _HotelBookingAppScreenState();
}

class _HotelBookingAppScreenState extends State<HotelBookingAppScreen>
    with SingleTickerProviderStateMixin {
  final List<Tab> tabs = <Tab>[
    Tab(text: 'Hotels'),
    Tab(text: 'Apartments'),
    Tab(text: 'Resorts'),
    Tab(text: 'Villas'),
    Tab(text: 'Cabins'),
    Tab(text: 'Cottages'),
    Tab(text: 'Glamping'),
    Tab(text: 'Serviced apartments'),
    Tab(text: 'Holiday homes'),
  ];

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: tabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          FlatButton(
              onPressed: () => Navigator.push(
                  context,
                  CupertinoPageRoute(
                      builder: (context) =>
                          ViewScourceCodeScreen(source: 'lib/template/hotelbooking.dart'))),
              child: Row(
                children: <Widget>[
                  Icon(Icons.code, color: Colors.blueAccent),
                  Text('Code', style: TextStyle(color: Colors.blueAccent))
                ],
              )),
          FlatButton(
              onPressed: () => launchURL(
                  'https://dribbble.com/shots/13920074-Hotel-Booking-App/attachments/5529769?mode=media'),
              child: Row(
                children: <Widget>[
                  Icon(Icons.link, color: Colors.blueAccent),
                  Text('Source UI', style: TextStyle(color: Colors.blueAccent))
                ],
              )),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Icon(EvaIcons.menu2Outline, color: Color(0xff1F618D), size: 30),
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(
                          "https://cdn.dribbble.com/users/504585/screenshots/2006389/terrible_designer_avatar-01.jpg"),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text('Where Would You\nLike to Go?',
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, top: 16),
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: TextField(
                      decoration: InputDecoration(
                          prefixIcon: Icon(EvaIcons.searchOutline, color: Colors.blueGrey),
                          hintText: "Search for place",
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xff1F618D)),
                              borderRadius: BorderRadius.circular(10)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xff1F618D)),
                              borderRadius: BorderRadius.circular(10))),
                    )),
                    Container(
                      height: 55,
                      width: 55,
                      margin: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                          color: Color(0xff1F618D), borderRadius: BorderRadius.circular(10)),
                      child: Icon(FontAwesomeIcons.slidersH, color: Colors.white, size: 20),
                    )
                  ],
                ),
              ),
              Container(
                height: 66,
                padding: EdgeInsets.all(8),
                child: TabBar(
                  isScrollable: true,
                  unselectedLabelColor: Colors.grey,
                  labelColor: Colors.white,
                  labelStyle: TextStyle(fontSize: 17),
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicator: BubbleTabIndicator(
                      indicatorColor: Color(0xff1F618D),
                      indicatorHeight: 40.0,
                      tabBarIndicatorSize: TabBarIndicatorSize.tab),
                  tabs: tabs,
                  controller: _tabController,
                ),
              ),
              Container(
                height: 300,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: dataHotels.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () => Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => DetailHotelBookingScreen(
                                      hotel: dataHotels[index],
                                    ))),
                        child: Container(
                          width: 225,
                          margin: index < 1
                              ? EdgeInsets.all(16)
                              : EdgeInsets.only(top: 16, bottom: 16, right: 16),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(dataHotels[index].imageUrl))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Align(
                                alignment: Alignment.topRight,
                                child: CircleAvatar(
                                  backgroundColor: Colors.black26,
                                  child: Icon(
                                    EvaIcons.heartOutline,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                ),
                              ),
                              Spacer(),
                              Container(
                                width: 200,
                                child: Text(
                                  dataHotels[index].name,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Row(
                                children: <Widget>[
                                  Icon(Icons.location_on, color: Colors.white),
                                  Expanded(
                                    child: Text(
                                      dataHotels[index].location,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(color: Colors.white, fontSize: 14),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    }),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Popular Hotels',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              Container(
                height: 225,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: dataHotels.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () => Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => DetailHotelBookingScreen(
                                      hotel: dataHotels[index],
                                    ))),
                        child: Container(
                          width: 175,
                          margin: index < 1
                              ? EdgeInsets.all(16)
                              : EdgeInsets.only(top: 16, bottom: 16, right: 16),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(dataHotels[index].imageUrl))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Spacer(),
                              Container(
                                width: 200,
                                child: Text(
                                  dataHotels[index].name,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Row(
                                children: <Widget>[
                                  Icon(Icons.location_on, color: Colors.white),
                                  Expanded(
                                    child: Text(
                                      dataHotels[index].location,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(color: Colors.white, fontSize: 14),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Hotel {
  String name;
  String location;
  String imageUrl;
  String price;
  Hotel({this.name, this.location, this.imageUrl, this.price});
}

List<Hotel> dataHotels = [
  Hotel(
      name: "iRoHa Garden Hotel & Resort ",
      location: "No.8,Street 73, Sangkat Tonle Bassac, Chamkar Mon, Phnom Penh",
      imageUrl: "https://cf.bstatic.com/images/hotel/max1024x768/160/160842031.jpg",
      price: "KHR 254,763"),
  Hotel(
      name: "La Rose Suites",
      location: "No.4B, St. 21, Sangkat Tonle Bassac, Khan Chamkarmon, Chamkar Mon, Phnom Penh",
      imageUrl: "https://cf.bstatic.com/images/hotel/max1024x768/993/99370122.jpg",
      price: "KHR 286,896"),
  Hotel(
      name: "Arunreas Hotel",
      location: "163 street 51, Daun Penh, Phnom Penh",
      imageUrl: "https://cf.bstatic.com/images/hotel/max1024x768/542/54227564.jpg",
      price: "KHR 286,896"),
  Hotel(
      name: "Rosewood Phnom Penh",
      location:
          "Level 8th , Unit 1-2-3, Vattanac Capital Tower, No. 66, Preah Monivong Blvd, Sangkat Wat Phnom, Daun Penh, Phnom Penh",
      imageUrl: "https://cf.bstatic.com/images/hotel/max1024x768/235/235610646.jpg",
      price: "KHR 1,065,612"),
  Hotel(
      name: "PAVILION",
      location: "St 19, No. 227, Daun Penh, Phnom Penh",
      imageUrl: "https://cf.bstatic.com/images/hotel/max1024x768/138/138190665.jpg",
      price: "KHR 234,435"),
  Hotel(
      name: "The Plantation Urban Resort and Spa",
      location: "# 28 Street 184, Daun Penh, Phnom Penh",
      imageUrl: "https://cf.bstatic.com/images/hotel/max1024x768/855/85515792.jpg",
      price: "KHR 265,583"),
];
