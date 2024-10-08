import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../core/constants/colors.dart';

class FloatingButtonWidget extends StatelessWidget {
  final Function function;

  const FloatingButtonWidget({
    Key? key,
    required this.function,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => function(),
      backgroundColor: AppColors.secondary,
      child: const Icon(
        Iconsax.add,
        color: AppColors.white,
      ),
    );
  }
}
