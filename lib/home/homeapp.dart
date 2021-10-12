import 'package:bankingapp/card/usercard.dart';
import 'package:bankingapp/home/addcarddetails.dart';
import 'package:bankingapp/home/contact.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomeApp extends StatefulWidget {
  @override
  _HomeAppState createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  List<String> carouselImages = [
    "https://media.gettyimages.com/photos/old-fashioned-bank-sign-picture-id155430254?s=612x612",
    "https://media.gettyimages.com/photos/old-fashioned-bank-sign-picture-id155430254?s=612x612",
    "https://media.gettyimages.com/photos/old-fashioned-bank-sign-picture-id155430254?s=612x612",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      appBar: AppBar(
        backgroundColor: Colors.black45,
        title: Text("Banking"),
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Icon(
            Icons.menu,
            color: Colors.white,
            size: 35,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          )
        ],
      ),

      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
         
          children: [
            CarouselSlider(
              options: CarouselOptions(
                aspectRatio: 10 / 5,
                autoPlay: true,
                viewportFraction: 0.95,
              ),
              items: carouselImages.map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(color: Colors.amber),
                      child: Image.network(
                        i,
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Your Cards",
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  TextButton(
                      child: Text(
                        "Show all",
                        style: TextStyle(
                          color: Colors.black87,
                        ),
                      ),
                      onPressed: () {
                        print('only one card');
                      }),
                ],
              ),
            ),
            SizedBox(
              height: 0.5,
            ),
            Container(
              height: 199,
              child: ListView(
                physics: BouncingScrollPhysics(),
                padding: const EdgeInsets.only(left: 20, right: 6),
                children: <Widget>[
                  UserATMCard(),
                ],
              ),
            ),
            Container(
                margin: EdgeInsets.all(16.0),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Text(
                              'PEOPLE',
                              style: TextStyle(
                                  fontSize: 14.0, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTapUp: null,
                          child: Text('View all'),
                        )
                      ],
                    ),
                    Container(
                      height: 100.0,
                      child: Card(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 20.0, right: 16.0),
                              child: Column(
                                children: <Widget>[
                                  CircleAvatar(
                                    backgroundColor: Colors.black54,
                                    child: Text(
                                      'V',
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Text('Virat'),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 20.0, right: 16.0),
                              child: Column(
                                children: <Widget>[
                                  CircleAvatar(
                                    backgroundColor: Colors.black54,
                                    child: Text('G'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Text('Gill'),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 20.0, right: 16.0),
                              child: Column(
                                children: <Widget>[
                                  CircleAvatar(
                                    backgroundColor: Colors.black54,
                                    child: Text('M'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Text('Mitali'),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 20.0, right: 16.0),
                              child: Column(
                                children: <Widget>[
                                  CircleAvatar(
                                    backgroundColor: Colors.black54,
                                    child: Text('S'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Text('Smriti'),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )),
            Container(
              margin: EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Text(
                            'Expand',
                            style: TextStyle(
                                fontSize: 14.0, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTapUp: null,
                        child: Text('View all'),
                      )
                    ],
                  ),
                  Container(
                    child: Card(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 20.0, right: 20.0),
                            child: Column(
                              children: <Widget>[
                                CircleAvatar(
                                  backgroundColor: Colors.black54,
                                  child: Icon(Icons.electrical_services),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Text('Electricity'),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 20.0, right: 20.0),
                            child: Column(
                              children: <Widget>[
                                CircleAvatar(
                                  backgroundColor: Colors.black54,
                                  child: Icon(Icons.mobile_friendly),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Text('Recharge'),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 20.0, right: 20.0),
                            child: Column(
                              children: <Widget>[
                                CircleAvatar(
                                  backgroundColor: Colors.black54,
                                  child: Icon(Icons.train),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Text('Train'),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 20.0, right: 20.0),
                            child: Column(
                              children: <Widget>[
                                CircleAvatar(
                                  backgroundColor: Colors.black54,
                                  child: Icon(Icons.restaurant),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Text('Restaurant'),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 60.0,
              margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 15.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (_) => AddCardDetails()),
                        );
                      },
                      child: Text(
                        "Send Money",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.black87,
                        shadowColor: Colors.red,
                        elevation: 5,
                        shape: const BeveledRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (_) => ContactScreen()),
                        );
                      },
                      child: Text(
                        "Your Contact",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.black87,
                        shadowColor: Colors.red,
                        elevation: 5,
                        shape: const BeveledRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
