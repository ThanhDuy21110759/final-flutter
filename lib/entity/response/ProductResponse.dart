import 'package:coffee_ui/view/order_detail/order_page.dart';

class ProductResponse {
  int? code;
  List<Product>? result;

  ProductResponse({this.code, this.result});

  ProductResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    if (json['result'] != null) {
      result = <Product>[];
      json['result'].forEach((v) {
        result!.add(new Product.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    if (this.result != null) {
      data['result'] = this.result!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Product {
  int? id;
  String? name;
  String? image;
  double? discount;
  String? productType;
  String? productStatus;
  List<Sizes>? sizes;

  Product(
      {this.name,
        this.image,
        this.discount,
        this.productType,
        this.productStatus,
        this.sizes});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    discount = json['discount'];
    productType = json['productType'];
    productStatus = json['productStatus'];
    if (json['sizes'] != null) {
      sizes = <Sizes>[];
      json['sizes'].forEach((v) {
        sizes!.add(Sizes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['discount'] = this.discount;
    data['productType'] = this.productType;
    data['productStatus'] = this.productStatus;
    if (this.sizes != null) {
      data['sizes'] = this.sizes!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  double getPriceBySize(sizeType size){
    switch(size){
      case sizeType.small:
        return sizes![0].price!;
      case sizeType.medium:
        return sizes![1].price!;
      case sizeType.large:
        return sizes![2].price!;
    }
  }
}

class Sizes {
  String? name;
  double? price;

  Sizes({this.name, this.price});

  Sizes.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['price'] = this.price;
    return data;
  }
}
