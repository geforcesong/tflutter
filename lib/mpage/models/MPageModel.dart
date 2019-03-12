import 'package:scoped_model/scoped_model.dart';
import '../factories/PropertyFactory.dart';

class Listing {
  String address;
  String id;

  @override
  String toString() {
    // TODO: implement toString
    return "${this.address}, ${this.id}";
  }
}

class MPageModel extends Model {
  List<Listing> _listings = new List<Listing>();

  loadData() async {
    var propertyFactory = new PropertyFactory();
    var resp = await propertyFactory.searchListings();
    if (resp != null &&
        resp["data"] != null &&
        resp["data"]["listings"] != null) {
      var listings = resp["data"]["listings"];
      for (var i = 0; i < listings.length; i++) {
        Listing lst = new Listing();
        lst.address = listings[i]["address"];
        lst.id = listings[i]["id"];
        print(lst.toString());
        _listings.add(lst);
      }
    }
  }
}
