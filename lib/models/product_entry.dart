import 'dart:convert';

// String → List<Product>
List<Product> productFromJson(String str) =>
    List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// Envelope ala Django: {model, pk, fields}
class Product {
  String model;
  int pk;
  Fields fields;

  Product({required this.model, required this.pk, required this.fields});

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        model: json["model"] ?? '',
        pk: json["pk"] ?? 0,
        fields: Fields.fromJson(Map<String, dynamic>.from(json["fields"] ?? {})),
      );

  Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields.toJson(),
      };
}

// Bidang yang kita pakai di Flutter (disesuaikan ke Django)
class Fields {
  String name;
  int price;               // bisa datang sebagai "price" atau "amount"
  String description;
  String? thumbnail;       // opsional
  String? category;        // opsional
  bool isFeatured;         // opsional
  String? ownerUsername;   // opsional, untuk filter milik user

  Fields({
    required this.name,
    required this.price,
    required this.description,
    this.thumbnail,
    this.category,
    this.isFeatured = false,
    this.ownerUsername,
  });

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        name: (json["name"] ?? '').toString(),
        price: (json["price"] ?? json["amount"] ?? 0) is int
            ? (json["price"] ?? json["amount"] ?? 0) as int
            : int.tryParse((json["price"] ?? json["amount"] ?? '0').toString()) ?? 0,
        description: (json["description"] ?? '').toString(),
        thumbnail: (json["thumbnail"] ?? json["image"])?.toString(),
        category: (json["category"])?.toString(),
        isFeatured: (json["is_featured"] ?? json["featured"] ?? false) == true,
        ownerUsername: (json["owner_username"] ?? json["username"])?.toString(),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "price": price,
        "description": description,
        "thumbnail": thumbnail,
        "category": category,
        "is_featured": isFeatured,
        "owner_username": ownerUsername,
      };
}
