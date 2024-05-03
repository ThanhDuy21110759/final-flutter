class OrderCreateRequest {
  Product? product;
  int? quantity;
  ProductCondimentDetails? productCondimentDetails;

  OrderCreateRequest({this.product, this.quantity, this.productCondimentDetails});

  OrderCreateRequest.fromJson(Map<String, dynamic> json) {
    product =
    json['product'] != null ? Product.fromJson(json['product']) : null;
    quantity = json['quantity'];
    productCondimentDetails = json['productCondimentDetails'] != null
        ? ProductCondimentDetails.fromJson(json['productCondimentDetails'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (product != null) {
      data['product'] = product!.toJson();
    }
    data['quantity'] = quantity;
    if (productCondimentDetails != null) {
      data['productCondimentDetails'] = productCondimentDetails!.toJson();
    }
    return data;
  }
}

class Product {
  int? id;
  int? size;

  Product({this.id, this.size});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    size = json['size'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['size'] = size;
    return data;
  }
}

class ProductCondimentDetails {
  List<Condiment>? condiment;

  ProductCondimentDetails({this.condiment});

  ProductCondimentDetails.fromJson(Map<String, dynamic> json) {
    if (json['condiment'] != null) {
      condiment = <Condiment>[];
      json['condiment'].forEach((v) {
        condiment!.add(Condiment.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (condiment != null) {
      data['condiment'] = condiment!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Condiment {
  int? id;
  int? quantity;

  Condiment({this.id, this.quantity});

  Condiment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['quantity'] = quantity;
    return data;
  }
}