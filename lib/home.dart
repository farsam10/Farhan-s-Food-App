import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

List<Color> arrayOfColors = [
  Colors.amber,
  Colors.red,
  Colors.green,
  Colors.yellow,
  Colors.blue,
  Colors.lime,
  Colors.orange,
  Colors.purple,
  Colors.pink,
  Colors.deepOrange,
  Colors.blueGrey,
  Colors.deepPurple,
];

List<Icon> arrayOfIcons = [
  Icon(Icons.home, size: 50),
  Icon(Icons.mail, size: 50),
  Icon(Icons.alarm, size: 50),
  Icon(Icons.wallet_travel, size: 50),
  Icon(Icons.backup, size: 50),
  Icon(Icons.book, size: 50),
  Icon(Icons.camera_alt, size: 50),
  Icon(Icons.person, size: 50),
  Icon(Icons.print, size: 50),
  Icon(Icons.phone, size: 50),
  Icon(Icons.notes, size: 50),
  Icon(Icons.music_note, size: 50),
];

List<String> arrayOfTexts = [
  "Home",
  "Email",
  "Alarm",
  "Wallet",
  "Backup",
  "Book",
  "Camera",
  "Person",
  "Print",
  "Phone",
  "Notes",
  "Music"
];

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: GridView.builder(
          itemCount: arrayOfColors.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            childAspectRatio: 100 / 100,
          ),
          itemBuilder: (context, index) => Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: arrayOfColors[index],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  child: arrayOfIcons[index],
                ),
                SizedBox(height: 15),
                Text(
                  arrayOfTexts[index],
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
                      height: MediaQuery.of(context).size.height / 4,
        ),
      ),
    );
  }
}
