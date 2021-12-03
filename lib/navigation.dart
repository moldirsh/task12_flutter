import 'package:flutter/material.dart';
import 'home.dart';

class Navigation extends StatefulWidget {

  @override
  NavigationState createState() => NavigationState();
}

class NavigationState extends State<Navigation> {
  String title = '7food на карте';
  int _currentIndex = 0;
  final List<Widget> _children = [
    home()
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

      ),
      home: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          backgroundColor: Color(0xFF47536d),
          centerTitle: true,
          title: Text(
            title,
          ),
        ),
        body: _children[_currentIndex],
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 8.0,
          clipBehavior: Clip.antiAlias,
          child: Container(
            height: 70,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  top: BorderSide(
                    color: Colors.white70,
                    width: 0.5,
                  ),
                ),
              ),
              child: BottomNavigationBar(
                  currentIndex: _currentIndex,
                  backgroundColor: Colors.white,
                  unselectedItemColor: Color(0xFF47536d),
                  selectedItemColor: Colors.blue,
                  onTap: (index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  items: [
                    BottomNavigationBarItem(
                        icon: Icon(Icons.home), label: ''),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.qr_code), label: ''),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.person), label: ''),
                  ]),
            ),
          ),
        ),
        floatingActionButtonLocation:
        FloatingActionButtonLocation.miniCenterDocked,
        floatingActionButton: Container(
          height: 73,
          width: 73,
          padding: const EdgeInsets.all(1.0),
          child: FloatingActionButton(
            backgroundColor: _currentIndex == 1 ? Color(0xFF47536d) : Color(0xFF47536d),
            child: Icon(Icons.qr_code),
            onPressed: () => setState(() {
              _currentIndex = 1;
            }),
          ),
        ),
      ),
    );
  }
}