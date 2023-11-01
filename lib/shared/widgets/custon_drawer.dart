import 'package:flutter/material.dart';
import 'package:trilhaapp/pages/configuracoes/configuracoes_hive_page.dart';
import 'package:trilhaapp/pages/dados_cadastrais/dados_cadastrais.dart';
import 'package:trilhaapp/pages/login_pages.dart';

class CustonDrawer extends StatelessWidget {
  const CustonDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              showModalBottomSheet(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  context: context,
                  builder: (BuildContext bc) {
                    return Wrap(
                      children: [
                        ListTile(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          title: const Text('Camera'),
                          leading: const Icon(Icons.camera),
                        ),
                        ListTile(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          title: const Text('Galeria'),
                          leading: const Icon(Icons.photo),
                        )
                      ],
                    );
                  });
            },
            child: UserAccountsDrawerHeader(
                decoration: const BoxDecoration(
                  color: Colors.orange,
                ),
                currentAccountPicture: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Image.asset('assets/logo.png')),
                accountName: const Text("Richard Castro"),
                accountEmail: const Text("email@email.com")),
          ),
          InkWell(
              child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  width: double.infinity,
                  child: const Row(
                    children: [
                      Icon(Icons.person),
                      SizedBox(width: 5),
                      Text("Dados cadastrais"),
                    ],
                  )),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DadosCadastraisPage()));
              }),
          const Divider(),
          const SizedBox(height: 10),
          InkWell(
              child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  width: double.infinity,
                  child: const Row(
                    children: [
                      Icon(Icons.info),
                      SizedBox(width: 5),
                      Text("Termos de uso e privacidade"),
                    ],
                  )),
              onTap: () {
                showModalBottomSheet(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    context: context,
                    builder: (BuildContext bc) {
                      return Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 12),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                const Text(
                                  "Termos de uso e privacidade",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Icon(Icons.close),
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                            const Text(
                              "Por outro lado, denunciamos com justa indignação e antipatia os homens que estão tão seduzidos e desmoralizados pelos encantos do prazer do momento, tão cegos pelo desejo, que não podem prever a dor e os problemas que estão fadados a seguir; e iguais a culpa pertence àqueles que falham em seu dever por fraqueza de vontade, o que é o mesmo que dizer por se encolherem diante do trabalho e da dor. Esses casos são perfeitamente simples e fáceis de distinguir.",
                              style: TextStyle(fontSize: 16),
                              textAlign: TextAlign.justify,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context); // Fecha o BottomSheet
                              },
                              child: Text('Sair'),
                            ),
                          ],
                        ),
                      );
                    });
              }),
          const Divider(),
          const SizedBox(height: 10),
          InkWell(
              child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  width: double.infinity,
                  child: const Row(
                    children: [
                      Icon(Icons.settings),
                      SizedBox(width: 5),
                      Text("Configurações"),
                    ],
                  )),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (bc) => const ConfiguracoesHivePage()));
              }),
          const Divider(),
          const SizedBox(
            height: 10,
          ),
          InkWell(
              child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  width: double.infinity,
                  child: const Row(
                    children: [
                      Icon(Icons.exit_to_app),
                      SizedBox(width: 5),
                      Text("Sair"),
                    ],
                  )),
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext bc) {
                      return AlertDialog(
                        alignment: Alignment.centerLeft,
                        elevation: 8,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        title: const Text(
                          "Meu App",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        content: const Wrap(
                          children: [
                            Text("Voce sairá do aplicativo"),
                            Text("Deseja realmente sair do aplicativo"),
                          ],
                        ),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text("Não")),
                          TextButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const LoginPage()));
                              },
                              child: const Text("Sim"))
                        ],
                      );
                    });
              }),
        ],
      ),
    );
  }
}
