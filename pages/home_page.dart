import 'dart:math';
import 'package:flutter/material.dart';
import 'package:test_flutter/controllers/app_theme.dart';
import 'package:test_flutter/pages/config_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scrollControllerScreen = ScrollController();
  final TextEditingController altura = TextEditingController();
  final TextEditingController peso = TextEditingController();
  double imc = 0;
  String textImc = '';

  void calcIMC(){
    setState(() {
      try {
        imc = double.parse(peso.text)/(pow(double.parse(altura.text),2));
        if(imc.toInt() < 18){
          textImc = 'Você está magro(a)!\n\nPercebo que você está em boa forma e aparenta estar magro(a), o que pode ser uma conquista para muitas pessoas. No entanto, se você tiver alguma preocupação sobre sua saúde, é sempre melhor consultar um médico para ter certeza de que está tudo bem. É importante lembrar que a saúde vem em primeiro lugar e que cada corpo é único, portanto, o que pode ser saudável para uma pessoa pode não ser para outra. Em caso de dúvidas ou preocupações, é melhor buscar orientação médica.';
        }
        else if(imc.toInt() >= 18 && imc.toInt() <= 25){
          textImc = 'Você está saudável!\n\nBaseado em minha observação, posso afirmar que você parece estar em boa saúde. É importante cuidar do corpo e da mente para se manter saudável, e parece que você está fazendo um bom trabalho nisso. Continue a seguir uma rotina saudável e equilibrada, incluindo exercícios regulares, alimentação balanceada e cuidados com a saúde mental. Parabéns por estar saudável e espero que você continue assim!';
        }
        else {
          textImc = 'Você está gordo(a)!\n\nObservando seu IMC, percebo que você pode estar acima do peso. Se isso estiver te causando algum desconforto ou preocupação, pode ser uma boa ideia consultar um médico para avaliar sua saúde e discutir possíveis mudanças no estilo de vida que possam ser benéficas para você. É importante lembrar que a saúde vem em primeiro lugar e que cada corpo é único, portanto, o que pode ser saudável para uma pessoa pode não ser para outra. Se você estiver preocupado com seu peso, buscar ajuda profissional é sempre uma opção viável e recomendada.';
        }
      }
      on FormatException {
        textImc = 'Digite nos campos obrigatórios números válidos!';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('IMC'),
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context,
            MaterialPageRoute(builder: (context) => ConfigPage()));
          }, icon: const Icon(Icons.settings))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          calcIMC();
        },
        child: const Icon(Icons.man_outlined),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Wrap(
              direction: Axis.horizontal,
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 8,
              runSpacing: 8,
              children: [
                Container(
                  height: MediaQuery.of(context).size.width < 500 ?
                  300 : MediaQuery.of(context).size.height - 75,
                  width: MediaQuery.of(context).size.width < 500 ?
                  500 : (MediaQuery.of(context).size.width/2)-30,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surfaceVariant,
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child:  Padding(
                    padding: const EdgeInsets.only(top: 10, right: 8, left: 8),
                    child: ListView(
                      controller: scrollControllerScreen,
                      children: [
                        Column(
                          children: [
                            TextField(
                              controller: altura,
                              keyboardType: TextInputType.number,
                              style: const TextStyle(
                                fontSize: 20
                              ),
                              decoration: InputDecoration(
                                label: const Text('Altura'),
                                disabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Theme.of(context).colorScheme.shadow
                                  )
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20)
                                )
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextField(
                              controller: peso,
                              keyboardType: TextInputType.number,
                              style: const TextStyle(
                                fontSize: 20
                              ),
                              decoration: InputDecoration(
                                label: const Text('Peso'),
                                disabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Theme.of(context).colorScheme.shadow
                                  )
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20)
                                )
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Text('Seu IMC é:',
                            style: TextStyle(
                              fontSize: 25,
                              color: Theme.of(context).colorScheme.onSurface
                            ),),
                            Text('${imc.toStringAsFixed(1)}',
                            style: TextStyle(
                              fontSize: 30,
                              color: Theme.of(context).colorScheme.onSurface
                            ),)
                          ],
                        ),
                      ],
                    )
                  ),
                ),
                Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.width < 500 ?
                      300 : MediaQuery.of(context).size.height - 75,
                      width: MediaQuery.of(context).size.width < 500 ?
                      500 : MediaQuery.of(context).size.width/2,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondary,
                        borderRadius: BorderRadius.circular(20)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10, right: 8, left: 8, bottom: 10),
                        child: ListView(
                          controller: scrollControllerScreen,
                          children: [
                            Column(
                              children: [
                                Text(textImc,
                                style: TextStyle(
                                  fontSize: MediaQuery.of(context).size.width < 500 ?
                                  20 : 25,
                                  color: Theme.of(context).colorScheme.surfaceVariant
                                ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      )
    );
  }
}