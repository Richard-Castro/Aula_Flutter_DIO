import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trilhaapp/model/configuracoes_model.dart';
import 'package:trilhaapp/repositories/configuracoes_repository.dart';

class ConfiguracoesHivePage extends StatefulWidget {
  const ConfiguracoesHivePage({super.key});

  @override
  State<ConfiguracoesHivePage> createState() => _ConfiguracoesHivePageState();
}

class _ConfiguracoesHivePageState extends State<ConfiguracoesHivePage> {
  late ConfiguracoesRepository configuracoesRepository;
  var configuracoesModel = ConfiguracoesModel.vazio();

  TextEditingController nomeUsuarioController = TextEditingController();
  TextEditingController alturaController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    carregarDados();
  }

  carregarDados() async {
    configuracoesRepository = await ConfiguracoesRepository.carregar();
    configuracoesModel = configuracoesRepository.obterDados();
    nomeUsuarioController.text = configuracoesModel.nomeUsuario;
    alturaController.text = configuracoesModel.altura.toString();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("Configurações Hive")),
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
                    configuracoesModel.receberNotificacoes = value;
                  });
                },
                value: configuracoesModel.receberNotificacoes,
              ),
              SwitchListTile(
                  title: Text("Tema escuro"),
                  value: configuracoesModel.temaEscuro,
                  onChanged: (bool value) {
                    setState(() {
                      configuracoesModel.temaEscuro = value;
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
                      configuracoesModel.altura =
                          double.parse(alturaController.text);
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
                    configuracoesModel.nomeUsuario = nomeUsuarioController.text;
                    configuracoesRepository.salvar(configuracoesModel);
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
