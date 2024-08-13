import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

import 'package:finalappsanber/common/currency_rupiah_extension.dart';
import 'package:finalappsanber/common/routes.dart';
import 'package:finalappsanber/common/styles.dart';
import 'package:finalappsanber/data/models/menu_model.dart';
import 'package:finalappsanber/presentation/blocs/profile/profile_bloc.dart';
import 'package:finalappsanber/presentation/blocs/report/report_bloc.dart';
import 'package:finalappsanber/presentation/widgets/menu_card.dart';

class VendorHomePage extends StatefulWidget {
  const VendorHomePage({super.key});

  @override
  State<VendorHomePage> createState() => _VendorHomePageState();
}

class _VendorHomePageState extends State<VendorHomePage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<ProfileBloc>().add(OnFetchProfile());
      context.read<ReportBloc>().add(OnGetReportTransactionsToday());
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<MenuModel> listMenu = [
      MenuModel(
        onPressed: () => Navigator.pushNamed(context, categoryRoute),
        icon: const FaIcon(
          FontAwesomeIcons.layerGroup,
          size: 32,
          color: whiteColor,
        ),
        labelText: 'Kategori',
      ),
      MenuModel(
        onPressed: () => Navigator.pushNamed(context, productRoute),
        icon: const FaIcon(
          FontAwesomeIcons.pen,
          size: 32,
          color: whiteColor,
        ),
        labelText: 'Produk',
      ),
      MenuModel(
        onPressed: () => Navigator.pushNamed(context, posRoute),
        icon: const FaIcon(
          FontAwesomeIcons.keyboard,
          size: 32,
          color: whiteColor,
        ),
        labelText: 'POS',
      ),
      MenuModel(
        onPressed: () => Navigator.pushNamed(context, transactionRoute),
        icon: const FaIcon(
          FontAwesomeIcons.database,
          size: 32,
          color: whiteColor,
        ),
        labelText: 'Riwayat\nTransaksi',
      ),
      MenuModel(
        onPressed: () => Navigator.pushNamed(context, profileRoute),
        icon: const FaIcon(
          FontAwesomeIcons.idCard,
          size: 32,
          color: whiteColor,
        ),
        labelText: 'Profil Saya',
      ),
    ];

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Sanber POS - POS App'),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          context.read<ReportBloc>().add(OnGetReportTransactionsToday());
        },
        child: ListView(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 16,
          ),
          children: [
            BlocBuilder<ProfileBloc, ProfileState>(
              builder: (context, state) {
                return GestureDetector(
                  onTap: state is ProfileLoaded
                      ? () => Navigator.pushNamed(context, profileRoute)
                      : null,
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.grey[300],
                        backgroundImage: state is ProfileLoaded
                            ? state.user.photoUrl != null
                                ? NetworkImage(state.user.photoUrl!)
                                : null
                            : null,
                        child: state is ProfileLoaded
                            ? state.user.photoUrl == null
                                ? const Icon(Icons.person)
                                : null
                            : null,
                      ),
                      const SizedBox(width: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            state is ProfileLoaded
                                ? 'Hi, ${state.user.name}'
                                : 'Loading...',
                          ),
                          const SizedBox(height: 4),
                          Text(
                            DateFormat('d MMMM yyyy', 'id_ID')
                                .format(DateTime.now()),
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      color: navyColor,
                                      fontWeight: FontWeight.w700,
                                    ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
            const SizedBox(height: 24),
            BlocBuilder<ReportBloc, ReportState>(
              builder: (_, state) {
                return SizedBox(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.6 ,
                        child: _SummaryCard(
                          icon: Icons.attach_money,
                          label: 'Omset hari ini',
                          value: state is ReportLoaded
                              ? state.turnOverTransactions.intToFormatRupiah
                              : 'Loading...',
                        ),
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.4 ,
                        child: _SummaryCard(
                          icon: Icons.data_usage,
                          label: 'Transaksi hari ini',
                          value: state is ReportLoaded
                              ? state.countTransactions.toString()
                              : 'Loading...',
                        ),
                      ),
                    ],
                  ),
                );
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Expanded(
                //       flex: 3,
                //       child: _SummaryCard(
                //         icon: Icons.attach_money,
                //         label: 'Omset hari ini',
                //         value: state is ReportLoaded
                //             ? state.turnOverTransactions.intToFormatRupiah
                //             : 'Loading...',
                //       ),
                //     ),
                //     const SizedBox(width: 16),
                //     Expanded(
                //       flex: 2,
                //       child: _SummaryCard(
                //         icon: Icons.data_usage,
                //         label: 'Transaksi hari ini',
                //         value: state is ReportLoaded
                //             ? state.countTransactions.toString()
                //             : 'Loading...',
                //       ),
                //     ),
                //   ],
                // );
              },
            ),
            const SizedBox(height: 40),
            Text(
              'Main Menu',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: navyColor),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(4),
              itemCount: listMenu.length,
              shrinkWrap: true,
              itemBuilder: (_, index) {
                final menuItem = listMenu[index];
                return Card(
                  color: const Color.fromARGB(255, 150, 150, 150),
                  shadowColor: const Color.fromARGB(255, 223, 223, 223),
                  elevation: 2,
                  child: MenuCard(
                    onPressed: menuItem.onPressed,
                    icon: menuItem.icon,
                    labelText: menuItem.labelText,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _SummaryCard extends StatelessWidget {
  const _SummaryCard({
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 150, 150, 150),
        // blueColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 18,
            backgroundColor: navyColor,
            // Colors.transparent.withOpacity(0.3),
            child: Icon(icon, color: whiteColor),
          ),
          const SizedBox(height: 16),
          Text(
            label,
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(color: whiteColor),
          ),
          const SizedBox(height: 6),
          Text(
            value,
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: whiteColor),
          ),
        ],
      ),
    );
  }
}
