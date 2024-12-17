import 'package:flutter/material.dart';
import 'package:receitoteca/repositories/repositorio_receitas.dart';
import 'package:receitoteca/models/lista_receitas.dart';
import 'package:receitoteca/screens/revenue_screen.dart';
import 'package:receitoteca/widgets/card_list_revenue.dart';

class ListRevenueScreen extends StatefulWidget {
  final String endpoint;
  const ListRevenueScreen({super.key, required this.endpoint});

  @override
  State<ListRevenueScreen> createState() => _ListRevenueScreenState();
}

class _ListRevenueScreenState extends State<ListRevenueScreen> {
  late final RepositorioReceitas repositoryReceitas;
  List<Meals> receitas = [];

  @override
  void initState() {
    super.initState();
    repositoryReceitas = RepositorioReceitas(widget.endpoint);
    fetchReceitas();
  }

 void fetchReceitas() async {
  List<Meals> fetchedReceitas = await repositoryReceitas.getReceitas();
  setState(() {
    receitas = fetchedReceitas;
  });
}

@override
Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.endpoint,),
        ),
        body: receitas.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: receitas.length,
                itemBuilder: (context, index) {
                  final meal = receitas[index];
                  return TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>  ReceitaScreen(endpoint: meal.idMeal ?? '',)
                        )
                      );
                    },
                    child: CardListaReceitas(meal: meal),
                  );
                },
              ),
      ),
    );
  }
}