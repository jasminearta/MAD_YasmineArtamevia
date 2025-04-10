// lib/widgets/grid_item.dart

import 'package:flutter/material.dart';

class GridItem extends StatelessWidget {
  final String title;

  const GridItem({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blue, // Ganti warna sesuai keinginan
      elevation: 4,
      child: Center( // Menjaga teks berada di tengah
        child: Text(
          title,
          style: TextStyle(
            fontSize: 20, // Ukuran font
            fontWeight: FontWeight.bold, // Judul tebal
            color: Colors.white, // Warna teks putih untuk kontras
          ),
        ),
      ),
    );
  }
}
