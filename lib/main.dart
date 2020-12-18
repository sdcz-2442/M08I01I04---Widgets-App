import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:m08u01i04_app/homepage.dart';
import 'package:m08u01i04_app/widgets/network_image.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: IntroSixPage(),
    );
  }
}

class IntroSixPage extends StatefulWidget {
  @override
  _IntroSixPageState createState() => _IntroSixPageState();
}

class _IntroSixPageState extends State<IntroSixPage> {
  SwiperController _controller = SwiperController();
  int _currentIndex = 0;
  final List<String> titles = [
    "Welcome",
    "Introduction",
    "Usage",
  ];
  final List<String> subtitles = [
    "Welcome to Nookpedia.",
    "Nookpedia is an Android App for items from Animal Crossing: New Horizons",
    "Nookpedia is free and without authentications"
  ];
  final List<Color> colors = [
    Colors.green,
    Colors.lightGreen,
    Colors.green,
  ];
  final List<String> introIllus = [
    'https://www.lavanguardia.com/r/GODO/LV/p7/WebSite/2020/03/16/Recortada/img_agarcial_20200316-192026_imagenes_lv_terceros_acnh-kxg-U474195655922RQE-992x558@LaVanguardia-Web.jpg',
    'https://i.ytimg.com/vi/fxprAJQyFwQ/maxresdefault.jpg',
    'https://outsidergaming.com/wp-content/uploads/2020/03/Time-Travel-Animal-Crossing-New-Horizons-header.jpg'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Swiper(
            loop: false,
            index: _currentIndex,
            onIndexChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            controller: _controller,
            pagination: SwiperPagination(
              builder: DotSwiperPaginationBuilder(
                activeColor: Colors.red,
                activeSize: 20.0,
              ),
            ),
            itemCount: 3,
            itemBuilder: (context, index) {
              return IntroItem(
                title: titles[index],
                subtitle: subtitles[index],
                bg: colors[index],
                imageUrl: introIllus[index],
              );
            },
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: FlatButton(
              child: Text("Skip",
              style: TextStyle(
                color: Colors.white,
              ),
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => MyStatefulWidget()));
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: IconButton(
              icon:
              Icon(_currentIndex == 2 ? Icons.check : Icons.arrow_forward,
              color: Colors.white),
              onPressed: () {
                if (_currentIndex != 2) _controller.next();
                else Navigator.push(context, MaterialPageRoute(builder: (context) => MyStatefulWidget()));;
              },
            ),
          )
        ],
      ),
    );
  }
}

class IntroItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final Color bg;
  final String imageUrl;

  const IntroItem(
      {Key key, @required this.title, this.subtitle, this.bg, this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: bg ?? Theme.of(context).primaryColor,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              const SizedBox(height: 40),
              Text(
                title,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35.0,
                    color: Colors.white),
              ),
              if (subtitle != null) ...[
                const SizedBox(height: 20.0),
                Text(
                  subtitle,
                  style: TextStyle(color: Colors.white, fontSize: 24.0),
                  textAlign: TextAlign.center,
                ),
              ],
              const SizedBox(height: 40.0),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(bottom: 70),
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Material(
                      elevation: 4.0,
                      child: PNetworkImage(
                        imageUrl,
                        fit: BoxFit.cover,
                      ),),),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
