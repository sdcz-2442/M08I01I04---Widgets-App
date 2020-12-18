import 'dart:convert';
import 'package:http/http.dart' as http;

class MusicRepo {
  Future getAllMusic() async {
    final baseUrl = 'https://acnhapi.com/v1/';
    final url = '${baseUrl}villagers';

    try {
      var response = await http.get(url);

      List music = [];

      json.decode(response.body).forEach((key, value) => music.add(value));
      music.sort((a, b) {
        return a['file-name']
            .toString()
            .toLowerCase()
            .compareTo(b['file-name'].toString().toLowerCase());
      });
      return music;
    } catch (error) {
      throw (error);
    }
  }
}
