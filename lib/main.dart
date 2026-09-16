import 'package:flutter/material.dart';
import 'package:flutter_application_1/telas/cursos_tela.dart';
import 'package:flutter_application_1/telas/favoritos_tela.dart';
import 'package:flutter_application_1/telas/inicio_tela.dart';
import 'package:flutter_application_1/telas/perfil_tela.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int indice = 0;

  final telas = const [
    InicioTela(),
    CursosTela(),
    PerfilTela(),
    FavoritosTela(),
  ];

  final titulos = const [
    'Início',
    'Meus cursos',
    'Meu perfil',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titulos[indice]),
      ),
      body: Center(
        child: telas[indice],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: indice,
        onDestinationSelected: (valor) {
          setState(() {
            indice = valor;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home),
            label: 'Início',
          ),
          NavigationDestination(
            icon: Icon(Icons.school_outlined),
            label: 'Cursos',
          ),
          NavigationDestination(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }
}

