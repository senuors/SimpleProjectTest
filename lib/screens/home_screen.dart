import 'package:flutter/material.dart';
import 'package:pro_2/screens/product_detail_screen.dart';

import '../models/product_model.dart';
import '../widgets/product_card.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  // Define screens for BottomNavigationBar
  // HomeScreenContent will be the content for the first tab (Home)
  final List<Widget> _screens = [
    HomeScreenContent(), // Content for Home tab
    Center(child: Text('Search Screen')), // Placeholder for Search tab
    Center(child: Text('Profile Screen')), // Placeholder for Profile tab
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('YOU PICK WE DELIVER'),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
      ),
      body: _screens[_currentIndex], // Display the selected screen
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

class HomeScreenContent extends StatefulWidget {
  const HomeScreenContent({super.key});

  @override
  _HomeScreenContentState createState() => _HomeScreenContentState();
}

class _HomeScreenContentState extends State<HomeScreenContent> {
  String selectedCategory = 'All';
  final List<String> categories = ['All', 'Category', 'Top', 'Recommended'];
  final List<Product> products = [
    Product(
      id: '1',
      name: 'T-Shirt',
      price: 300.00,
      image: 'assets/image1.jpg',
      rating: 4.5,
      category: 'Top',
    ),
    Product(
      id: '2',
      name: 'Jacket',
      price: 100.00,
      image: 'assets/image2.jpg',
      rating: 4.2,
      category: 'Recommended',
    ),
    Product(
      id: '3',
      name: 'Child Jacket',
      price: 600.00,
      image: 'assets/image3.jpg',
      rating: 4.8,
      category: 'Category',
    ),
    Product(
      id: '4',
      name: 'Sport Shoes',
      price: 450.00,
      image: 'assets/image4.jpg',
      rating: 4.7,
      category: 'Top',
    ),
    Product(
      id: '5', // Corrected duplicate ID
      name: 'Sport Shoes',
      price: 450.00,
      image:
          'assets/image4.jpg', // Consider different images for different products
      rating: 4.7,
      category: 'Top',
    ),
    Product(
      id: '6', // Corrected duplicate ID
      name: 'Sport Shoes',
      price: 450.00,
      image: 'assets/image4.jpg',
      rating: 4.7,
      category: 'Top',
    ),
    Product(
      id: '7', // Corrected duplicate ID
      name: 'Sport Shoes',
      price: 450.00,
      image: 'assets/image4.jpg',
      rating: 4.7,
      category: 'Top',
    ),
    Product(
      id: '8', // Corrected duplicate ID
      name: 'Sport Shoes',
      price: 450.00,
      image: 'assets/image5.jpg',
      rating: 4.7,
      category: 'Top',
    ),
    Product(
      id: '9', // Corrected duplicate ID
      name: 'Sport Shoes',
      price: 450.00,
      image: 'assets/image6.jpg',
      rating: 4.7,
      category: 'Top',
    ),
    Product(
      id: '10', // Corrected duplicate ID
      name: 'Sport Shoes',
      price: 450.00,
      image: 'assets/image4.jpg',
      rating: 4.7,
      category: 'Top',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final filteredProducts = selectedCategory == 'All'
        ? products
        : products.where((p) => p.category == selectedCategory).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // فئات التصنيف
        Container(
          height: 50,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: ChoiceChip(
                  label: Text(categories[index]),
                  selected: selectedCategory == categories[index],
                  selectedColor: Theme.of(context).primaryColor,
                  onSelected: (selected) {
                    setState(() {
                      selectedCategory = categories[index];
                    });
                  },
                ),
              );
            },
          ),
        ),
        SizedBox(height: 10),
        // قائمة المنتجات
        Expanded(
          child: GridView.builder(
            padding: EdgeInsets.all(16),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.75,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
            itemCount: filteredProducts.length,
            itemBuilder: (context, index) => ProductCard(
              product: filteredProducts[index],
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ProductDetailScreen(product: filteredProducts[index]),
                  ),
                );
              },
            ),
          ),
        ),
        // أحدث المنتجات
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Newest Products',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        Container(
          height: 200, // Adjusted height to prevent overflow
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.all(16),
            itemCount: products
                .length, // Consider limiting this or use a sub-list of newest products
            itemBuilder: (context, index) {
              if (products.isEmpty || index >= products.length) {
                return SizedBox.shrink();
              }
              return Container(
                width: 150,
                margin: EdgeInsets.only(right: 16),
                child: ProductCard(
                  product: products[index],
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ProductDetailScreen(product: products[index]),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
