import 'dart:convert';

import '../../../core/widgets/main_header_widget.dart';
import '../../../data/services/fcm_helper.dart';
import '../../../data/services/notification_helper.dart';
import '../../widgets/user_home/search_product_list_builder_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:math' as math;

import '../../../core/widgets/category_chip_widget.dart';
import '../../../core/utils/helper.dart';
import '../../blocs/user_home/user_home_bloc.dart';
import '../../widgets/user_home/base_collection_widget.dart';
import '../../widgets/user_home/product_list_by_category_builder_widget.dart';
import '../../widgets/user_home/search_bar_widget.dart';

class UserHomePage extends StatefulWidget {
  const UserHomePage({super.key});

  @override
  State<UserHomePage> createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    context.read<UserHomeBloc>()
      ..add(GetUserDetailsEvent())
      ..add(GetCategoriesEvent())
      ..add(GetFeaturedListEvent())
      ..add(GetTrendingListEvent())
      ..add(GetLatestListEvent());
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _bodyWidget(),
    );
  }

  _bodyWidget() {
    final userHomeState = context.watch<UserHomeBloc>().state;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0).copyWith(bottom: 0),
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              SizedBox(
                height: Helper.isLandscape(context)
                    ? _searchController.text.isEmpty
                        ? Helper.screeHeight(context) * 0.6
                        : Helper.screeHeight(context) * 0.45
                    : _searchController.text.isEmpty
                        ? Helper.screeHeight(context) * 0.3
                        : Helper.screeHeight(context) * 0.236,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MainHeaderWidget(
                      userName: userHomeState.userEntity.userName,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    SearchBarWidget(
                      controller: _searchController,
                      function: (value) => _handleSearchQuery(
                        value,
                      ),
                      clearFunction: () => _handleClearFunction(),
                    ),
                    const SizedBox(
                      height: 26,
                    ),
                    _searchController.text.isEmpty
                        ? Column(
                            children: [
                              SizedBox(
                                height: Helper.isLandscape(context)
                                    ? Helper.screeHeight(context) * 0.10
                                    : Helper.screeHeight(context) * 0.05,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  physics: const ClampingScrollPhysics(),
                                  itemCount:
                                      userHomeState.listOfCategories.length + 1,
                                  itemBuilder: (context, index) {
                                    final categoryList =
                                        Helper.createCategoryHorizontalList(
                                      userHomeState.listOfCategories,
                                    );
                                    return GestureDetector(
                                      onTap: () => _handleCategoryChipButton(
                                        index,
                                        categoryList,
                                      ),
                                      child: CategoryChipWidget(
                                        index: index,
                                        pickedValue:
                                            userHomeState.currentCategory,
                                        categoryList: categoryList,
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          )
                        : const SizedBox(),
                  ],
                ),
              ),
              ValueListenableBuilder(
                valueListenable: NotificationHelper.payload,
                builder: (context, value, child) {
                  // Actual Data
                  final valueJson = FcmHelper.tryDecode(value);
                  return Center(
                    child: Column(
                      children: [
                        // Title
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                "Promo Hari ini : ",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              GestureDetector(
                                onTap: () async {
                                  // Reset Payload Value
                                  // NotificationHelper.payload.value = "";
                                  // Kirim Notifikasi
                                  await NotificationHelper
                                      .flutterLocalNotificationsPlugin
                                      .show(
                                    math.Random().nextInt(99),
                                    "Menampilkan notifikasi Promo!",
                                    "Promo Hari ini : ${valueJson["title"] ?? 'Belum ada'}",
                                    NotificationHelper.notificationDetails,
                                    payload: jsonEncode({"data": "test"}),
                                  );
                                },
                                child: Text(
                                  "${valueJson["title"] ?? 'Belum ada'}",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.blueGrey,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Content
                        // Text(
                        //   "Notif Content : ${valueJson["body"] ?? 'No Content'}",
                        //   style: const TextStyle(fontSize: 16),
                        // ),
                      ],
                    ),
                  );
                },
              ),
              _searchController.text.isEmpty
                  ? SizedBox(
                      height: Helper.isLandscape(context)
                          ? Helper.screeHeight(context) * 0.15
                          : Helper.screeHeight(context) * 0.58,
                      child: ListView(
                        physics: const ClampingScrollPhysics(),
                        children: [
                          userHomeState.currentCategory == 0
                              ? const BaseCollectionWidget()
                              : const ProductsListByCategoryBuilderWidget(),
                        ],
                      ),
                    )
                  : SizedBox(
                      height: Helper.screeHeight(context),
                      child: ListView(
                        physics: const ClampingScrollPhysics(),
                        children: const [
                          SearchProductListBuilderWidget(),
                          SizedBox(
                            height: 26.0,
                          ),
                        ],
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }

  _handleSearchQuery(
    String value,
  ) {
    context.read<UserHomeBloc>().add(SearchFieldChangeEvent(query: value));
    context.read<UserHomeBloc>().add(GetProductsListByQueryEvent());
  }

  _handleCategoryChipButton(
    int index,
    List<String> list,
  ) {
    context.read<UserHomeBloc>().add(
          CategoryClickedEvent(
            value: index,
            name: list[index],
          ),
        );
    context.read<UserHomeBloc>().add(GetProductsListByCategoryEvent());
  }

  _handleClearFunction() {
    context.read<UserHomeBloc>().add(ClearSearchFiledEvent());
    _searchController.clear();
  }
}
