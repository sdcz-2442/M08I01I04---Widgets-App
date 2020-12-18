import 'package:flutter/material.dart';
import 'package:m08u01i04_app/bugs/bugs_screen.dart';
import 'package:m08u01i04_app/villagers/villagers_screen.dart';
import 'package:m08u01i04_app/art/art_screen.dart';
import 'package:m08u01i04_app/fossils/fossils_screen.dart';
import 'package:m08u01i04_app/furniture/furniture_screen.dart';
import 'package:m08u01i04_app/seacreatures/sea_screen.dart';
import 'package:m08u01i04_app/music/music_screen.dart';

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);
  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  int _currentIndex = 0;

  Icon customIcon = Icon(Icons.search);
  Widget customSearchBar = Text('Nookpedia', style: (TextStyle(fontFamily: 'Pacifico', color: Colors.black, fontSize: 35.0)),);

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: customSearchBar,
        backgroundColor: Colors.white,
        actions: <Widget>[
          IconButton(
            onPressed: () {
            },
            icon: customIcon,
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => VillagersScreen()));
                },
                child: Container(
                  //color: Colors.red,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/villager_button.png'),
                        fit: BoxFit.fill
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => BugsScreen()));
                },
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/bug_button.png'),
                        fit: BoxFit.fill
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SeaScreen()));
                },
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/fish_button.png'),
                        fit: BoxFit.fill
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => FossilsScreen()));
                },
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/fossils_button.png'),
                        fit: BoxFit.fill
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ArtScreen()));
                },
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/art_button.png'),
                        fit: BoxFit.fill
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => FurnitureScreen()));
                },
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/furniture_button.png'),
                        fit: BoxFit.fill
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MusicScreen()));
                },
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/music_button.png'),
                        fit: BoxFit.fill
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
