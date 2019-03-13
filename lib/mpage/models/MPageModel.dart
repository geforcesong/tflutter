import 'package:scoped_model/scoped_model.dart';
import '../factories/PropertyFactory.dart';

class Property {
  String address;
  String id;

  @override
  String toString() {
    // TODO: implement toString
    return "${this.address}, ${this.id}";
  }
}

class MPageModel extends Model {
  List<Property> listings = new List<Property>();
  int _pageIndex = 0;
  int _totalPages = -1;

  int get listingCount => listings.length;

  loadData() async {
    _pageIndex++;
    if (_totalPages > 0 && _pageIndex >= _totalPages) {
      return;
    }
    var propertyFactory = new PropertyFactory();
    var resp = await propertyFactory.searchListings(_pageIndex);
    if (resp != null &&
        resp["data"] != null &&
        resp["data"]["listings"] != null) {
      _totalPages = (resp["data"]["totalCount"] ~/ 50) +
          (resp["data"]["totalCount"] % 50 == 0 ? 0 : 1);
      var respListings = resp["data"]["listings"];
      for (var i = 0; i < respListings.length; i++) {
        Property property = new Property();
        property.address = respListings[i]["address"];
        property.id = respListings[i]["id"];
        listings.add(property);
      }
      notifyListeners();
    }
  }
}
