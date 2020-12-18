import 'package:flutter/material.dart';
import 'package:m08u01i04_app/seacreatures/sea_screen.dart';
import 'package:m08u01i04_app/furniture/furniture_screen.dart';
import 'package:m08u01i04_app/fossils/fossils_screen.dart';
import 'package:m08u01i04_app/art/art_screen.dart';
import 'package:m08u01i04_app/villagers/villagers_screen.dart';
import 'package:m08u01i04_app/bugs/bugs_screen.dart';
import 'package:m08u01i04_app/music/music_screen.dart';


class TopMenus extends StatefulWidget {
  @override
  _TopMenusState createState() => _TopMenusState();
}

class _TopMenusState extends State<TopMenus> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 80,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          TopMenuTiles(name: "Villagers", imageUrl: "wat", page: VillagersScreen()),
          TopMenuTiles(name: "Bugs", imageUrl: "bug", page: BugsScreen()),
          TopMenuTiles(name: "Fish", imageUrl: "fishicon", page: SeaScreen()),
          TopMenuTiles(name: "Fossils", imageUrl: "533882", page: FossilsScreen()),
          TopMenuTiles(name: "Art", imageUrl: "art", page: ArtScreen()),
          TopMenuTiles(name: "Furniture", imageUrl: "furniture", page: FurnitureScreen()),
          TopMenuTiles(name: "Music", imageUrl: "villagers", page: MusicScreen()),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class TopMenuTiles extends StatelessWidget {
  String name;
  String imageUrl;
  Widget page;

  TopMenuTiles(
      {Key key,
        @required this.name,
        @required this.imageUrl,
        @required this.page,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        return Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page)
        );
      },
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 12, right: 12, top: 0, bottom: 0),
            child: Card(
                color: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(3.0),
                  ),
                ),
                child: Container(
                  width: 30,
                  height: 30,
                  child: Center(
                      child: Image.asset(
                        'assets/' + imageUrl + '.png',
                        width: 30,
                        height: 30,
                      )),
                )),
          ),
          Text(name,
              style: TextStyle(
                  color: Colors.black45,
                  fontSize: 14,
                  fontWeight: FontWeight.w400)),
        ],
      ),
    );
  }
}
