import 'package:flutter/material.dart';
import '../models/product.dart';
import '../models/cart.dart';
import '../widgets/product_card.dart';

class HomeScreen extends StatefulWidget {
  final Cart cart;
  
  const HomeScreen({super.key, required this.cart});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final Cart _cart;

  @override
  void initState() {
    super.initState();
    _cart = widget.cart;
    _cart.addListener(() {
      if (mounted) setState(() {});
    });
  }

  final List<Product> _products = [
    Product(
      id: '1',
      name: 'Pizza',
      description: 'Pizza pizza pizza',
      price: 999.99,
      imageUrl: 'https://res.cloudinary.com/dnunuskg6/image/upload/v1772519710/pizza_veot5d.png',
    ),
    Product(
      id: '2',
      name: 'Shawarma',
      description: 'Chicken Shawarma',
      price: 699.99,
      imageUrl: 'https://res.cloudinary.com/dnunuskg6/image/upload/v1772520220/Shawarma_zr41ek.png',
    ),
    Product(
      id: '3',
      name: 'Headphones',
      description: 'Noise-cancelling wireless headphones',
      price: 299.99,
      imageUrl: '🎧',
    ),
    Product(
      id: '4',
      name: 'Smart Watch',
      description: 'Track your fitness and stay connected',
      price: 399.99,
      imageUrl: '⌚',
    ),
    Product(
      id: '5',
      name: 'Tablet',
      description: 'Perfect for entertainment and productivity',
      price: 499.99,
      imageUrl: '📱',
    ),
    Product(
      id: '6',
      name: 'Camera',
      description: 'Professional DSLR camera',
      price: 1299.99,
      imageUrl: '📷',
    ),
  ];

  void _addToCart(Product product) {
    _cart.addItem(product);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${product.name} added to cart!'),
        duration: const Duration(seconds: 2),
        action: SnackBarAction(
          label: 'UNDO',
          onPressed: () {
            _cart.decreaseQuantity(product.id);
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Cart App'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Search feature coming soon!')),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('No new notifications')),
              );
            },
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.75,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: _products.length,
          itemBuilder: (context, index) {
            return ProductCard(
              product: _products[index],
              onAddToCart: _addToCart,
            );
          },
        ),
      ),
    );
  }
}
