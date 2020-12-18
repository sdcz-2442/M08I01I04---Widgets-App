import 'package:flutter/material.dart';

class VillagerDetailScreen extends StatefulWidget {
  final villager;


  VillagerDetailScreen({this.villager});

  @override
  _VillagerDetailScreenState createState() => _VillagerDetailScreenState();
}

class _VillagerDetailScreenState extends State<VillagerDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: new BoxDecoration(
              image: new DecorationImage(
      image: new NetworkImage('${widget.villager['image_uri']}'),
                  fit: BoxFit.fitHeight
              ),
            ),
          ),
          SafeArea(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(children: [
                      MaterialButton(
                        padding: const EdgeInsets.all(8.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        child: Icon(Icons.arrow_back_ios),
                        color: Colors.white,
                        textColor: Colors.black,
                        minWidth: 0,
                        height: 40,
                        onPressed: () => Navigator.pop(context),
                      ),
                    ]),
                  ),
                  Spacer(),
                  Spacer(),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: Colors.white),
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            child: SingleChildScrollView(
                              physics: BouncingScrollPhysics(),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  ListTile(
                                    title: Text(
                                      '${widget.villager['name']['name-EUen'].toString().toUpperCase()}',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 28.0
                                      ),
                                    ),
                                    subtitle: Text('"${widget.villager['saying']}"',
                                      style: TextStyle(
                                          fontStyle: FontStyle.italic,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5.0, vertical:0.0),
                                  ),
                                  ExpansionTile(
                                    title: Text("Show Details",style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold
                                    ),
                                    ),
                                    children: <Widget>[
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        padding: const EdgeInsets.all(10.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.stretch,
                                          children: <Widget>[
                                            Text('Species: '+'${widget.villager['species']}',
                                            ),
                                            Text('Gender: '+'${widget.villager['gender']}',
                                            ),
                                            Text('Personality: '+'${widget.villager['personality']}',
                                            ),
                                            Text('Birthday: '+'${widget.villager['birthday-string']}',
                                            ),
                                            Text('Hobby: '+'"${widget.villager['hobby']}"',
                                            ),
                                            Text('Catch phrase: '+'"${widget.villager['catch-phrase']}"',
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
          ),
        ],
      ),
    );
  }
}
