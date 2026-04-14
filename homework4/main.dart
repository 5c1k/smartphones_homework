import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        scaffoldBackgroundColor: Colors.grey[100],
      ),
      home: MyHomePage(title: 'Products'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Product Listing"), centerTitle: true),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          ProductBox(
            name: "Apple iPhone",
            description: "هاتف ذكي بتصميم أنيق وأداء قوي مع كاميرا احترافية",
            price: 1000,
            image: "iphone.png",
          ),
          ProductBox(
            name: "Google Pixel",
            description: "أفضل تجربة أندرويد مع تحديثات سريعة وكاميرا مذهلة",
            price: 800,
            image: "pixel.png",
          ),
          ProductBox(
            name: "Huawei Laptop",
            description: "لابتوب قوي مناسب للعمل والبرمجة مع أداء عالي",
            price: 2000,
            image: "laptop.png",
          ),
          ProductBox(
            name: "Honor Tablet",
            description: "تابلت مثالي للاجتماعات والدراسة ومشاهدة المحتوى",
            price: 1500,
            image: "tablet.png",
          ),
        ],
      ),
    );
  }
}

class ProductBox extends StatelessWidget {
  final String name;
  final String description;
  final int price;
  final String image;

  ProductBox({
    Key? key,
    required this.name,
    required this.description,
    required this.price,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 6),
      height: 130,
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Row(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                "assets/appimages/" + image,
                width: 120,
                height: 120,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.deepPurple,
                      ),
                    ),
                    Text(
                      description,
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    Text(
                      "Price: \$$price",
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
