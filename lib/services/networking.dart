import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  late String url;
  late double latitude;
  late double longitude;
  var location;
  var httpResponse;

  NetworkHelper({required this.url});

  //var decoder = jsonDecode(httpResponse.body);

  Future getData() async {
    http.Response httpResponse = await http.get(Uri.parse(url));
    if (httpResponse.statusCode == 200) {
      String data = httpResponse.body;
      return jsonDecode(data);
      print(data);
    } else {
      print(httpResponse.statusCode);
    }

    location = jsonDecode(httpResponse.body)['sys']['country'];
  }
}
