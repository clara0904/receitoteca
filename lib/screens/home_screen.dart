import 'package:flutter/material.dart';
import 'package:receitoteca/models/receita.dart';
import 'package:receitoteca/repositories/repositorio_random.dart';
import 'package:receitoteca/screens/revenue_screen.dart';
import 'package:receitoteca/widgets/image_revenue.dart';
import 'package:receitoteca/widgets/random_revenue.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final AleatoriaRepositorio repository = AleatoriaRepositorio();
  Receita? receita;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    await repository.getReceita();
    setState(() {
      receita = repository.receita; 
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'RECEITOTECA',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w600,
              color: Colors.white
            ),
          ),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 4, 43, 77),
        ),
        body: receita == null
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Receita do dia ', style: TextStyle(fontSize: 24, color: Colors.white,
                    shadows: [
                      Shadow(
                        blurRadius: 10.0,
                        color: Colors.black,
                        offset: Offset(2, 2),
                      ),
                    ])
                    ),
                    TextButton(
                      onPressed: () { 
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ReceitaScreen(endpoint: receita!.meals!.first.idMeal!)
                          )
                        );
                      }, 
                      child: ImageRevenue(receita: receita)
                    ),
                    const SizedBox(height: 20,),
                    const SorteadorReceita()
                  ],
                ),
              ),
          ),
      ),
    );
  }
}