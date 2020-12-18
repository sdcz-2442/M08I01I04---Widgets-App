import 'dart:convert';
import 'package:http/http.dart' as http;

class SeaRepo {
  Future getAllSea() async {
    final baseUrl = 'https://acnhapi.com/v1/';
    final url = '${baseUrl}fish';

    try {
      var response = await http.get(url);

      List sea = [];

      json.decode(response.body).forEach((key, value) => sea.add(value));
      sea.sort((a, b) {
        return a['file-name']
            .toString()
            .toLowerCase()
            .compareTo(b['file-name'].toString().toLowerCase());
      });
      return sea;
    } catch (error) {
      throw (error);
    }
  }
}
