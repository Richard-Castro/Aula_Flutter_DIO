import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConfiguracoesSharedPage extends StatefulWidget {
  const ConfiguracoesSharedPage({super.key});

  @override
  State<ConfiguracoesSharedPage> createState() =>
      _ConfiguracoesSharedPageState();
}

class _ConfiguracoesSharedPageState extends State<ConfiguracoesSharedPage> {
  late SharedPreferences storage;

  TextEditingController nomeUsuarioController = TextEditingController();
  TextEditingController alturaController = TextEditingController();

  String? nomeUsuario;
  double? altura;
  bool receberNotificacoes = false;
  bool temaEscuro = false;

  final CHAVE_NOME_USUARIO = "CHAVE_NOME_USUARIO";
  final CHAVE_ALTURA = "CHAVE_ALTURA";
  final CHAVE_RECEBER_NOTIFICACOES = "CHAVE_RECEBER_NOTIFICACOES";
  final CHAVE_TEMA_ESCURO = "CHAVE_TEMA_ESCURO";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    carregarDados();
  }

  carregarDados() async {
    storage = await SharedPreferences.getInstance();
    setState(() {
      nomeUsuarioController.text = storage.getString(CHAVE_NOME_USUARIO) ?? "";
      alturaController.text = (storage.getDouble(CHAVE_ALTURA) ?? 0).toString();
      receberNotificacoes =
          storage.getBool(CHAVE_RECEBER_NOTIFICACOES) ?? false;
      temaEscuro = storage.getBool(CHAVE_TEMA_ESCURO) ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("Configurações")),
        body: Container(
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                    decoration: InputDecoration(hintText: "Nome usuário"),
                    controller: nomeUsuarioController),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(hintText: "Altura"),
                    controller: alturaController),
              ),
              SwitchListTile(
                title: Text("Receber Notificações"),
                onChanged: (bool value) {
                  setState(() {
                    receberNotificacoes = value;
                  });
                },
                value: receberNotificacoes,
              ),
              SwitchListTile(
                  title: Text("Tema escuro"),
                  value: temaEscuro,
                  onChanged: (bool value) {
                    setState(() {
                      temaEscuro = value;
                    });
                  }),
              const SizedBox(
                height: 16,
              ),
              TextButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8))),
                      backgroundColor: MaterialStateProperty.all(
                          Color.fromARGB(255, 9, 23, 228))),
                  onPressed: () async {
                    FocusManager.instance.primaryFocus
                        ?.unfocus(); // fecha o teclado antes de fechar a tela
                    try {
                      await storage.setDouble(
                          CHAVE_ALTURA, double.parse(alturaController.text));
                    } catch (e) {
                      // ignore: use_build_context_synchronously
                      showDialog(
                          context: context,
                          builder: (_) {
                            return AlertDialog(
                              title: Text("Meu App"),
                              content: Text("Favor informar uma altura válida"),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text("OK"))
                              ],
                            );
                          });
                      return;
                    }
                    await storage.setString(
                        CHAVE_NOME_USUARIO, nomeUsuarioController.text);

                    await storage.setBool(
                        CHAVE_RECEBER_NOTIFICACOES, receberNotificacoes);
                    await storage.setBool(CHAVE_TEMA_ESCURO, temaEscuro);
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Salvar",
                    style: TextStyle(color: Colors.white),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
