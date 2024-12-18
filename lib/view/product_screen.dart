// import 'package:flutter/material.dart';
// import 'package:isar/isar.dart';
// import '../controller/isar_controller.dart';
// import '../model/product.dart';
//
// class ProductScreen extends StatefulWidget {
//   @override
//   _ProductScreenState createState() => _ProductScreenState();
// }
//
// class _ProductScreenState extends State<ProductScreen> {
//   final service = IsarController();
//
//   final _nameController = TextEditingController();
//   final _codeController = TextEditingController();
//   List<Product> _products = [];
//
//   @override
//   void initState() {
//     super.initState();
//     _initializeIsar();
//   }
//
//   Future<void> _initializeIsar() async {
//   //  _isar = await openIsar();
//     _fetchProducts();
//   }
//
//   Future<void> _addProduct() async {
//     final product = Product(
//       name: _nameController.text,
//       brand: 'Sample Brand',
//       code: _codeController.text,
//       details: '',
//       strength: '',
//       status: true,
//       docID: '',
//       bodyrate: 0.0,
//       unit: '',
//       category: '',
//       imgurl: '',
//       unitID: '',
//       brandID: '',
//       categoryID: '',
//       perprice: 0.0,
//       menuperprice: 0.0,
//       sl: _products.length + 1,
//       img: false,
//     );
//     service.addProduct(product);
//     _fetchProducts();
//   }
//
//   Future<void> _fetchProducts() async {
//     final products = await service.getProducts();
//     setState(() {
//       _products = products;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Product Management')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: _nameController,
//               decoration: InputDecoration(labelText: 'Product Name'),
//             ),
//             TextField(
//               controller: _codeController,
//               decoration: InputDecoration(labelText: 'Product Code'),
//             ),
//             SizedBox(height: 10),
//             ElevatedButton(
//               onPressed: _addProduct,
//               child: Text('Add Product'),
//             ),
//             SizedBox(height: 20),
//             Expanded(
//               child: ListView.builder(
//                 itemCount: _products.length,
//                 itemBuilder: (context, index) {
//                   final product = _products[index];
//                   return ListTile(
//                     title: Text(product.name),
//                     subtitle: Text('Code: ${product.code}'),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   @override
//   void dispose() {
//     _nameController.dispose();
//     _codeController.dispose();
//     super.dispose();
//   }
// }
