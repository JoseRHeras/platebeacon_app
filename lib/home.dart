import 'package:flutter/material.dart';
import 'package:flutterapp/register.dart';
import 'package:flutterapp/restaurant.dart';
import 'homeMenu.dart';
import 'main.dart';
import 'main_drawer.dart';

class LoginHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Material",
      home: Home(),
      routes: <String, WidgetBuilder>{
        '/register': (BuildContext context) => Restaurant(),
      },
    );
  }
}

class Home extends StatefulWidget {
  @override
  _MaterialHomeState createState() => _MaterialHomeState();
}

class _MaterialHomeState extends State<Home> {

  String shelterName = 'Shelter Name';

  final bottomBarItems = [
    Container(
        child: Center(child: Text("Home"),)
    ),
    Container(
        child: Center(child: Text("Notifications"),)
    ),
  ];
  int _bottomBarIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _bottomBarIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0.0,
        backgroundColor: Colors.black38,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            title: Text('Notifications'),
          ),
        ],
        currentIndex: _bottomBarIndex,
        selectedItemColor: Colors.white,
        onTap: _onItemTapped,
      ),
      body: bottomBarItems[_bottomBarIndex],
      appBar: AppBar(
        elevation: 0.0,
        title: Text(shelterName),
        backgroundColor: Colors.black38,
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20.0),
              color: Colors.blue,
              child: Center(
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: 100,
                        height: 100,
                        margin: EdgeInsets.only(top: 20.0),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage('assets/PB.jpg'),
                            )
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 15.0),
                        child: Column(
                          children: <Widget>[
                            Text(
                              "Shelter Name",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15.0,
                              ),
                            ),
                            Text(
                              "Chicago, IL",
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 15.0,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  )
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed('/register');
              },
              leading: Icon(Icons.restaurant),
              title: Text("Restaurant Details"),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).pop();
                setState(() {
                  _bottomBarIndex = 1;
                });
              },
              leading: Icon(Icons.insert_chart),
              title: Text("Analytics"),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).pop();
              },
              leading: Icon(Icons.library_books),
              title: Text("Stories"),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).pop();
              },
              leading: Icon(Icons.notifications),
              title: Text("Notifications"),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).pop();
              },
              leading: Icon(Icons.event),
              title: Text("Events"),
            ),
            Divider(
              height: 15.0,
              thickness: 0.5,
              color: Colors.black38,
              indent: 20.0,
              endIndent: 20.0,
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).pop();
              },
              leading: Icon(Icons.settings),
              title: Text("Settings"),
            ),
            ListTile(
              onTap: () {
                //Navigator.pop(context);
                Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => MaterialDesign(),
                    )
                );
              },
              leading: Icon(Icons.arrow_back),
              title: Text("Log out"),
            ),
          ],
        ),
      ),
    );
  }
}
