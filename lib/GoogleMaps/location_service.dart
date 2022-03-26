import 'dart:convert';

import 'package:http/http.dart' as http;

class LocationService {
  final String _key =
      'AIzaSyC9UyXEkIayXCAUkMOxA0nDKqyfCTyLKUo'; // 'AIzaSyAh42BiXzE4HbBTf5u4bwKFrBloFROk0WI';

  Future<String> getPlaceId(String input) async {
    final String url =
        'https://maps.googleapis.com/maps/api/place/findplacefromtext/json?input=$input&inputtype=textquery&key=$_key';

    var response = await http.get(Uri.parse(url));

    var json = jsonDecode(response.body);

    print("calling getPlaces ${json}");

    var placeId = json['candidates'][0]['place_id'] as String;

    print('getPlaceId $placeId');

    return placeId;
  }

  Future<Map<String, dynamic>> getPlace(String input) async {
    final placeId = await getPlaceId(input);
    final String url =
        'https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=$_key';

    var response = await http.get(Uri.parse(url));

    var json = jsonDecode(response.body);

    var results = json['result'] as Map<String, dynamic>;

    print('getPlace $results');

    return results;
  }
}
