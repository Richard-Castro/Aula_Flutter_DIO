import 'dart:async';
import 'package:flutter/material.dart';

class ListViewH extends StatefulWidget {
  const ListViewH({Key? key});

  @override
  State<ListViewH> createState() => _ListViewHState();
}

class _ListViewHState extends State<ListViewH> {
  String? currentTime;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
    currentTime = _getCurrentTime();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted) {
        // Verifica se o widget ainda está na árvore de widgets
        setState(() {
          currentTime = _getCurrentTime();
        });
      }
    });
  }

  String _getCurrentTime() {
    final now = DateTime.now();
    return '${_formatTimeValue(now.hour)}:${_formatTimeValue(now.minute)}:${_formatTimeValue(now.second)}';
  }

  String _formatTimeValue(int value) {
    return value < 10 ? '0$value' : value.toString();
  }

  @override
  void dispose() {
    _timer.cancel(); // Cancela o timer ao descartar o widget
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          leading: Image.asset(
            'assets/logo.png',
            height: 40,
          ),
          title: const Text('Usuario 2'),
          subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Seja bem vindo'),
              Text(currentTime ?? ''),
            ],
          ),
          trailing: PopupMenuButton<String>(
            onSelected: (menu) {},
            itemBuilder: (BuildContext bc) {
              return <PopupMenuEntry<String>>[
                const PopupMenuItem<String>(
                  value: 'opcao1',
                  child: Text('Opção 1'),
                ),
                const PopupMenuItem<String>(
                  value: 'opcao2',
                  child: Text('Opção 2'),
                ),
                const PopupMenuItem<String>(
                  value: 'opcao3',
                  child: Text('Opção 3'),
                ),
              ];
            },
          ),
        ),
        Image.asset('assets/logo.png'),
      ],
    );
  }
}
