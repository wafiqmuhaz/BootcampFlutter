import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:finalappsanber/common/currency_rupiah_extension.dart';
import 'package:finalappsanber/common/datetime_extension.dart';
import 'package:finalappsanber/common/styles.dart';
import 'package:finalappsanber/domain/entity/transaction.dart';
import 'package:finalappsanber/presentation/blocs/transaction/transaction_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:printing/printing.dart';

// class TransactionPage extends StatefulWidget {
//   const TransactionPage({super.key});

//   @override
//   State<TransactionPage> createState() => _TransactionPageState();
// }

// class _TransactionPageState extends State<TransactionPage> {
//   String _selectedOrder = 'Terbaru';
//   @override
//   void initState() {
//     super.initState();
//     context.read<TransactionBloc>().add(OnFetchAllTransactions());
//   }

//   List<TransactionEntity> _sortTransactions(
//       List<TransactionEntity> transactions) {
//     if (_selectedOrder == 'Terbaru') {
//       transactions.sort((a, b) => b.createdAt.compareTo(a.createdAt));
//     } else if (_selectedOrder == 'Terlama') {
//       transactions.sort((a, b) => a.createdAt.compareTo(b.createdAt));
//     } else if (_selectedOrder == 'Termurah') {
//       transactions.sort((a, b) => a.endTotalPrice.compareTo(b.endTotalPrice));
//     } else if (_selectedOrder == 'Termahal') {
//       transactions.sort((a, b) => b.endTotalPrice.compareTo(a.endTotalPrice));
//     }
//     return transactions;
//   }

//   // Fungsi untuk membuat dan mengunduh PDF ke folder Download
//   Future<void> _downloadPdf(List<TransactionEntity> transactions) async {
//     final pdf = pw.Document();

//     // Menambahkan halaman dan konten ke PDF
//     pdf.addPage(
//       pw.Page(
//         build: (pw.Context context) {
//           return pw.Column(
//             crossAxisAlignment: pw.CrossAxisAlignment.start,
//             children: [
//               pw.Text(
//                 'Riwayat Transaksi',
//                 style: pw.TextStyle(
//                   fontSize: 24,
//                   fontWeight: pw.FontWeight.bold,
//                 ),
//               ),
//               pw.SizedBox(height: 16),
//               pw.ListView.builder(
//                 itemCount: transactions.length,
//                 itemBuilder: (context, index) {
//                   final transaction = transactions[index];
//                   return pw.Container(
//                     margin: const pw.EdgeInsets.only(bottom: 16),
//                     padding: const pw.EdgeInsets.all(16),
//                     decoration: pw.BoxDecoration(
//                       border: pw.Border.all(color: PdfColors.black),
//                       borderRadius: pw.BorderRadius.circular(8),
//                     ),
//                     child: pw.Column(
//                       crossAxisAlignment: pw.CrossAxisAlignment.start,
//                       children: [
//                         pw.Text(
//                             'Tanggal: ${transaction.createdAt.dateTimeFormatter}'),
//                         pw.Text('Nama Member: ${transaction.user.name}'),
//                         pw.Text(
//                             'Total: ${transaction.endTotalPrice.intToFormatRupiah}'),
//                         pw.Text(
//                             'Metode Pembayaran: ${transaction.paymentMethod}'),
//                         pw.Text('Bank: ${transaction.paymentBankMethod}'),
//                       ],
//                     ),
//                   );
//                 },
//               ),
//             ],
//           );
//         },
//       ),
//     );

//     // Meminta izin untuk menulis ke penyimpanan eksternal
//     var status = await Permission.storage.request();
//     if (status.isGranted) {
//       // Mendapatkan direktori Download
//       final directory = Directory('/storage/emulated/0/Download');
//       final filePath = '${directory.path}/riwayat_transaksi.pdf';
//       final file = File(filePath);

//       // Menyimpan PDF ke file
//       await file.writeAsBytes(await pdf.save());

