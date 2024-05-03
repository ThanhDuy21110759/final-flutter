
class CartResponse {
  int? code;
  List<Result>? result;

  CartResponse({this.code, this.result});

  CartResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    if (json['result'] != null) {
      result = <Result>[];
      json['result'].forEach((v) {
        result!.add(Result.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    if (result != null) {
      data['result'] = result!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Result {
  Product? product;
  int? quantity;
  ProductCondimentDetails? productCondimentDetails;

  Result({this.product, this.quantity, this.productCondimentDetails});

  Result.fromJson(Map<String, dynamic> json) {
    product =
    json['product'] != null ? Product.fromJson(json['product']) : null;
    quantity = json['quantity'];
    productCondimentDetails = json['productCondimentDetails'] != null
        ? ProductCondimentDetails.fromJson(json['productCondimentDetails'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
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
  String? name;
  double? discount; // Change this to double
  String? productType;
  String? productStatus;
  Size? size;

  Product(
      {this.id,
        this.name,
        this.discount,
        this.productType,
        this.productStatus,
        this.size});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    discount = json['discount'].toDouble(); // Convert the discount to double
    productType = json['productType'];
    productStatus = json['productStatus'];
    size = json['size'] != null ? Size.fromJson(json['size']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['discount'] = discount;
    data['productType'] = productType;
    data['productStatus'] = productStatus;
    if (size != null) {
      data['size'] = size!.toJson();
    }
    return data;
  }
}

class Size {
  int? id;
  String? name;
  double? price;

  Size({this.id, this.name, this.price});

  Size.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['price'] = price;
    return data;
  }
}

class ProductCondimentDetails {
  List<Condiments>? condiments;

  ProductCondimentDetails({this.condiments});

  ProductCondimentDetails.fromJson(Map<String, dynamic> json) {
    if (json['condiments'] != null) {
      condiments = <Condiments>[];
      json['condiments'].forEach((v) {
        condiments!.add(Condiments.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (condiments != null) {
      data['condiments'] = condiments!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Condiments {
  Condiment? condiment;
  int? quantity;

  Condiments({this.condiment, this.quantity});

  Condiments.fromJson(Map<String, dynamic> json) {
    condiment = json['condiment'] != null
        ? Condiment.fromJson(json['condiment'])
        : null;
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (condiment != null) {
      data['condiment'] = condiment!.toJson();
    }
    data['quantity'] = quantity;
    return data;
  }
}

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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['unitPrice'] = unitPrice;
    data['productStatus'] = productStatus;
    return data;
  }
}