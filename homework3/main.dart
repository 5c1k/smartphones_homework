import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Product Listing',
      home: ProductList(),
    );
  }
}

class ProductList extends StatelessWidget {
  final List<Map<String, dynamic>> products = [
    {
      "name": "iPhone",
      "description": "iPhone is the stylist phone ever",
      "price": 1000,
      "color": Colors.purple,
    },
    {
      "name": "Pixel",
      "description": "Pixel is the most featureful phone ever",
      "price": 800,
      "color": Colors.blue,
    },
    {
      "name": "Laptop",
      "description": "Laptop is most productive development tool",
      "price": 2000,
      "color": Colors.green,
    },
    {
      "name": "Tablet",
      "description": "Tablet is the most useful device ever for meeting",
      "price": 1500,
      "color": Colors.yellow,
    },
    {
      "name": "Pendrive",
      "description": "Pendrive is the stylish phone ever",
      "price": 100,
      "color": Colors.brown,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Product Listing")),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ProductBox(
            name: products[index]['name'],
            description: products[index]['description'],
            price: products[index]['price'],
            color: products[index]['color'],
          );
        },
      ),
    );
  }
}

class ProductBox extends StatelessWidget {
  final String name;
  final String description;
  final int price;
  final Color color;

  const ProductBox({
    required this.name,
    required this.description,
    required this.price,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Row(
        children: [
          Container(
            width: 100,
            height: 100,
            color: color,
            alignment: Alignment.center,
            child: Text(
              name.toLowerCase(),
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(description),
                  SizedBox(height: 5),
                  Text(
                    "Price: $price",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
