import 'dart:async';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var myPageController = PageController(viewportFraction: 0.9, initialPage: 0);
  int currentIndex = 0;
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scrollMyBanners();
  }

  void scrollMyBanners() {
    Timer.periodic(
      Duration(seconds: 2),
      (timer) {
        print("Time Completed");
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 20, left: 0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...List.generate(
                      5,
                      (index) => Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(15),
                        ),
                        height: MediaQuery.of(context).size.height / 10,
                        width: MediaQuery.of(context).size.width / 3,
                        margin: EdgeInsets.only(right: 20),
                        child: Row(
                          children: [
                            SizedBox(width: 20),
                            Text("Offer Zone"),
                            SizedBox(width: 10),
                            Icon(Icons.food_bank)
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30),
            Container(
              height: MediaQuery.of(context).size.height / 4,
              width: MediaQuery.of(context).size.width,
              child: PageView(
                controller: myPageController,
                scrollDirection: Axis.horizontal,
                children: [
                  ...List.generate(
                    3,
                    (index) => Padding(
                      padding: const EdgeInsets.only(right: 10, left: 10),
                      child: Container(
                        // width: MediaQuery.of(context).size.width - 100,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 242, 143, 143),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        // margin: EdgeInsets.only(left: 10, right: 10),
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
