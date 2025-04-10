import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProductScreen()
    );
  }
}

class ListScreen extends StatelessWidget{
  final List<String> items = ["Laptop", "SmartPhone", "Table", "SmartWatch"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Contoh List")),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index){
          return ListTile(
            leading: Icon(Icons.animation_outlined),
            title: Text(items[index]),
          );
        },
      ),
    );
  }
}

class ProductScreen extends StatelessWidget{
  final List<Map<String, dynamic>> products = [
    {"kode" : "P001", "nama" : "laptop", "harga" : 100000},
    {"kode" : "P002", "nama" : "handphone", "harga" : 200000},
    {"kode" : "P003", "nama" : "ipad", "harga" : 300000},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Daftar produk")),
      body: Center(
        child: DataTable(columns: [
          DataColumn(label: Text("Kode")),
          DataColumn(label: Text("Nama")),
          DataColumn(label: Text("Harga")),
          ], rows: products.map((product) => DataRow(cells: [
            DataCell(Text(product['kode'])),
            DataCell(Text(product['nama'])),
            DataCell(Text(product['harga'].toString())),
          ])).toList()
          ),),
    );
  }
}