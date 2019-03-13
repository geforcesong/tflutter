import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class PropertyFactory {
  Future<dynamic> searchListings(int pageIndex) async{
    var url = 'https://appapi.movoto.com/api/dosearch/';
    var data = {"conditions":{"garage":0,"hasPhoto":1,"hasPool":0,"isNewListingsOnly":0,"isOpenHousesOnly":0,"isReducedPrice":0,"location":{"lat":"36.778261","lng":"-119.4179324"},"maxDom":0,"maxLat":0.0,"maxLng":0.0,"maxLot":0,"maxPrice":0,"maxSqft":0,"maxYear":0,"minBath":0,"minBed":0,"minDom":0,"minLat":0.0,"minLng":0.0,"minLot":0,"minPrice":0,"minSqft":0,"minYear":0,"pageIndex":"$pageIndex","searchPropertyStatus":"ACTIVE_AND_PENDING","searchType":"CITY","sortColumn":"DOM","sortOrder":"ASC","isHomeRoam":false,"input":"SAN JOSE CA"},"userId":""};
    Map<String, String> requestHeaders = {
       'Content-type': 'application/json'
     };
    var response = await http.post(url, body: convert.jsonEncode(data), headers: {"Content-Type": "application/json"});
    var jsonResponse = convert.jsonDecode(response.body);
    return jsonResponse;
  }
}