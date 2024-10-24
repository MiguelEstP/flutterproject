import 'package:flutter/material.dart';

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

  void _increaseFontSize() {
    setState(() {
      _fontSize += 2; // Aumenta o tamanho da fonte
    });
  }

  void _decreaseFontSize() {
    setState(() {
      _fontSize = _fontSize > 10 ? _fontSize - 2 : _fontSize; // Diminui a fonte, mas não permite ficar muito pequena
    });
  }

  double _calculateIconSize(double fontSize) {
    // Ajusta o tamanho do ícone com base no tamanho da fonte
    if (fontSize > 22) {
      return 40; // Diminui o tamanho do ícone quando a fonte for muito grande
    } else {
      return 50; // Tamanho normal do ícone
    }
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
            buildGridItem('Quando fazer um PIX?', Icons.payment, _fontSize, context),
            buildGridItem('Como fazer uma senha?', Icons.lock_outline, _fontSize, context),
            buildGridItem('Email estranho, e agora?', Icons.email_outlined, _fontSize, context),
            buildGridItem('Cuidados ao comprar online', Icons.shopping_cart, _fontSize, context),
            buildGridItem('Instalando aplicativos', Icons.download_outlined, _fontSize, context),
            buildGridItem('Como não cair em golpes', Icons.warning_amber_outlined, _fontSize, context),
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

  Widget buildGridItem(String title, IconData icon, double fontSize, BuildContext context) {
    double iconSize = _calculateIconSize(fontSize); // Calcula o tamanho do ícone com base no tamanho da fonte
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(title: title, icon: Icons.child_friendly, fontSize: fontSize), // Muda para um ícone infantil
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
              Icon(icon, size: iconSize, color: Colors.white), // Aplica o tamanho dinâmico do ícone
              SizedBox(height: 10),
              Text(
                title,
                textAlign: TextAlign.center, // Centraliza o texto
                maxLines: 2, // Limita o número de linhas
                overflow: TextOverflow.ellipsis, // Adiciona "..." se o texto ultrapassar o limite
                style: TextStyle(color: Colors.white, fontSize: fontSize), // Aplica o tamanho dinâmico da fonte
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
  final IconData icon;
  final double fontSize;

  DetailScreen({required this.title, required this.icon, required this.fontSize});

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late double _fontSize;

  @override
  void initState() {
    super.initState();
    _fontSize = widget.fontSize; // Inicia o tamanho da fonte da segunda tela com o mesmo valor
  }

  void _increaseFontSize() {
    setState(() {
      _fontSize += 2; // Aumenta o tamanho da fonte
    });
  }

  void _decreaseFontSize() {
    setState(() {
      _fontSize = _fontSize > 10 ? _fontSize - 2 : _fontSize; // Diminui a fonte, mas não permite ficar muito pequena
    });
  }

  double _calculateIconSize(double fontSize) {
    // Ajusta o tamanho do ícone com base no tamanho da fonte
    if (fontSize > 22) {
      return 40; // Diminui o tamanho do ícone quando a fonte for muito grande
    } else {
      return 50; // Tamanho normal do ícone
    }
  }

  @override
  Widget build(BuildContext context) {
    double iconSize = _calculateIconSize(_fontSize);
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes'),
        backgroundColor: Color(0xFF6C5481),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(widget.icon, size: iconSize, color: Colors.white), // Ajusta o ícone dinamicamente para um ícone infantil
            SizedBox(height: 20),
            Text(
              widget.title,
              style: TextStyle(fontSize: _fontSize, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
              maxLines: 2, // Limita o número de linhas
              overflow: TextOverflow.ellipsis, // Adiciona "..." se o texto for muito longo
            ),
            SizedBox(height: 20),
            Text(
              'Conteúdo detalhado sobre "${widget.title}".',
              style: TextStyle(fontSize: _fontSize),
              textAlign: TextAlign.center,
              maxLines: 5, // Limita o número de linhas
              overflow: TextOverflow.ellipsis, // Adiciona "..." se o texto for muito longo
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
}
