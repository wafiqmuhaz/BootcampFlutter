import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:miniproject_1/model/product_model.dart';
import 'dart:math' as math;

import '../../helpers/notification_helper.dart';
import '../../routes/routes_name.dart';

class ProductDetailPage extends StatelessWidget {
  final ProductModel product;
  const ProductDetailPage({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.network(
                    product.image,
                    height: 300,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        product.title,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.favorite_border),
                      onPressed: () {
                        // Add to favorites functionality here
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Text(
                      "\$${product.price}",
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    Row(
                      children: List.generate(5, (index) {
                        return Icon(
                          index < 5 ? Icons.star : Icons.star_border,
                          color: Colors.amber,
                        );
                      }),
                    ),
                    const Text(' 5.0')
                  ],
                ),
                const SizedBox(height: 16),
                const Divider(),
                const SizedBox(height: 16),
                const Text(
                  'Description',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  product.description,
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 16),
                const Divider(),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          backgroundColor: Colors.orange,
                        ),
                        onPressed: () async {
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
                            "Menampilkan Notifikasi",
                            "Item berhasil dimasukkan ke keranjang | Dummy",
                            NotificationHelper.notificationDetails(randomColor),
                            payload: jsonEncode({"data": "test"}),
                          );
                        },
                        child: const Text(
                          'Add to Cart',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                        ),
                        onPressed: () async {
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
                              "Menuju ke Keranjang",
                              NotificationHelper.notificationDetails(
                                  randomColor),
                              payload: jsonEncode({"data": "test"}),
                            );

                            context.pushReplacementNamed(RouteNames.cartScreen);
                        },
                        child: const Text(
                          'Buy Now',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
