import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:qr_flutter/qr_flutter.dart';

import 'package:finalappsanber/common/currency_rupiah_extension.dart';
import 'package:finalappsanber/common/routes.dart';
import 'package:finalappsanber/common/styles.dart';
import 'package:finalappsanber/domain/entity/cart.dart';

import '../../../data/models/cart_model.dart';
import '../../../helpers/notification_helper.dart';

class PosCheckoutPage extends StatelessWidget {
  const PosCheckoutPage({
    required this.cartMap,
    required this.cart,
    super.key,
  });

  final Map<String, dynamic> cartMap;
  final Cart cart;

  @override
  Widget build(BuildContext context) {
    // Menyimpan data QR ke variabel
    final String resultqr = jsonEncode(cartMap);

    return Scaffold(
      backgroundColor: greyColor,
      appBar: AppBar(
        title: const Text('POS Checkout'),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Tunjukan QR Code Kepada Pembeli',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          const SizedBox(height: 16),
                          QrImageView(
                            data: resultqr, // Menggunakan variabel resultqr
                            size: 280,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Tunggu konfirmasi pembeli \nsebelum tutup halaman ini',
                            style: Theme.of(context).textTheme.titleMedium,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    Card(
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: ExpansionTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        tilePadding: const EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 16,
                        ),
                        title: Text(
                          'Detail Transaksi',
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: navyColor,
                                  ),
                        ),
                        childrenPadding: const EdgeInsets.only(
                          left: 16,
                          right: 16,
                          bottom: 16,
                        ),
                        children: [
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            padding: const EdgeInsets.symmetric(vertical: 4),
                            itemBuilder: (context, index) {
                              final product = cart.products[index];
                              return Container(
                                margin: const EdgeInsets.symmetric(vertical: 4),
                                child: ListTile(
                                  tileColor: greyColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  title: Text(product.name),
                                  subtitle: Text(
                                    product.price.intToFormatRupiah,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                          color: blueColor,
                                        ),
                                  ),
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        product.quantity.toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(
                                                fontWeight: FontWeight.w700),
                                      ),
                                      const SizedBox(width: 4),
                                      const Text('item'),
                                    ],
                                  ),
                                ),
                              );
                            },
                            itemCount: cart.products.length,
                          ),
                          const SizedBox(height: 8),
                          ListTile(
                            tileColor: Colors.grey[300],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            title: const Text('Total'),
                            trailing: Text(
                              cart.totalPrice.intToFormatRupiah,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(fontWeight: FontWeight.w700),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                OutlinedButton(
                  onPressed: () => Navigator.pop(context),
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(
                      width: 2,
                      color: blueColor,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    fixedSize: Size(MediaQuery.of(context).size.width, 57),
                  ),
                  child: const Text('Kembali Ke Beranda'),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () =>
                      Navigator.pushReplacementNamed(context, transactionRoute),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    fixedSize: Size(MediaQuery.of(context).size.width, 57),
                  ),
                  child: const Text('Cek Status Transaksi'),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () async {
                    ///
                    NotificationHelper.payload.value = "";
                    Color randomColor =
                        Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                            .withOpacity(1.0);
                    // Kirim Notifikasi
                    await NotificationHelper.flutterLocalNotificationsPlugin
                        .show(
                      math.Random().nextInt(99),
                      "Menampilkan notifikasi",
                      "Menuju ke pembayaran item berhasil",
                      NotificationHelper.notificationDetails(randomColor),
                      payload: jsonEncode({"data": "test"}),
                    );
                    //
                    try {
                      final cartMap =
                          jsonDecode(resultqr) as Map<String, dynamic>;
                      final cart = CartModel.fromMap(cartMap).toEntity();
                      Navigator.pushReplacementNamed(
                        context,
                        memberCheckoutRoute,
                        arguments: cart,
                      );
                    } catch (e) {
                      debugPrint(e.toString());
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue, // Warna tombol
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    fixedSize: Size(MediaQuery.of(context).size.width, 57),
                  ),
                  child: const Text('Pembayaran Transaksi'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
