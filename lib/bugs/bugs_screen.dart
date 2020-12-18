import 'package:m08u01i04_app/bugs/bug_detail_screen.dart';
import 'package:flutter/material.dart';
import 'bugs_repo.dart';
import 'package:loading_animations/loading_animations.dart';

class BugsScreen extends StatefulWidget {
  @override
  _BugsScreenState createState() => _BugsScreenState();
}

class _BugsScreenState extends State<BugsScreen> {
  List bugs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        elevation: 0,
        title: Text(
          "Bugs",
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
                  Expanded(
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                      itemCount: snapshot.data.length,
                      itemBuilder: (ctx, index) {
                        return Container(
                          margin: const EdgeInsets.fromLTRB(0.5, 2.0, 0.5, 0),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black38
                            ),
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(15))
                          ),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      BugDetailScreen(
                                        bug: snapshot.data[index],
                                      ),
                                ),
                              );
                            },
                            child: Container(
                              margin: const EdgeInsets.all(5.0),
                              child: Column(
                                children: [
                                  Image.network(
                                      'https://acnhapi.com/v1/icons/bugs/${snapshot.data[index]['id']}',
                                    height: 60,
                                  ),
                                  Text(
                                      '${snapshot.data[index]['name']['name-EUen']
                                          .toString()
                                          .toUpperCase()}',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12.0,
                                      )
                                  ),
                                  Text(
                                    'Price: ${snapshot.data[index]['price']}',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontStyle: FontStyle.italic,
                                        color: Colors.black54
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
            future: BugsRepo().getAllBugs(),
            initialData: [],
          ),
        ),
      ),
    );
  }
}
