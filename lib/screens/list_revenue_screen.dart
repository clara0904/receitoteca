import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:receitoteca/models/provider/lista_receitas_provider.dart';
import 'package:receitoteca/screens/revenue_screen.dart';
import 'package:receitoteca/widgets/widgets_list_revenue_screen/card_list_revenue.dart';

class ListRevenueScreen extends StatefulWidget {
  final String endpoint;
  const ListRevenueScreen({super.key, required this.endpoint});

  @override
  State<ListRevenueScreen> createState() => _ListRevenueScreenState();
}

class _ListRevenueScreenState extends State<ListRevenueScreen> {

  @override
  void initState() {
    super.initState();
    fetchReceitas();
  }

  void fetchReceitas() {
    final provider = Provider.of<ListaReceitasProvider>(context, listen: false);
    provider.fetchReceitas(widget.endpoint);
    provider.receitas.clear(); 
  }

@override
Widget build(BuildContext context) {
  final receitasProvider = Provider.of<ListaReceitasProvider>(context);
  final receitas = receitasProvider.receitas;

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