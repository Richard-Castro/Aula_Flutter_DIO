import 'package:flutter/material.dart';

import 'package:trilhaapp/service/gerador_numero_aleatorio_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => __HomePageState();
}

class __HomePageState extends State<HomePage> {
  var numeroGerado = 0;
  var quantidadeCliques = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Meu App",
        ),
      ),
      body: Container(
        width: double.infinity, //Usa o tamanho da dela inteiro
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment
              .start, //spaceAround (separa os itens) // spaceBetween, spaceEvenly
          children: [
            Container(
                width: 100,
                height: 100,
                color: Colors.cyan,
                child: Text("Ações do usuário")),
            SizedBox(
                width: 100,
                height: 100,
                child: Container(
                    child: Text("Foi Clicado $quantidadeCliques vezes"))),
            Container(
                color: Colors.amber,
                child: Text("O número gerado foi: $numeroGerado")),
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween, //só funciona horizontalmente
              children: [
                Expanded(
                    flex: 1,
                    child: Container(color: Colors.green, child: Text("10"))),
                Expanded(
                    flex: 2,
                    child: Container(color: Colors.red, child: Text("20"))),
                Expanded(
                    flex: 3,
                    child: Container(color: Colors.blue, child: Text("30"))),
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          setState(() {
            quantidadeCliques = quantidadeCliques + 1;
            numeroGerado =
                GeradorNumeroAleatorioService.gerarNumeroAleatorio(10);
          });
        },
      ),
    );
  }
}
