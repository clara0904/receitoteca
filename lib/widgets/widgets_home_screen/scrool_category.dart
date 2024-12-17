import 'package:flutter/material.dart';
import 'package:receitoteca/models/categorias.dart';
import 'package:receitoteca/widgets/widgets_home_screen/categoria_button.dart';
import 'package:receitoteca/widgets/theme_title.dart';

class ScroolCategory extends StatelessWidget {
  final List<Categories> categorias;
  const ScroolCategory({super.key, required this.categorias});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TemaTitulo(titulo: 'Categorias: ', size: 22),
          categorias.isNotEmpty
            ? Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: CategoriaButton(categorias: categorias,),
            )
            : const Center(
                child: CircularProgressIndicator(),
              ),
        ],
      ),
    );
  }
}