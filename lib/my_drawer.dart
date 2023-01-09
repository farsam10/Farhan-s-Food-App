import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'main.dart';

class MyDrawer extends StatefulWidget {
  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  String getDrawerName(SideMenu type) {
    switch (type) {
      case SideMenu.myOrders:
        return "My Orders";
      case SideMenu.orderAnything:
        return "Order Anything";
      case SideMenu.notifications:
        return "Notifications";
      case SideMenu.myAdresses:
        return "My Adresses";
      case SideMenu.FAQs:
        return "FAQ's";
      case SideMenu.support:
        return "Support";
    }
  }

  XFile? myprofilepic;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10, top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.cancel_outlined))],
          ),
        ),
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 50),
            child: SafeArea(
              child: Column(
                children: [
                  InkWell(
                    onTap: () async {
                      myprofilepic = await ImagePicker()
                          .pickImage(source: ImageSource.gallery);

                      setState(() {});
                    },
                    child: Stack(
                      children: [
                        SizedBox(
                          height: 50,
                        ),
                        Container(
                            height: 150,
                            width: 150,
                            decoration: BoxDecoration(color: Color.fromARGB(213, 224, 224, 224), shape: BoxShape.circle),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(150),
                              child: myprofilepic != null
                                  ? Image.file(File("${myprofilepic?.path}"))
                                  : Icon(Icons.person, size: 80,),
                            )),
                        Positioned(
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white, shape: BoxShape.circle),
                            child: Icon(
                              Icons.camera_alt,
                              color: Colors.orange,
                              size: 17,
                            ),
                            height: 30,
                            width: 30,
                          ),
                          bottom: 6,
                          right: 8,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Oliver",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Text(
                    "Edit Profile",
                    style: TextStyle(
                      color: Colors.orange,
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  ...List.generate(
                    SideMenu.values.length,
                    (index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 10.0, right: 10),
                        child: ListTile(
                          title: Text(
                            getDrawerName(SideMenu.values[index]),
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey[700],
                            ),
                          ),
                          // leading: Container(
                          //     height: 25,
                          //     width: 25,
                          //     child: Image.asset(
                          //       'assets/drawer_assets/${SideMenu.values[index].name.toString()}.png',
                          //       height: 25,
                          //       width: 25,
                          //     )),
                          minLeadingWidth: 10,
                          onTap: () {
                            print("Tap Detected ");
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
