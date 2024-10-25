import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: UFSCaducasApp(),
      theme: ThemeData(
        fontFamily: 'Roboto',
      ),
    );
  }
}

class UFSCaducasApp extends StatefulWidget {
  @override
  _UFSCaducasAppState createState() => _UFSCaducasAppState();
}

class _UFSCaducasAppState extends State<UFSCaducasApp> {
  double _fontSize = 16.0; // Tamanho inicial da fonte

  @override
  void initState() {
    super.initState();
    _loadFontSize(); // Carrega o tamanho da fonte ao iniciar o app
  }

  Future<void> _loadFontSize() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _fontSize = prefs.getDouble('fontSize') ?? 16.0;
    });
  }

  Future<void> _saveFontSize() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setDouble('fontSize', _fontSize);
  }

  void _increaseFontSize() {
    setState(() {
      _fontSize += 2;
    });
    _saveFontSize();
  }

  void _decreaseFontSize() {
    setState(() {
      _fontSize = _fontSize > 10 ? _fontSize - 2 : _fontSize;
    });
    _saveFontSize();
  }

  double _calculateIconSize(double fontSize) {
    if (fontSize > 22) {
      return 40;
    } else {
      return 50;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'BengalApp',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 28,
              color: Colors.white,
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
            buildGridItem(
                'Quando fazer um PIX?', Icons.payment, _fontSize, context, 0),
            buildGridItem('Como fazer uma senha?', Icons.lock_outline,
                _fontSize, context, 1),
            buildGridItem('Email estranho, e agora?', Icons.email_outlined,
                _fontSize, context, 2),
            buildGridItem('Cuidados ao comprar online', Icons.shopping_cart,
                _fontSize, context, 3),
            buildGridItem('Instalando aplicativos', Icons.download_outlined,
                _fontSize, context, 4),
            buildGridItem('Como não cair em golpes',
                Icons.warning_amber_outlined, _fontSize, context, 5),
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
              onPressed: _increaseFontSize, // Aumenta o texto
            ),
            IconButton(
              icon: Icon(Icons.text_decrease, size: 40, color: Colors.white),
              onPressed: _decreaseFontSize, // Diminui o texto
            ),
          ],
        ),
      ),
    );
  }

  Widget buildGridItem(String title, IconData icon, double fontSize,
      BuildContext context, int index) {
    double iconSize = _calculateIconSize(fontSize);
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(
                title: title, idNumber: index, fontSize: fontSize),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFF8A7194),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: iconSize, color: Colors.white),
              SizedBox(height: 10),
              Text(
                title,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: fontSize,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DetailScreen extends StatefulWidget {
  final String title;
  final double fontSize;
  final int idNumber;

  DetailScreen(
      {required this.title, required this.fontSize, required this.idNumber});

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late double _fontSize;

  @override
  void initState() {
    super.initState();
    _fontSize = widget.fontSize;
  }

  void _increaseFontSize() {
    setState(() {
      _fontSize += 2;
    });
  }

  void _decreaseFontSize() {
    setState(() {
      _fontSize = _fontSize > 10 ? _fontSize - 2 : _fontSize;
    });
  }

  double _calculateIconSize(double fontSize) {
    if (fontSize > 22) {
      return 40;
    } else {
      return 50;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(
              color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
        ),
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color(0xFF6C5481),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text(
              detalhe[widget.idNumber],
              style: TextStyle(fontSize: _fontSize),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Color(0xFF6C5481),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.text_increase, size: 40, color: Colors.white),
              onPressed: _increaseFontSize,
            ),
            IconButton(
              icon: Icon(Icons.text_decrease, size: 40, color: Colors.white),
              onPressed: _decreaseFontSize,
            ),
          ],
        ),
      ),
    );
  }
}

List<String> detalhe = [
  'O Pix é uma forma rápida e prática de transferir dinheiro...',
  'Criar uma boa senha exige atenção...',
  'Ao usar a internet, é comum receber e-mails...',
  'Fazer compras pela internet exige muito cuidado...',
  'Atualmente, existem muitos programas (ou "aplicativos")...',
  'Ao receber chamadas: verifique se o número é desconhecido...',
];
