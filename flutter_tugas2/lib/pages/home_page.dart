// lib/pages/home_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_tugas2/pages/form_page.dart'; // Impor FormPage

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Daftar untuk menyimpan produk
  List<Map<String, dynamic>> _products = [];

  // Fungsi untuk menambahkan produk
  void _addProduct(Map<String, dynamic> product) {
    setState(() {
      _products.add(product);
    });
  }

  @override
  Widget build(BuildContext context) {
    // Daftar warna pastel
    final List<Color> pastelColors = [
      Color(0xFFB2EBF2), // Pastel Blue
      Color(0xFFFFCDD2), // Pastel Pink
      Color(0xFFE1BEE7), // Pastel Purple
      Color(0xFFFFF9C4), // Pastel Yellow
      Color(0xFFD1C4E9), // Pastel Lavender
      Color(0xFFE0F7FA), // Pastel Teal
      Color(0xFFB3E5FC), // Pastel Light Blue
      Color(0xFFFFEBEE), // Pastel Light Pink
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Product List'),
      ),
      body: _products.isEmpty
          ? const Center(child: Text('No products added yet.'))
          : GridView.builder(
              padding: const EdgeInsets.all(10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: _products.length,
              itemBuilder: (context, index) {
                final product = _products[index];
                return Card(
                  color: pastelColors[index % pastelColors.length],
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(
                          product['image'], // Tampilkan gambar produk
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          product['name'],
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          '\$${product['price']}',
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          product['description'],
                          style: const TextStyle(fontSize: 14, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // Navigasi ke halaman form dan mengambil hasil input
          final result = await Navigator.push<Map<String, dynamic>>(
            context,
            MaterialPageRoute(builder: (context) => const FormPage()),
          );
          if (result != null) {
            _addProduct(result); // Tambahkan produk ke daftar
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
