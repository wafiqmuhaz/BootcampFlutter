// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:io';

import 'package:pengayaanfirebase/core/constants/strings.dart';
import 'package:pengayaanfirebase/core/utils/extension.dart';
import 'package:pengayaanfirebase/core/utils/helper.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

import '../../../core/widgets/elevated_button_widget.dart';
import '../../../core/widgets/elevated_loading_button_widget.dart';
import '../../../core/widgets/input_field_widget.dart';
import '../../../core/widgets/page_header_widget.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/lists.dart';
import '../../../core/constants/routes_name.dart';
import '../../../core/utils/enum.dart';
import '../../blocs/admin_tools/add_product/add_product_bloc.dart';
import '../../blocs/admin_tools/category/category_bloc.dart';
import '../../blocs/admin_tools/product/product_bloc.dart';
import '../../widgets/admin_tools/drop_down_widget.dart';
import '../../widgets/admin_tools/sub_image_widget.dart';
import '../../widgets/admin_tools/sub_images_add_button_widget.dart';
import '../../widgets/admin_tools/upload_cover_image_widget.dart';

class ProductAddEditPage extends StatefulWidget {
  final String title;
  const ProductAddEditPage({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  State<ProductAddEditPage> createState() => _ProductAddEditPageState();
}

class _ProductAddEditPageState extends State<ProductAddEditPage> {
  PlatformFile? coverImage;
  List<PlatformFile>? subImages;
  PlatformFile? asset;

  final TextEditingController _productNameController = TextEditingController();
  final TextEditingController _productPriceController = TextEditingController();
  final TextEditingController _productDescriptionController =
      TextEditingController();

  @override
  void dispose() {
    _productNameController.dispose();
    _productPriceController.dispose();
    _productDescriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _bodyWidget(),
    );
  }

  _bodyWidget() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0).copyWith(bottom: 0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              PageHeaderWidget(
                title: '${widget.title} Product',
                function: () => _handleBackButton(),
              ),
              const SizedBox(
                height: 16,
              ),
              Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () => _handleSelectCoverImage(),
                      child: UploadCoverImageWidget(coverImage: coverImage),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const Text(
                      "Upload Sub Images",
                      style: TextStyle(
                        color: AppColors.textThird,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    SizedBox(
                      height: Helper.isLandscape(context)
                          ? Helper.screeHeight(context) * 0.2
                          : Helper.screeHeight(context) * 0.1,
                      width: Helper.screeWidth(context),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () => _handleSelectSubImages(),
                            child: const SubImagesAddButtonWidget(),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          subImages != null
                              ? SubImageWidget(subImages: subImages)
                              : const SizedBox(),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    InputFieldWidget(
                      controller: _productNameController,
                      hint: 'Product Name',
                      prefix: const Icon(Iconsax.bag_2),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    InputFieldWidget(
                      controller: _productPriceController,
                      hint: 'Price',
                      prefix: const Icon(Iconsax.dollar_circle),
                      keyBoardType: TextInputType.number,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    DropDownWidget(
                      value: '0',
                      items: _createProductCategoryList(context),
                      function: (value) => _handleCategoryDropDown(value),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    DropDownWidget(
                      value: '0',
                      items: _createMarketingList(),
                      function: (value) => _handleMarketingDropDown(value),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    InputFieldWidget(
                      controller: _productDescriptionController,
                      hint: 'Product Description',
                      prefix: const Icon(Iconsax.card_edit),
                      isTextArea: true,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        TextButton(
                          onPressed: () => _handleUploadAsset(),
                          style: const ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(
                              AppColors.textPrimary,
                            ),
                          ),
                          child: const Text(
                            'Upload Asset',
                            style: TextStyle(
                              color: AppColors.white,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          width: Helper.isLandscape(context)
                              ? Helper.screeWidth(context) * 0.75
                              : Helper.screeWidth(context) * 0.55,
                          child: asset != null
                              ? Text(
                                  asset!.name,
                                  style: const TextStyle(
                                    color: AppColors.textThird,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                )
                              : const Text(
                                  "No file selected",
                                  style: TextStyle(
                                    color: AppColors.textThird,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              BlocConsumer<AddProductBloc, AddProductState>(
                listener: (context, state) {
                  if (state.status == BlocStatus.error) {
                    context
                        .read<AddProductBloc>()
                        .add(SetProductStatusToDefault());
                    Helper.showSnackBar(
                      context,
                      state.message == ResponseTypes.failure.response
                          ? AppStrings.productAlreadyAdded
                          : state.message,
                    );
                  }
                  if (state.status == BlocStatus.success) {
                    context
                        .read<AddProductBloc>()
                        .add(SetProductStatusToDefault());

                    Helper.showSnackBar(
                      context,
                      AppStrings.productAdded,
                    );

                    context.read<ProductBloc>().add(GetAllProductsEvent());

                    context.goNamed(AppRoutes.productsManagePageName);
                  }
                },
                builder: (context, state) {
                  if (state.status == BlocStatus.loading) {
                    return const ElevatedLoadingButtonWidget();
                  }
                  return ElevatedButtonWidget(
                    title: Text('${widget.title} Product'),
                    function: () => _handleSubmitButton(),
                  );
                },
              ),
              const SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }

  _handleBackButton() {
    context.goNamed(AppRoutes.productsManagePageName);
  }

  _handleSelectCoverImage() async {
    final result = await Helper.imagePick();

    if (result != null) {
      setState(() {
        coverImage = result;
      });
    }
  }

  _handleSelectSubImages() async {
    final result = await Helper.multipleImagePick();

    if (result != null) {
      setState(() {
        subImages = result;
      });
    }
  }

  _handleCategoryDropDown(String value) {
    context.read<AddProductBloc>().add(
          CategoryNameFieldChangeEvent(
            category: context
                .read<CategoryBloc>()
                .state
                .listOfCategories[int.parse(value) - 1]
                .name,
          ),
        );
  }

  _handleMarketingDropDown(String value) {
    context.read<AddProductBloc>().add(
          MarketingTypeFieldChangeEvent(
            type: AppLists.listOfMarketingType[int.parse(value) - 1],
          ),
        );
  }

  _handleUploadAsset() async {
    final result = await Helper.zipFilePick();

    if (result != null) {
      setState(() {
        asset = result;
      });
    }
  }

  _handleSubmitButton() {
    final state = context.read<AddProductBloc>().state;
    if (coverImage != null) {
      if (subImages != null) {
        if (_productNameController.text.isNotEmpty) {
          if (_productPriceController.text.isNotEmpty) {
            if (state.category.isNotEmpty) {
              if (state.marketingType.isNotEmpty) {
                if (_productDescriptionController.text.isNotEmpty) {
                  if (asset != null) {
                    context.read<AddProductBloc>().add(
                          ProductUploadButtonClickedEvent(
                            coverImage: coverImage!.bytes!,
                            subImages: Helper.subImagesList(subImages!),
                            zipFile: File(asset!.path!),
                            productName: _productNameController.text,
                            productPrice: _productPriceController.text,
                            productDescription:
                                _productDescriptionController.text,
                          ),
                        );
                  } else {
                    Helper.showSnackBar(context, AppStrings.requiredZipFile);
                  }
                } else {
                  Helper.showSnackBar(context, AppStrings.requiredDescription);
                }
              } else {
                Helper.showSnackBar(context, AppStrings.requiredMarketingType);
              }
            } else {
              Helper.showSnackBar(context, AppStrings.requiredCategory);
            }
          } else {
            Helper.showSnackBar(context, AppStrings.requiredPrice);
          }
        } else {
          Helper.showSnackBar(context, AppStrings.requiredProductName);
        }
      } else {
        Helper.showSnackBar(context, AppStrings.requiredSubImages);
      }
    } else {
      Helper.showSnackBar(context, AppStrings.requiredCoverImage);
    }
  }
}

List<DropdownMenuItem> _createProductCategoryList(BuildContext context) {
  List<DropdownMenuItem> items = [
    const DropdownMenuItem(
      value: '0',
      enabled: false,
      child: Row(
        children: [
          Icon(
            Iconsax.category,
            color: AppColors.textThird,
          ),
          SizedBox(
            width: 13,
          ),
          Text(
            "Product Category",
            style: TextStyle(
              color: AppColors.textThird,
            ),
          ),
        ],
      ),
    ),
  ];
  final categoryState = context.read<CategoryBloc>().state;

  return items +
      (categoryState.listOfCategories.isNotEmpty
          ? Helper.createCategoryDropDownList(categoryState.listOfCategories)
          : []);
}

List<DropdownMenuItem> _createMarketingList() {
  List<DropdownMenuItem> items = [
    const DropdownMenuItem(
      value: '0',
      enabled: false,
      child: Row(
        children: [
          Icon(
            Iconsax.trend_up,
            color: AppColors.textThird,
          ),
          SizedBox(
            width: 13,
          ),
          Text("Marketing Type"),
        ],
      ),
    ),
  ];

  return items + Helper.createMarketingDropDownList();
}
