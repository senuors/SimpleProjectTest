class Product {
  final String id;
  final String name;
  final double price;
  final String image;
  final double rating;
  final String description;
  final String category;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    this.rating = 4.5,
    this.description =
        'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
    this.category = 'All',
  });
}
