class ReceiptResponse {
  int? code;
  List<Result>? result;

  ReceiptResponse({this.code, this.result});

  ReceiptResponse.fromJson(Map<String, dynamic> json) {
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
  int? id;
  String? date;
  double? discount;
  double? totalPrice;
  String? receiptStatus;
  int? staffId;
  int? customerId;
  List<ReceiptItems>? receiptItems;

  Result(
      {this.id,
        this.date,
        this.discount,
        this.totalPrice,
        this.receiptStatus,
        this.staffId,
        this.customerId,
        this.receiptItems});

  Result.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    discount = json['discount'];
    totalPrice = json['totalPrice'];
    receiptStatus = json['receiptStatus'];
    staffId = json['staffId'];
    customerId = json['customerId'];
    if (json['receiptItems'] != null) {
      receiptItems = <ReceiptItems>[];
      json['receiptItems'].forEach((v) {
        receiptItems!.add(ReceiptItems.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['date'] = date;
    data['discount'] = discount;
    data['totalPrice'] = totalPrice;
    data['receiptStatus'] = receiptStatus;
    data['staffId'] = staffId;
    data['customerId'] = customerId;
    if (receiptItems != null) {
      data['receiptItems'] = receiptItems!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ReceiptItems {
  Product? product;
  int? quantity;
  ProductCondimentDetails? productCondimentDetails;

  ReceiptItems({this.product, this.quantity, this.productCondimentDetails});

  ReceiptItems.fromJson(Map<String, dynamic> json) {
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
  String? name;
  double? discount;
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
    discount = json['discount'];
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
  String? name;
  double? price;

  Size({this.name, this.price});

  Size.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
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