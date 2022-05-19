import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../components/home_card.dart';

class BOJHome extends StatefulWidget {
  const BOJHome({Key? key}) : super(key: key);
  static String id = "/home";

  @override
  State<BOJHome> createState() => _BOJHomeState();
}

class _BOJHomeState extends State<BOJHome> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  toggleDrawer() async {
    if (scaffoldKey.currentState != null &&
        scaffoldKey.currentState!.isDrawerOpen) {
      scaffoldKey.currentState?.openEndDrawer();
    } else {
      scaffoldKey.currentState?.openDrawer();
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        title: const Text("B O J"),
        leading: IconButton(
            onPressed: () {
              toggleDrawer();
            },
            icon: const Icon(Icons.menu)),
        actions: [InkWell(onTap: () {}, icon: const Icon(Icons.sunny))],
        elevation: 1,
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Color(0xFF3523D1),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.church),
            label: 'Ibada',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Kongamano',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Biblia',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black54,
        onTap: _onItemTapped,
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Item 1'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // SizedBox(
          //   height: size.height * 0.02,
          // ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Text(
              'Home Banners!',
              style: TextStyle(fontSize: 15),
            ),
          ),
          CarouselSlider(
            options: CarouselOptions(
              aspectRatio: 20 / 9,
              autoPlay: true,
            ),
            items: homecards.map((i) {
              return Builder(
                builder: (
                  BuildContext context,
                ) {
                  return Container(
                    width: size.width * 1,
                    margin: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: GestureDetector(
                      onTap: () {},
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image(
                            image: AssetImage(
                              i.image,
                            ),
                            fit: BoxFit.cover,
                            alignment: Alignment.center,
                          )),
                    ),
                  );
                },
              );
            }).toList(),
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Text(
              'Notification List!',
              style: TextStyle(fontSize: 15),
            ),
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemBuilder: (ctx, int) {
                return Card(
                  child: InkWell(
                    onTap: () {},
                    child: ListTile(
                        leading: const CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/images/alpha.jpg'),
                        ),
                        title: Text('Notification $int'),
                        subtitle: const Text(
                            'this is a description of the notification')),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
