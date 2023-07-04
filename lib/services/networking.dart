
import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper{
  NetworkHelper(this.url);
  final Uri url;

  Future getData() async{
    var response = await http.get(url);
    print("API response");
    if (response.statusCode == 200) {
      print("API response");

      var decodedData = jsonDecode(response.body);
      return decodedData;

    }else {
      print('empty');
    }
  }

}

