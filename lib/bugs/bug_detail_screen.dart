import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';


//'${widget.bug['availability']['location']}'
class BugDetailScreen extends StatefulWidget {
  final bug;

  BugDetailScreen({this.bug});

  @override
  _BugDetailScreenState createState() => _BugDetailScreenState();
}

class _BugDetailScreenState extends State<BugDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: <Widget>[
            Center(
              child: Container(
                height: 450,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage('https://acnhapi.com/v1/images/bugs/${widget.bug['id']}',
                      ),
                      //fit: BoxFit.scaleDown
                  ),
                ),
              ),
            ),
            SlidingUpPanel(
              panel: Center(
                child: Container(
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          //crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              '${widget.bug['name']['name-EUen'].toString().toUpperCase()}',
                              style:
                              TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                            ),
                            IconButton(
                              icon: Icon(Icons.keyboard_arrow_up, color: Colors.green),
                            ),
                            SizedBox(height: 15.0),
                            Text(
                              "${widget.bug['catch-phrase']}",
                              style: TextStyle(fontSize: 16.0),
                              textAlign: TextAlign.justify,
                            ),
                            Row(
                              children: <Widget>[
                                SizedBox(height: 50.0),
                                Text(
                                  'Price: '+'${widget.bug['price']}',
                                  style: TextStyle(color: Colors.grey.shade700),
                                ),
                                Spacer(),
                                Text(
                                  'Price Flick: '+'${widget.bug['price-flick']}',
                                  style: TextStyle(color: Colors.grey.shade700),
                                ),
                                Spacer(),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        )
    );
  }
}
