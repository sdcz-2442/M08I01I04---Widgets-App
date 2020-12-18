import 'dart:convert';
import 'package:http/http.dart' as http;

class FurnitureRepo {
  Future getAllFurniture() async {
    final baseUrl = 'https://acnhapi.com/v1/';
    final url = '${baseUrl}villagers';

    try {
      var response = await http.get(url);

      List furniture = [];

      json.decode(response.body).forEach((key, value) => furniture.add(value));
      furniture.sort((a, b) {
        return a['file-name']
            .toString()
            .toLowerCase()
            .compareTo(b['file-name'].toString().toLowerCase());
      });
      return furniture;
    } catch (error) {
      throw (error);
    }
  }
}
