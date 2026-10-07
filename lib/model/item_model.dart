class ItemModel {
  final int id;
  final String name;
  bool isfavourite;

  ItemModel({
    required this.id,
    required this.name,
    this.isfavourite=false
  });
}
