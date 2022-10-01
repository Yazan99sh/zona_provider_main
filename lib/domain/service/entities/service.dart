class Service {
  final int id;
  final double? price;
  final String? image;
  final String? name;
  final String? description;
  final int? isColor;
  final String? idCategory;
  final String? idProvider;
  final String? address;
  final double? rate;

  Service({
    required this.id,
    this.price,
    this.image,
    this.name,
    this.description,
    this.isColor,
    this.idCategory,
    this.idProvider,
    this.address,
    this.rate,
  });
}
