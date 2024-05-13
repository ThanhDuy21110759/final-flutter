class Condiment {
  int? id;
  String? name;
  double? unitPrice;
  String? productStatus;

  Condiment({this.id, this.name, this.unitPrice, this.productStatus});

  Condiment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    unitPrice = json['unitPrice'];
    productStatus = json['productStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['unitPrice'] = this.unitPrice;
    data['productStatus'] = this.productStatus;
    return data;
  }

}