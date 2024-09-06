import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: IMCCalculatorPage(),
    );
  }
}

class IMCCalculatorPage extends StatefulWidget {
  @override
  _IMCCalculatorPageState createState() => _IMCCalculatorPageState();
}

class _IMCCalculatorPageState extends State<IMCCalculatorPage> {
  String peso = '';
  String altura = '';
  bool isPesoSelected = true; // Definir se estamos inserindo no campo peso ou altura

  // Função para adicionar números aos campos
  void addNumber(String number) {
    setState(() {
      if (isPesoSelected) {
        peso += number;
      } else {
        altura += number;
      }
    });
  }

  // Função para alternar entre os campos de peso e altura
  void toggleField() {
    setState(() {
      isPesoSelected = !isPesoSelected;
    });
  }

  // Função para limpar o valor inserido
  void clearFields() {
    setState(() {
      peso = '';
      altura = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    // Obtenção do tamanho da tela para responsividade
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.grey[200], // Cor de fundo da página
      appBar: AppBar(
        title: Text('Calculadora IMC'),
        backgroundColor: Colors.purple, // Cor de fundo do AppBar
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(screenWidth * 0.04), // Espaçamento proporcional ao tamanho da tela
            child: Image.network(
              'https://c.files.bbci.co.uk/A0D9/production/_104677114_prmo_imc-nc.jpg', // URL da imagem.
              height: screenHeight * 0.2, // Tamanho da imagem proporcional à altura da tela
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Peso',
                hintText: 'Digite o Peso',
              ),
              controller: TextEditingController(text: peso),
              readOnly: true, // Campo só pode ser modificado pelos botões
              onTap: () => setState(() {
                isPesoSelected = true;
              }), // Seleciona o campo de peso
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04, vertical: screenWidth * 0.02),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Altura',
                hintText: 'Digite a Altura',
              ),
              controller: TextEditingController(text: altura),
              readOnly: true, // Campo só pode ser modificado pelos botões
              onTap: () => setState(() {
                isPesoSelected = false;
              }), // Seleciona o campo de altura
            ),
          ),
          Padding(
            padding: EdgeInsets.all(screenWidth * 0.04),
            child: Text(
              'IMC: ', // Exibição do valor de IMC, aqui ainda está vazio
              style: TextStyle(fontSize: screenHeight * 0.03), // Tamanho da fonte proporcional à altura da tela
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 3, // 3 colunas para o teclado numérico
              padding: EdgeInsets.all(screenWidth * 0.04),
              mainAxisSpacing: screenWidth * 0.02, // Espaçamento entre as linhas
              crossAxisSpacing: screenWidth * 0.02, // Espaçamento entre as colunas
              children: [
                for (var i = 1; i <= 9; i++)
                  ElevatedButton(
                    onPressed: () {
                      addNumber('$i');
                    },
                    child: Text('$i'),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white, backgroundColor: Colors.purple, // Cor do texto
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8), // Borda arredondada
                      ),
                      padding: EdgeInsets.all(screenWidth * 0.05), // Tamanho do botão proporcional à tela
                      textStyle: TextStyle(
                        fontSize: screenHeight * 0.03,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ElevatedButton(
                  onPressed: () {
                    addNumber('.');
                  },
                  child: Text('.'),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white, backgroundColor: Colors.purple,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: EdgeInsets.all(screenWidth * 0.05),
                    textStyle: TextStyle(
                      fontSize: screenHeight * 0.03,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    addNumber('0');
                  },
                  child: Text('0'),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white, backgroundColor: Colors.purple,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: EdgeInsets.all(screenWidth * 0.05),
                    textStyle: TextStyle(
                      fontSize: screenHeight * 0.03,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    toggleField(); // Alterna entre os campos de peso e altura
                  },
                  child: Text('ENTER'),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white, backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: EdgeInsets.all(screenWidth * 0.05),
                    textStyle: TextStyle(
                      fontSize: screenHeight * 0.03,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    clearFields(); // Limpa os campos
                  },
                  child: Text('CLEAR'),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white, backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: EdgeInsets.all(screenWidth * 0.05),
                    textStyle: TextStyle(
                      fontSize: screenHeight * 0.03,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
