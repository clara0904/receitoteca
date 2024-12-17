import 'package:flutter/material.dart';
import 'package:receitoteca/models/categorias.dart';
import 'package:receitoteca/screens/list_revenue_screen.dart';
import 'package:receitoteca/theme/colors.dart';

class CategoriaButton extends StatelessWidget {
  final List<Categories> categorias;

  const CategoriaButton({super.key, required this.categorias});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Wrap(
        spacing: 10.0, 
        children: categorias.map((categoria) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ListRevenueScreen(endpoint: categoria.strCategory ?? ''),
                ),
              );
            },
            child: Chip(
              backgroundColor: ColorsApp.backgroundVerde,
              padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 2.5),
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: ColorsApp.corFonteTerciaria, 
                  width: 1.0,                
                ),
                borderRadius: BorderRadius.circular(10.0), 
              ),
              label: Column(
                children: [
                  Image.network(
                    categoria.strCategoryThumb ?? '', 
                    width: 64, 
                    height: 64, 
                    fit: BoxFit.contain,
                  ), 
                  Text(
                    categoria.strCategory ?? '', 
                    style: TextStyle(
                      color: ColorsApp.corFonteTerciaria,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
