class CatalogueModels {
  static List<Item> items = [];

  // get item by ID
  Item getById(int id) =>
      items.firstWhere((element) => element.id == id, orElse: null);

  // item get by position
  Item getByPosition(int pos) => items[pos];
}

class Item {
  final int id;
  final String name;
  final String description;
  final num price;
  final String color;
  final String image;

  Item({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.color,
    required this.image,
  });
  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map['id'],
      name: map['name'],
      description: map['desc'],
      price: map['price'],
      color: map['color'],
      image: map['image'],
    );
  }
}
