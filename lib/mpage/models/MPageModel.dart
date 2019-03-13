import 'package:scoped_model/scoped_model.dart';
import '../factories/PropertyFactory.dart';
import 'Property.dart';

class MPageModel extends Model {
  List<Property> listings = new List<Property>();
  int _pageIndex = 0;
  int _totalPages = -1;
  bool isloadingData = false;

  int get listingCount => listings.length;

  loadData() async {
    _pageIndex++;
    if (_totalPages > 0 && _pageIndex >= _totalPages) {
      return;
    }
    isloadingData = true;
    notifyListeners();
    var propertyFactory = new PropertyFactory();
    var resp = await propertyFactory.searchListings(_pageIndex);
    isloadingData = false;
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
        property.zipCode = respListings[i]["zipCode"];
        property.city = respListings[i]["city"];
        property.state = respListings[i]["state"];
        property.fullAddress = respListings[i]["fullAddress"];
        property.tnImgPath = respListings[i]["tnImgPath"];
        property.price = respListings[i]["price"];
        property.priceRaw = respListings[i]["priceRaw"];
        listings.add(property);
      }
    }
    notifyListeners();
  }
}
