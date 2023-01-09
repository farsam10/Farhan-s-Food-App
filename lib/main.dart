// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:grid_view/foodCart.dart';
import 'package:grid_view/home.dart';
import 'package:grid_view/profile.dart';

import 'my_drawer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  // State<MyApp> createState() => _MyAppState();
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Home',
        theme: ThemeData(primarySwatch: Colors.amber),
        home: MyHome());
  }
}

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);
  @override
  State<MyHome> createState() => _MyHome();
}

class _MyHome extends State<MyHome> {
  List<Widget> listOfTabs = [Home(), FoodCart(), Profile()];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          color: Colors.blue[300],
        ),
        height: 84,
        width: 170,
        child: BottomNavigationBar(
          onTap: (value) {
            currentIndex = value;
            print(currentIndex.toString());
            setState(() {});
          },
          currentIndex: currentIndex,
          backgroundColor: Colors.transparent,
          elevation: 0,
          items: [
            BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.amber,
                ),
                icon: Icon(
                  Icons.home,
                ),
                label: 'Home'),
            BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.abc,
                  color: Colors.amber,
                ),
                icon: Icon(Icons.food_bank),
                label: 'Food Cart'),
            BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.person,
                  color: Colors.amber,
                ),
                icon: Icon(Icons.person),
                label: 'Profile'),
          ],
        ),
      ),
      appBar: AppBar(
        title: Center(
          child: Text(
            "Hunger",
            style: const TextStyle(
              fontSize: 30,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        backgroundColor: Colors.blue[300],
        toolbarHeight: 84,
      ),
      body: listOfTabs[currentIndex],
      drawer: Drawer(
        child: MyDrawer()
        
      ),
    );
  }

}

enum SideMenu {
  myOrders, orderAnything, notifications, myAdresses, FAQs, support
}
