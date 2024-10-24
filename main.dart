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

class HomePage extends StatelessWidget {
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
            buildGridItem('Quando fazer um PIX?', Icons.payment),
            buildGridItem('Como fazer uma senha?', Icons.lock_outline),
            buildGridItem('Email estranho, e agora?', Icons.email_outlined),
            buildGridItem('Cuidados ao comprar online', Icons.shopping_cart),
            buildGridItem('Instalando aplicativos', Icons.download_outlined),
            buildGridItem('Como não cair em golpes', Icons.warning_amber_outlined),
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
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.text_increase, size: 40, color: Colors.white),
              onPressed: () {

              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildGridItem(String title, IconData icon) {
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
              style: TextStyle(color: Color(0xFFD9D9D9), fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
