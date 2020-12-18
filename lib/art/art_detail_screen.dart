import 'package:flutter/material.dart';

class ArtDetailScreen extends StatefulWidget {
  final art;

  ArtDetailScreen({this.art});

  @override
  _ArtDetailScreenState createState() => _ArtDetailScreenState();
}

class _ArtDetailScreenState extends State<ArtDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${widget.art['name']['name-EUen'].toString().toUpperCase()}',
        ),
        brightness: Brightness.light,
        backgroundColor: Colors.green,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_outlined),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: 250.0,
                    height: 250.0,
                    decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      image: new DecorationImage(
                          fit: BoxFit.cover, image: new NetworkImage('${widget.art['image_uri']}')
                      ),
                    ),
                    alignment: Alignment.center,
                  ),
                  SizedBox(
                    height: 30.0,
                    width: 300.0,
                    child: Divider(
                      color: Colors.green,
                    ),
                  ),
                  Text(
                      '"${widget.art['catch-phrase']}"',
                    style: TextStyle(
                      fontFamily: 'Source Sans Pro',
                      color: Colors.green,
                      fontSize: 20.0,
                      letterSpacing: 2.5,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                      width: 300.0,
                    child: Divider(
                    color: Colors.green,
                    ),
                  ),
                  Container(
                    width: 400.0,
                    height:60.0,
                    padding: EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      border: Border.all(
                        color: Colors.green,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(20))
                    ),
                    child: Text(
                      'Species: '+'${widget.art['species']}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    width: 400.0,
                    height:60.0,
                    padding: EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                        color: Colors.green,
                        border: Border.all(
                          color: Colors.green,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(20))
                    ),
                    child: Text(
                      'Gender: '+'${widget.art['gender']}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    width: 400.0,
                    height:60.0,
                    padding: EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                        color: Colors.green,
                        border: Border.all(
                          color: Colors.green,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(20))
                    ),
                    child: Text(
                      'Personality: '+'${widget.art['personality']}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    width: 400.0,
                    height:60.0,
                    padding: EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                        color: Colors.green,
                        border: Border.all(
                          color: Colors.green,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(20))
                    ),
                    child: Text(
                      'Birthday: '+'${widget.art['birthday-string']}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
