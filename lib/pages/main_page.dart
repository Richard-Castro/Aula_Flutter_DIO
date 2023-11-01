import 'package:flutter/material.dart';
import 'package:trilhaapp/pages/configuracoes/configuracoes_hive_page.dart';
import 'package:trilhaapp/pages/configuracoes/configuracoes_shared_preferences_page.dart';
import 'package:trilhaapp/pages/dados_cadastrais/dados_cadastrais.dart';
import 'package:trilhaapp/pages/card_page.dart';
import 'package:trilhaapp/pages/list._view_horizontal.dart';
import 'package:trilhaapp/pages/pagina2.dart';
import 'package:trilhaapp/pages/list_view_h.dart';
import 'package:trilhaapp/pages/tarefa_page.dart';
import 'package:trilhaapp/shared/widgets/custon_drawer.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  PageController controller = PageController(initialPage: 0);
  int posicaoPagina = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text("Main Page")),
        drawer: CustonDrawer(),
        body: Column(
          children: [
            Expanded(
              child: PageView(
                controller: controller,
                onPageChanged: (value) {
                  setState(() {
                    posicaoPagina = value;
                  });
                },
                children: const [
                  CardPage(),
                  Pagina2Page(),
                  ListViewH(),
                  ListViewHorizontal(),
                  TarefaPage(),
                ],
              ),
            ),
            BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                onTap: (value) {
                  controller.jumpToPage(value);
                },
                currentIndex: posicaoPagina,
                items: const [
                  BottomNavigationBarItem(
                      label: "Home", icon: Icon(Icons.home)),
                  BottomNavigationBarItem(
                      label: "Adicionar", icon: Icon(Icons.add)),
                  BottomNavigationBarItem(
                      label: "Usuarios", icon: Icon(Icons.person)),
                  BottomNavigationBarItem(
                      label: "Galeria", icon: Icon(Icons.image)),
                  BottomNavigationBarItem(
                      label: "Concluidos", icon: Icon(Icons.list)),
                ])
          ],
        ),
      ),
    );
  }
}
