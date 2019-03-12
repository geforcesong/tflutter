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

  int get listingCount => listings.length;

  loadData() async {
    var propertyFactory = new PropertyFactory();
    var resp = await propertyFactory.searchListings();
    if (resp != null &&
        resp["data"] != null &&
        resp["data"]["listings"] != null) {
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