//       // Menampilkan pesan sukses
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('PDF berhasil diunduh ke $filePath')),
//       );
//     } else {
//       // Menampilkan pesan error jika izin tidak diberikan
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Izin penyimpanan tidak diberikan')),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: greyColor,
//       appBar: AppBar(
//         centerTitle: false,
//         title: const Text('Riwayat Transaksi'),
//         actions: [
//           DropdownButton<String>(
//             value: _selectedOrder,
//             onChanged: (String? newValue) {
//               setState(() {
//                 _selectedOrder = newValue!;
//               });
//             },
//             items: <String>[
//               'Terbaru',
//               'Terlama',
//               'Termurah',
//               'Termahal',
//             ].map<DropdownMenuItem<String>>((String value) {
//               return DropdownMenuItem<String>(
//                 value: value,
//                 child: Text(value),
//               );
//             }).toList(),
//           ),
//           BlocBuilder<TransactionBloc, TransactionState>(
//             builder: (context, state) {
//               if (state is AllTransactionsLoaded) {
//                 return IconButton(
//                   icon: const Icon(Icons.print),
//                   onPressed: () => _downloadPdf(state.transactions),
//                 );
//               } else {
//                 return Container();
//               }
//             },
//           ),
//         ],
//       ),
//       body: BlocBuilder<TransactionBloc, TransactionState>(
//         builder: (context, state) {
//           if (state is TransactionLoading) {
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           } else if (state is AllTransactionsLoaded) {
//             final sortedTransactions = _sortTransactions(state.transactions);
//             return RefreshIndicator(
//               onRefresh: () async {
//                 context.read<TransactionBloc>().add(OnFetchAllTransactions());
//               },
//               child: ListView.builder(
//                 padding: const EdgeInsets.only(
//                   left: 16,
//                   right: 16,
//                   top: 16,
//                 ),
//                 physics: const BouncingScrollPhysics(),
//                 itemCount: sortedTransactions.length,
//                 itemBuilder: (_, index) {
//                   final transaction = sortedTransactions[index];
//                   return _TransactionCard(transaction: transaction);
//                 },
//               ),
//             );
//           } else if (state is TransactionEmpty) {
//             return const Center(
//               child: Text('Data Kosong'),
//             );
//           } else if (state is TransactionFailure) {
//             return Center(
//               child: Text(state.message),
//             );
//           } else {
//             return Container();
//           }
//         },
//       ),
//     );
//   }
// }

// class _TransactionCard extends StatelessWidget {
//   const _TransactionCard({
//     required this.transaction,
//   });

//   final TransactionEntity transaction;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.only(bottom: 16),
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: whiteColor,
//         borderRadius: BorderRadius.circular(16),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 transaction.createdAt.dateTimeFormatter,
//                 style: Theme.of(context).textTheme.bodyLarge,
//               ),
//               Row(
//                 children: [
//                   const Icon(
//                     Icons.check_circle_outline_rounded,
//                     color: Colors.green,
//                   ),
//                   const SizedBox(width: 4),
//                   Text(
//                     'Selesai',
//                     style: Theme.of(context)
//                         .textTheme
//                         .bodyMedium!
//                         .copyWith(color: Colors.green),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//           const Padding(
//             padding: EdgeInsets.symmetric(vertical: 16),
//             child: Divider(thickness: 0.2, height: 1),
//           ),
//           const Text('Nama Member :'),
//           const SizedBox(height: 4),
//           Text(
//             transaction.user.name!,
//             style: Theme.of(context)
//                 .textTheme
//                 .bodyLarge!
//                 .copyWith(color: blueColor),
//           ),
//           const SizedBox(height: 16),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Text('Total :'),
//                   const SizedBox(height: 4),
//                   Text(
//                     transaction.endTotalPrice.intToFormatRupiah,
//                     style: Theme.of(context)
//                         .textTheme
//                         .bodyLarge!
//                         .copyWith(color: blueColor),
//                   ),
//                 ],
//               ),
//               Text(
//                 "${transaction.paymentMethod}\n${transaction.paymentBankMethod}",
//                 style: Theme.of(context)
//                     .textTheme
//                     .bodyLarge!
//                     .copyWith(color: blueColor),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
class TransactionPage extends StatefulWidget {
  const TransactionPage({super.key});

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  String _selectedOrder = 'Terbaru';

  @override
  void initState() {
    super.initState();
    context.read<TransactionBloc>().add(OnFetchAllTransactions());
  }

  List<TransactionEntity> _sortTransactions(List<TransactionEntity> transactions) {
    if (_selectedOrder == 'Terbaru') {
      transactions.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    } else if (_selectedOrder == 'Terlama') {
      transactions.sort((a, b) => a.createdAt.compareTo(b.createdAt));
    } else if (_selectedOrder == 'Termurah') {
      transactions.sort((a, b) => a.endTotalPrice.compareTo(b.endTotalPrice));
    } else if (_selectedOrder == 'Termahal') {
      transactions.sort((a, b) => b.endTotalPrice.compareTo(a.endTotalPrice));
    }
    return transactions;
  }

  Future<File> _generatePdf(List<TransactionEntity> transactions) async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (pw.Context context, int index) {
              final transaction = transactions[index];
              return pw.Container(
                margin: const pw.EdgeInsets.only(bottom: 16),
                padding: const pw.EdgeInsets.all(16),
                decoration: pw.BoxDecoration(
                  borderRadius: pw.BorderRadius.circular(8),
                  border: pw.Border.all(color: PdfColors.grey),
                ),
                child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                      children: [
                        pw.Text(
                          transaction.createdAt.dateTimeFormatter,
                          style: pw.TextStyle(fontSize: 12),
                        ),
                        pw.Text(
                          'Selesai',
                          style: pw.TextStyle(
                            fontSize: 12,
                            color: PdfColors.green,
                          ),
                        ),
                      ],
                    ),
                    pw.Divider(),
                    pw.Text('Nama Member: ${transaction.user.name}'),
                    pw.Text('Total: ${transaction.endTotalPrice.intToFormatRupiah}'),
                    pw.Text('Metode Pembayaran: ${transaction.paymentMethod}'),
                    pw.Text('Bank: ${transaction.paymentBankMethod}'),
                  ],
                ),
              );
            },
          );
        },
      ),
    );

    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/transactions_semua_user.pdf');
    await file.writeAsBytes(await pdf.save());
    return file;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greyColor,
      appBar: AppBar(
        centerTitle: false,
        title: const Text('Riwayat Transaksi'),
        actions: [
          DropdownButton<String>(
            value: _selectedOrder,
            onChanged: (String? newValue) {
              setState(() {
                _selectedOrder = newValue!;
              });
            },
            items: <String>[
              'Terbaru',
              'Terlama',
              'Termurah',
              'Termahal',
            ].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          BlocBuilder<TransactionBloc, TransactionState>(
            builder: (context, state) {
              if (state is AllTransactionsLoaded) {
                return Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.download, color: Colors.black),
                      onPressed: () async {
                        final pdfFile = await _generatePdf(state.transactions);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('PDF berhasil disimpan di ${pdfFile.path}')),
                        );
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.print),
                      onPressed: () {
                        Printing.layoutPdf(
                          onLayout: (PdfPageFormat format) async {
                            final pdfFile = await _generatePdf(state.transactions);
                            return pdfFile.readAsBytes();
                          },
                        );
                      },
                    ),
                  ],
                );
              } else {
                return Container();
              }
            },
          ),
        ],
      ),
      body: BlocBuilder<TransactionBloc, TransactionState>(
        builder: (context, state) {
          if (state is TransactionLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is AllTransactionsLoaded) {
            final sortedTransactions = _sortTransactions(state.transactions);
            return RefreshIndicator(
              onRefresh: () async {
                context.read<TransactionBloc>().add(OnFetchAllTransactions());
              },
              child: ListView.builder(
                padding: const EdgeInsets.only(
                  left: 16,
                  right: 16,
                  top: 16,
                ),
                physics: const BouncingScrollPhysics(),
                itemCount: sortedTransactions.length,
                itemBuilder: (_, index) {
                  final transaction = sortedTransactions[index];
                  return _TransactionCard(transaction: transaction);
                },
              ),
            );
          } else if (state is TransactionEmpty) {
            return const Center(
              child: Text('Data Kosong'),
            );
          } else if (state is TransactionFailure) {
            return Center(
              child: Text(state.message),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}

class _TransactionCard extends StatelessWidget {
  const _TransactionCard({
    required this.transaction,
  });

  final TransactionEntity transaction;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                transaction.createdAt.dateTimeFormatter,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.check_circle_outline_rounded,
                    color: Colors.green,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    'Selesai',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: Colors.green),
                  ),
                ],
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Divider(thickness: 0.2, height: 1),
          ),
          const Text('Nama Member :'),
          const SizedBox(height: 4),
          Text(
            transaction.user.name!,
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: blueColor),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Total :'),
                  const SizedBox(height: 4),
                  Text(
                    transaction.endTotalPrice.intToFormatRupiah,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: blueColor),
                  ),
                ],
              ),
              Text(
                "${transaction.paymentMethod}\n${transaction.paymentBankMethod}",
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(color: blueColor),
              ),
            ],
          ),
        ],
      ),
    );
  }
}