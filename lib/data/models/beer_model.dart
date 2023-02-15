class BeerModel {
  final String img;
  final String volume;
  final String alcoholContent;
  final String color;
  final String name;
  final String price;
  final String description;
  final String alcoholType;

  BeerModel(this.img, this.volume, this.alcoholContent, this.color, this.name,
      this.price, this.description, this.alcoholType);

  Map<String, dynamic> toJson() => {
        'img': img,
        'volume': volume,
        'alcoholContent': alcoholContent,
        'color': color,
        'name': name,
        'price': price,
        'description': description,
        'alcoholType': alcoholType
      };

  static BeerModel fromJson(Map<String, dynamic> json) => BeerModel(
      json['img'],
      json['volume'],
      json['alcoholContent'],
      json['color'],
      json['name'],
      json['price'],
      json['description'],
      json['alcoholType']);
}
