import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      theme: ThemeData(
        fontFamily: 'Roboto', // Se você quiser uma fonte personalizada
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _fontSize = 20.0; // Tamanho inicial da fonte

  void _increaseFontSize() {
    setState(() {
      _fontSize += 2; // Aumenta o tamanho da fonte
    });
  }

  void _decreaseFontSize() {
    setState(() {
      if (_fontSize > 12) {
        _fontSize -= 2; // Diminui o tamanho da fonte, limitando para não ficar muito pequeno
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'TechAjuda',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 28,
              color: Color(0xFFD9D9D9),
            ),
          ),
        ),
        backgroundColor: Color(0xFF6C5481),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: [
            buildGridItem('Quando fazer um PIX?', Icons.payment, _fontSize),
            buildGridItem('Como fazer uma senha?', Icons.lock_outline, _fontSize),
            buildGridItem('Email estranho, e agora?', Icons.email_outlined, _fontSize),
            buildGridItem('Cuidados ao comprar online', Icons.shopping_cart, _fontSize),
            buildGridItem('Instalando aplicativos', Icons.download_outlined, _fontSize),
            buildGridItem('Como não cair em golpes', Icons.warning_amber_outlined, _fontSize),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Color(0xFF6C5481),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.elderly, size: 40, color: Colors.white),
              onPressed: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => SecondPage()));
              },
            ),
            IconButton(
              icon: Icon(Icons.text_increase, size: 40, color: Colors.white),
              onPressed: _increaseFontSize, // Aumenta o tamanho da fonte
            ),
            IconButton(
              icon: Icon(Icons.text_decrease, size: 40, color: Colors.white),
              onPressed: _decreaseFontSize, // Diminui o tamanho da fonte
            ),
          ],
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'TechAjuda',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 28,
              color: Color(0xFFD9D9D9),
            ),
          ),
        ),
        backgroundColor: Color(0xFF6C5481),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: [
            buildGridItem('Quando fazer um PIX?', Icons.payment, 20),
            buildGridItem('Como fazer uma senha?', Icons.lock_outline, 20),
            buildGridItem('Email estranho, e agora?', Icons.email_outlined, 20),
            buildGridItem('Cuidados ao comprar online', Icons.shopping_cart, 20),
            buildGridItem('Instalando aplicativos', Icons.download_outlined, 20),
            buildGridItem('Como não cair em golpes', Icons.warning_amber_outlined, 20),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Color(0xFF6C5481),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.directions_walk, size: 40, color: Colors.white),
              onPressed: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => HomePage()));
              },
            ),
            IconButton(
              icon: Icon(Icons.text_increase, size: 40, color: Colors.white),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildGridItem(String title, IconData icon, double fontSize) {
  return Container(
    decoration: BoxDecoration(
      color: Color(0xFF8A7194),
      borderRadius: BorderRadius.circular(12),
    ),
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 50, color: Color(0xFFD9D9D9)),
          SizedBox(height: 10),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFFD9D9D9),
              fontSize: fontSize, // Tamanho da fonte sendo usado
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    ),
  );
}
