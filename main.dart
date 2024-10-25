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
  bool flag = true;

  void _increaseFontSize() {
    setState(() {
      _fontSize += 2; // Aumenta o tamanho da fonte
    });
  }

  void _decreaseFontSize() {
    setState(() {
      _fontSize = _fontSize > 10
          ? _fontSize - 2
          : _fontSize; // Diminui a fonte, mas não permite ficar muito pequena
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
            'ClickSábio',
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
    double iconSize = _calculateIconSize(
        fontSize); // Calcula o tamanho do ícone com base no tamanho da fonte
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(
                title: title,
                idNumber: index,
                fontSize: fontSize), // Muda para um ícone infantil
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
              // Aplica o tamanho dinâmico do ícone
              SizedBox(height: 10),
              Text(
                title,
                textAlign: TextAlign.center,
                // Centraliza o texto
                maxLines: 2,
                // Limita o número de linhas
                overflow: TextOverflow.ellipsis,
                // Adiciona "..." se o texto ultrapassar o limite
                style: TextStyle(
                    color: Colors.white,
                    fontSize: fontSize,
                    fontWeight:
                        FontWeight.bold), // Aplica o tamanho dinâmico da fonte
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
    _fontSize = widget
        .fontSize; // Inicia o tamanho da fonte da segunda tela com o mesmo valor
  }

  void _increaseFontSize() {
    setState(() {
      _fontSize += 2; // Aumenta o tamanho da fonte
    });
  }

  void _decreaseFontSize() {
    setState(() {
      _fontSize = _fontSize > 10
          ? _fontSize - 2
          : _fontSize; // Diminui a fonte, mas não permite ficar muito pequena
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

List<String> detalhe = [
  ' O Pix é uma forma rápida e prática de transferir dinheiro. Ele pode ser usado em várias situações do dia a dia. Muitas lojas, tanto físicas quanto online, aceitam Pix como forma de pagamento. Ele é instantâneo, e o dinheiro cai na conta do vendedor na hora, o que facilita bastante. Se você precisa enviar dinheiro para um amigo, familiar ou alguém próximo, o Pix é uma ótima opção. Ele funciona a qualquer hora do dia, inclusive finais de semana e feriados, e o valor chega na conta do destinatário em segundos.',
  ' Criar uma boa senha exige atenção. Ela precisa ser fácil de lembrar, mas também segura o suficiente para proteger suas contas de pessoas mal-intencionadas. Para ajudar, reunimos algumas dicas simples que podem fortalecer suas senhas.\n Uma boa prática é usar uma mistura de letras e números. Tente combinar letras maiúsculas (como "A", "B", "C") com minúsculas (como "a", "b", "c"). Isso torna sua senha mais difícil de ser adivinhada. Outra dica importante é incluir símbolos especiais, como (*, #, @), que ajudam a aumentar a segurança. Esses símbolos fazem com que sua senha fique muito mais difícil de ser descoberta por programas ou pessoas tentando invadir suas contas.\n É importante lembrar de evitar senhas muito óbvias, como o seu nome ou datas fáceis de adivinhar, como seu aniversário. Senhas fortes são aquelas que misturam diferentes tipos de caracteres e têm mais de 8 dígitos.',
  ' Ao usar a internet, é comum receber e-mails de remetentes desconhecidos. Se isso acontecer, evite abrir a mensagem, principalmente se ela vier com ofertas muito atraentes ou pedidos de informações pessoais, como senhas ou números de cartão. Nunca clique em links ou baixe anexos de e-mails que você não reconhece, pois eles podem conter vírus. Além disso, verifique o endereço do remetente com atenção, já que golpistas costumam se passar por empresas conhecidas. Se o e-mail parecer urgente ou pedir uma ação imediata, desconfie. Caso tenha dúvidas, peça ajuda a um familiar ou amigo antes de tomar qualquer atitude. Se identificar um e-mail suspeito, marque como "spam" para evitar problemas no futuro.',
  ' Fazer compras pela internet exige muito cuidado, pois é importante ter certeza de que a loja onde você está comprando é confiável. Hoje em dia, há muitos sites que fingem ser lojas, mas na verdade estão tentando enganar as pessoas. Esses sites vendem produtos que nunca são entregues, e os mais vulneráveis podem ser os principais alvos.\n Por isso, nossa recomendação é que você sempre verifique bem a loja antes de fazer qualquer compra. Veja as opiniões de outras pessoas sobre os produtos e a loja, procure saber se é uma empresa conhecida, ou compre em lugares que algum amigo ou familiar já tenha usado e aprovado. Seguindo essas dicas, você pode evitar cair nesses golpes mal-intencionados.',
  ' Atualmente, existem muitos programas (ou "aplicativos") disponíveis na internet, cada um com diferentes utilidades para facilitar o nosso dia a dia. No entanto, também há pessoas com más intenções que podem tentar enganar quem tem menos experiência com o uso da internet, para obter informações pessoais do seu celular.\n Por isso, recomendamos que você instale apenas aplicativos das lojas oficiais, como a Play Store (para celulares Android) ou a App Store (para iPhones). Outra dica importante é sempre conferir as opiniões de outros usuários sobre o aplicativo: veja quantas pessoas já avaliaram e se ficaram satisfeitas com ele. Isso ajuda a garantir que o aplicativo seja seguro e evita problemas.',
  'Ao receber chamadas: verifique se o número é desconhecido, se não, tente ver se quem está te ligando é realmente quem diz ser.\n\nEmails suspeitos: verifique nossa seção no aplicativo sobre emails estranhos!'
];
