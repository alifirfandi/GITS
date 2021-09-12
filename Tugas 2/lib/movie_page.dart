

// Data Dummy
import 'package:flutter/material.dart';

String title = 'BoBoiBoy';
String description =
    'BoBoiBoy adalah seri animasi Malaysia CGI yang memulai debutnya pada tahun 2011 di TV3. Serial ini berakhir pada tanggal 11 Juni 2016 di TV3 dengan total 3 musim. Sebuah sekuel bernama BoBoiBoy Galaxy ditayangkan saat ini.';
List<Map<String, String>> episodes = [
  {
    'assets': 'assets/eps-1.jpg',
    'title': 'The Beginning',
    'subtitle': 'BoBoiBoy menaiki kereta Yong Pin Aerotrain.'
  },
  {
    'assets': 'assets/eps-2.jpg',
    'title': 'Adu Du Attacks!',
    'subtitle': 'Dengan berlatih, BoBoiBoy mencoba mengingat.'
  },
  {
    'assets': 'assets/eps-3.jpg',
    'title': 'Multi-Monster Mayhem!',
    'subtitle': 'BoBoiBoy memperkenalkan Ochobot kepada Tok Aba'
  },
  {
    'assets': 'assets/eps-4.jpg',
    'title': 'Kidnapped!',
    'subtitle': 'Meskipun diingatkan oleh BoBoiBoy Ying diculik'
  }
];

class MoviePage extends StatelessWidget {
  const MoviePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.5),
      body: ListView(
        children: [
          _header(),
          SizedBox(height: 20),
          _description(),
          SizedBox(height: 20),
          _icon(),
          SizedBox(height: 20),
          _listEpisodes("Season 1"),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _header() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24),
      height: 250,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Stack(
          children: [
            ShaderMask(
              blendMode: BlendMode.dstIn,
              shaderCallback: (rectangle) {
                return LinearGradient(
                        colors: [Colors.black, Colors.transparent],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter)
                    .createShader(
                  Rect.fromLTRB(0, 0, rectangle.width, rectangle.height),
                );
              },
              child: Image.asset(
                'assets/background.jpg',
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _description() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24),
      child: Text(
        description,
        textAlign: TextAlign.justify,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
      ),
    );
  }

  Widget _icon() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _iconContainer(Icons.play_arrow_rounded),
          _iconContainer(Icons.chat_bubble_outline),
          _iconContainer(Icons.add),
          _iconContainer(Icons.warning),
        ],
      ),
    );
  }

  Widget _iconContainer(IconData icon) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white),
      ),
      child: Icon(
        icon,
        color: Colors.white,
      ),
    );
  }

  Widget _listEpisodes(String season) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            season,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 20),
          Column(
            children: episodes
                .map((episode) => _episode(
                    episode['assets'], episode['title'], episode['subtitle']))
                .toList(),
          )
        ],
      ),
    );
  }

  Widget _episode(String? assetImage, String? title, String? subtitle) {
    return Card(
      child: ListTile(
        tileColor: Colors.black.withOpacity(0.9),
        leading: Image.asset(assetImage ?? 'assets/background.jpg'),
        title: Text(
          title ?? '-',
          style: TextStyle(color: Colors.white),
        ),
        subtitle: Text(
          subtitle ?? '-',
          style: TextStyle(color: Colors.white.withOpacity(0.7)),
        ),
        isThreeLine: true,
      ),
    );
  }
}