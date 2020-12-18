import 'package:flutter/material.dart';
import 'package:m08u01i04_app/villagers/villager_detail_screen.dart';
import 'villagers_repo.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:m08u01i04_app/widgets/top_menu_widget.dart';

class VillagersScreen extends StatefulWidget {
  @override
  _VillagersScreenState createState() => _VillagersScreenState();
}

class _VillagersScreenState extends State<VillagersScreen> {
  List villagers;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        elevation: 0,
        title: Text(
          "Villagers",
          style: TextStyle(
              fontFamily: 'Pacifico',
              color: Color(0xFF3a3737),
              fontSize: 30,
              fontWeight: FontWeight.w500),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_outlined,
              color: Colors.green),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {
            },
            icon: Icon(
                Icons.search,
                color: Colors.black45
            ),
          ),
        ],
      ),
      body: SafeArea(
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
                  TopMenus(),
                  Expanded(
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 200,
                        crossAxisSpacing: 5.0,
                        mainAxisSpacing: 5.0,
                        childAspectRatio: 0.8
                      ),
                      itemCount: snapshot.data.length,
                      itemBuilder: (ctx, index) {
                        return Container(
                          margin: const EdgeInsets.fromLTRB(0.5, 2.0, 0.5, 0),
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.all(Radius.circular(15))
                          ),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      VillagerDetailScreen(
                                        villager: snapshot.data[index],
                                      ),
                                ),
                              );
                            },
                            child: Container(
                              margin: const EdgeInsets.all(5.0),
                              child: Column(
                                children: [
                                  Text(
                                      '${snapshot.data[index]['name']['name-EUen']
                                          .toString()
                                          .toUpperCase()}',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 22.0,
                                      )
                                  ),
                                  Image.network(
                                    'https://acnhapi.com/v1/icons/villagers/${snapshot
                                        .data[index]['id']}',
                                  ),
                                  Text(
                                    '${snapshot.data[index]['saying']}',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontStyle: FontStyle.italic,
                                      color: Colors.white
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            },
            future: VillagersRepo().getAllVillagers(),
            initialData: [],
          ),
        ),
      ),
    );
  }
}