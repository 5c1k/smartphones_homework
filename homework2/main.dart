import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const String appTitle = 'Flutter layout demo';

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      theme: ThemeData(
        primaryColor: Colors.teal,
        scaffoldBackgroundColor: const Color(0xFFE8F5E9),
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal[700],
          title: const Text(appTitle, style: TextStyle(color: Colors.white)),
        ),
        body: const SingleChildScrollView(
          child: Column(
            children: [
              ImageSection(image: 'images/lake.jpg'),

              /// الاسم والايميل تحت الصورة
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Text(
                  'zeyad sadun\zeya61356@gmail.com',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),

              TitleSection(
                name: 'Nature Retreat',
                location: 'Peaceful Outdoor Escape',
              ),

              ButtonSection(),

              TextSection(
                description:
                    'Nature is a source of peace and beauty, offering breathtaking landscapes '
                    'that calm the mind and refresh the soul. Green forests, flowing rivers, '
                    'open skies, and majestic mountains all work together in perfect harmony. '
                    'Spending time in nature helps reduce stress, restore inner balance, and '
                    'strengthen our connection with the world around us. The gentle sound of '
                    'the wind, the warmth of sunlight, and the songs of birds remind us of the '
                    'simple joys of life. Protecting nature is essential so future generations '
                    'can continue to experience its beauty and tranquility.',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/* -------- Image Section -------- */

class ImageSection extends StatelessWidget {
  const ImageSection({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(
            image,
            width: 300, // 👈 حجم مناسب
            height: 180,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

/* -------- Title Section -------- */

class TitleSection extends StatelessWidget {
  const TitleSection({super.key, required this.name, required this.location});

  final String name;
  final String location;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black87,
                    ),
                  ),
                ),
                Text(
                  location,
                  style: TextStyle(color: Colors.grey[700], fontSize: 14),
                ),
              ],
            ),
          ),
          const FavoriteWidget(),
        ],
      ),
    );
  }
}

/* -------- Favorite Widget -------- */

class FavoriteWidget extends StatefulWidget {
  const FavoriteWidget({super.key});

  @override
  State<FavoriteWidget> createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorited = true;
  int _favoriteCount = 41;

  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _favoriteCount -= 1;
        _isFavorited = false;
      } else {
        _favoriteCount += 1;
        _isFavorited = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: Icon(
            _isFavorited ? Icons.star : Icons.star_border,
            color: Colors.redAccent,
          ),
          onPressed: _toggleFavorite,
        ),
        Text('$_favoriteCount', style: const TextStyle(color: Colors.black87)),
      ],
    );
  }
}

/* -------- Button Section -------- */

class ButtonSection extends StatelessWidget {
  const ButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ButtonWithText(icon: Icons.call, label: 'CALL'),
          ButtonWithText(icon: Icons.near_me, label: 'ROUTE'),
          ButtonWithText(icon: Icons.share, label: 'SHARE'),
        ],
      ),
    );
  }
}

class ButtonWithText extends StatelessWidget {
  const ButtonWithText({super.key, required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    final Color color = Colors.blueGrey;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: color),
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Text(label, style: TextStyle(fontSize: 12, color: color)),
        ),
      ],
    );
  }
}

/* -------- Text Section -------- */

class TextSection extends StatelessWidget {
  const TextSection({super.key, required this.description});

  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Text(
        description,
        style: const TextStyle(
          fontSize: 14,
          height: 1.5,
          color: Colors.black87,
        ),
        softWrap: true,
      ),
    );
  }
}
