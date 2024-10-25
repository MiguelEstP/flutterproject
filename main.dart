import 'package:flutter/material.dart';

// O método main é o ponto de entrada do aplicativo.
void main() {
  runApp(MyApp());
}

// Classe principal do aplicativo, que define o tema e a página inicial.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: UFSCaducasApp(),
      theme: ThemeData(
        fontFamily: 'Roboto', // Define a fonte padrão do aplicativo.
      ),
    );
  }
}

// Definição do estado inicial do aplicativo UFSCaducasApp.
class UFSCaducasApp extends StatefulWidget {
  @override
  _UFSCaducasAppState createState() => _UFSCaducasAppState();
}

// Estado da página principal do aplicativo.
class _UFSCaducasAppState extends State<UFSCaducasApp> {
  double _fontSize = 16.0; // Tamanho inicial da fonte.
  bool flag = true; // Flag de controle para uma futura lógica.

  // Função que aumenta o tamanho da fonte.
  void _increaseFontSize() {
    setState(() {
      _fontSize += 2;
    });
  }

  // Função que diminui o tamanho da fonte, mas evita que fique muito pequena.
  void _decreaseFontSize() {
    setState(() {
      _fontSize = _fontSize > 10 ? _fontSize - 2 : _fontSize;
    });
  }

  // Função que ajusta o tamanho do ícone com base no tamanho da fonte.
  double _calculateIconSize(double fontSize) {
    return fontSize > 22 ? 40 : 50;
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
        backgroundColor: Color(0xFF6C5481), // Define a cor da AppBar.
        elevation: 0, // Remove a sombra da AppBar.
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2, // Define duas colunas para o GridView.
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: [
            // Cada um dos itens do GridView, com título, ícone e comportamento ao clicar.
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
        color: Color(0xFF6C5481), // Define a cor do BottomAppBar.
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.elderly, size: 40, color: Colors.white),
              onPressed: () {}, // Ação ao clicar no ícone.
            ),
            IconButton(
              icon: Icon(Icons.text_increase, size: 40, color: Colors.white),
              onPressed: _increaseFontSize, // Aumenta o texto.
            ),
            IconButton(
              icon: Icon(Icons.text_decrease, size: 40, color: Colors.white),
              onPressed: _decreaseFontSize, // Diminui o texto.
            ),
          ],
        ),
      ),
    );
  }

  // Função que cria cada item do grid com título, ícone e funcionalidade de navegação.
  Widget buildGridItem(String title, IconData icon, double fontSize,
      BuildContext context, int index) {
    double iconSize = _calculateIconSize(fontSize); // Define o tamanho do ícone.
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(
                title: title,
                idNumber: index,
                fontSize: fontSize), // Abre a tela de detalhes ao clicar.
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFF8A7194), // Cor de fundo do item.
          borderRadius: BorderRadius.circular(12), // Borda arredondada.
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
                textAlign: TextAlign.center, // Centraliza o texto.
                maxLines: 2, // Limita o texto a duas linhas.
                overflow: TextOverflow.ellipsis, // Adiciona "..." caso ultrapasse.
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

// Tela de detalhes para exibir informações mais completas.
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
    _fontSize = widget.fontSize; // Define o tamanho inicial da fonte da tela.
  }

  void _increaseFontSize() {
    setState(() {
      _fontSize += 2; // Aumenta o tamanho da fonte.
    });
  }

  void _decreaseFontSize() {
    setState(() {
      _fontSize = _fontSize > 10 ? _fontSize - 2 : _fontSize;
    });
  }

  double _calculateIconSize(double fontSize) {
    return fontSize > 22 ? 40 : 50; // Ajusta o tamanho do ícone.
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
              detalhe[widget.idNumber], // Exibe o texto correspondente ao item.
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
              onPressed: _increaseFontSize, // Aumenta o texto.
            ),
            IconButton(
              icon: Icon(Icons.text_decrease, size: 40, color: Colors.white),
              onPressed: _decreaseFontSize, // Diminui o texto.
            ),
          ],
        ),
      ),
    );
  }
}

// Lista com o conteúdo dos detalhes de cada item.
List<String> detalhe = [
  ' O Pix é uma forma rápida e prática de transferir dinheiro...',
  ' Criar uma boa senha exige atenção...',
  ' Ao usar a internet, é comum receber e-mails de remetentes desconhecidos...',
  ' Fazer compras pela internet exige muito cuidado...',
  ' Atualmente, existem muitos programas (ou "aplicativos") disponíveis...',
  'Ao receber chamadas: verifique se o número é desconhecido...',
];
