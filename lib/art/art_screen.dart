import 'package:flutter/material.dart';
import 'package:m08u01i04_app/art/art_detail_screen.dart';
import 'art_repo.dart';
import 'package:loading_animations/loading_animations.dart';

class ArtScreen extends StatefulWidget {
  @override
  _ArtScreenState createState() => _ArtScreenState();
}

class _ArtScreenState extends State<ArtScreen> {
  List art;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder(
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.none &&
                snapshot.hasData == null) {
              return Container();
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: LoadingBouncingGrid.square(
                  size: 80,
                  backgroundColor: Colors.green,
                ),
              );
            }

            if (snapshot.connectionState == ConnectionState.done &&
                !snapshot.hasData) {
              return Text('No data');
            }
            return Column(
              children: <Widget>[
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 55),
                    itemCount: snapshot.data.length,
                    itemBuilder: (ctx, index) {
                      return Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        elevation: 5,
                        child: ListTile(
                          leading: Image.network(
                            'https://acnhapi.com/v1/icons/villagers/${snapshot
                                .data[index]['id']}',
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ArtDetailScreen(
                                        art: snapshot.data[index],
                                      ),
                              ),
                            );
                          },
                          title: Text(
                            '${snapshot.data[index]['name']['name-EUen']
                                .toString()
                                .toUpperCase()}',
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 22.0,
                            )
                          ),
                          subtitle: Text(
                              '${snapshot.data[index]['saying']}',
                          style: TextStyle(
                            fontStyle: FontStyle.italic
                          ),),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          },
          future: ArtRepo().getAllArt(),
          initialData: [],
        ),
      ),
    );
  }
}
