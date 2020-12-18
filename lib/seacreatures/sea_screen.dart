import 'package:flutter/material.dart';
import 'package:m08u01i04_app/seacreatures/sea_detail_screen.dart';
import 'sea_repo.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class SeaScreen extends StatefulWidget {
  @override
  _SeaScreenState createState() => _SeaScreenState();
}

class _SeaScreenState extends State<SeaScreen> {
  List sea;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                expandedHeight: 150.0,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  title: Text(''),
                  background: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/cj.png'),
                          fit: BoxFit.fill
                      ),
                    ),
                  )
                  //AssetImage('assets/fish_button.png'),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                    color: Colors.blue,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      ),
                    ),
                ),
              ),

              ////
            ],
        ),

    );
  }
}
