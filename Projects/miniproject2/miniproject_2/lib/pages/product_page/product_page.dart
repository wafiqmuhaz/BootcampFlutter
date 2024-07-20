// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously, deprecated_member_use

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:miniproject_1/bloc/product_bloc/product_bloc.dart';
import 'package:miniproject_1/bloc/product_bloc/product_state.dart';
import 'package:miniproject_1/routes/routes_name.dart';
import 'dart:math' as math;

import '../../helpers/notification_helper.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only( left: 12.0, right: 12.0),
              child: Text(
                'Kami menyediakan seluruh hal yang menarik untuk anda ✌️',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                fillColor: Colors.grey[500],
                filled: true,
                hintText: 'Search',
                hintStyle: TextStyle(color: Colors.black),
                prefixIcon: Icon(Icons.search, color: Colors.black),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
              style: TextStyle(color: Colors.black),
              onChanged: (value) {
                setState(() {
                  searchQuery = value.toLowerCase();
                });
              },
            ),
            const SizedBox(height: 20),
            Expanded(
              child: BlocBuilder<ProductBloc, ProductState>(
                builder: (context, state) {
                  if (state is ProductLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (state is ProductError) {
                    return Center(child: Text('Error: ${state.message}'));
                  }
                  if (state is ProductLoaded) {
                    final products = state.products.where((product) {
                      return product.title.toLowerCase().contains(searchQuery);
                    }).toList();

                    return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 2 / 3,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        final product = products[index];
                        return GestureDetector(
                          onTap: () async {
                            // Reset Payload Value
                            NotificationHelper.payload.value = "";
                            Color randomColor = Color(
                                    (math.Random().nextDouble() * 0xFFFFFF)
                                        .toInt())
                                .withOpacity(1.0);
                            // Kirim Notifikasi
                            await NotificationHelper
                                .flutterLocalNotificationsPlugin
                                .show(
                              math.Random().nextInt(99),
                              "Menampilkan notifikasi",
                              "Menuju ke detail item berhasil",
                              NotificationHelper.notificationDetails(
                                  randomColor),
                              payload: jsonEncode({"data": "test"}),
                            );

                            context.push(Uri(
                                    path: RouteNames.detailProduct,
                                    queryParameters: product.toMap())
                                .toString());
                          },
                          child: Card(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.network(
                                  product.image,
                                  height: 150,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    product.title,
                                    maxLines: 2,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      overflow: TextOverflow.ellipsis,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Text(
                                    "\$${product.price}",
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.green,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 12),
                                ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                      Color(
                                        (math.Random().nextDouble() * 0xFFFFFF)
                                            .toInt(),
                                      ).withOpacity(1.0),
                                    ),
                                  ),
                                  onPressed: () async {
                                    // Reset Payload Value
                                    NotificationHelper.payload.value = "";

                                    Color randomColor = Color(
                                            (math.Random().nextDouble() *
                                                    0xFFFFFF)
                                                .toInt())
                                        .withOpacity(1.0);

                                    // Kirim Notifikasi
                                    await NotificationHelper
                                        .flutterLocalNotificationsPlugin
                                        .show(
                                      math.Random().nextInt(99),
                                      "Menampilkan Notifikasi",
                                      "Item berhasil dimasukkan ke keranjang | Dummy",
                                      NotificationHelper.notificationDetails(
                                          randomColor),
                                      payload: jsonEncode({"data": "test"}),
                                    );
                                  },
                                  child: const Text("Keranjang | Notifikasi"),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }
                  return Container();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
