import 'dart:io';

import 'package:flutter/material.dart';
import 'package:printing/printing.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:finalappsanber/common/currency_rupiah_extension.dart';
import 'package:finalappsanber/common/datetime_extension.dart';
import 'package:finalappsanber/common/styles.dart';
import 'package:finalappsanber/domain/entity/transaction.dart';
import 'package:finalappsanber/presentation/blocs/transaction/transaction_bloc.dart';

class MemberTransactionPage extends StatefulWidget {
  const MemberTransactionPage({super.key});

  @override
  State<MemberTransactionPage> createState() => _MemberTransactionPageState();
}

class _MemberTransactionPageState extends State<MemberTransactionPage> {
  @override
  void initState() {
    super.initState();
    context.read<TransactionBloc>().add(OnFetchAllTransactionsByUserId());
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
                    pw.Text('Total:'),
                    pw.SizedBox(height: 4),
                    pw.Text(
                      transaction.endTotalPrice.intToFormatRupiah,
                      style: pw.TextStyle(
                        fontSize: 16,
                        color: PdfColors.blue,
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );

    // Simpan file PDF ke direktori sementara perangkat
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
        // title: const Text('Riwayat Transaksi'),
        actions: [
          IconButton(
            icon: const Icon(Icons.download, color: Colors.black),
            onPressed: () async {
              final state = context.read<TransactionBloc>().state;
              if (state is AllTransactionsLoaded) {
                final pdfFile = await _generatePdf(state.transactions);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('PDF berhasil disimpan di ${pdfFile.path}')),
                );
              }
            },
          ),
          IconButton(
            icon: const Icon(Icons.print),
            onPressed: () {
              final state = context.read<TransactionBloc>().state;
              if (state is AllTransactionsLoaded) {
                Printing.layoutPdf(
                  onLayout: (PdfPageFormat format) async {
                    final pdf = await _generatePdf(state.transactions);
                    return pdf.readAsBytes();
                  },
                );
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
            return ListView.builder(
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
                top: 16,
              ),
              itemCount: state.transactions.length,
              itemBuilder: (_, index) {
                final transaction = state.transactions[index];
                return _MemberTransactionCard(transaction: transaction);
              },
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

class _MemberTransactionCard extends StatelessWidget {
  const _MemberTransactionCard({
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
    );
  }
}
