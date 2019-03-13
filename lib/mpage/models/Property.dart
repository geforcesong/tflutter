class Property {
  String address;
  String id;
  String fullAddress;
  String tnImgPath;
  String city;
  String state;
  String zipCode;

  @override
  String toString() {
    // TODO: implement toString
    return "${this.address}, ${this.id}";
  }
}