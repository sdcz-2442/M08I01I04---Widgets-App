import 'dart:convert';
import 'package:http/http.dart' as http;

class ArtRepo {
  Future getAllArt() async {
    final baseUrl = 'https://acnhapi.com/v1/';
    final url = '${baseUrl}villagers';

    try {
      var response = await http.get(url);

      List art = [];

      json.decode(response.body).forEach((key, value) => art.add(value));
      art.sort((a, b) {
        return a['file-name']
            .toString()
            .toLowerCase()
            .compareTo(b['file-name'].toString().toLowerCase());
      });
      return art;
    } catch (error) {
      throw (error);
    }
  }
}
