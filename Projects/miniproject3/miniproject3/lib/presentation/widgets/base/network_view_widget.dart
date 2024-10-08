import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/strings.dart';
import '../../../core/utils/helper.dart';

class NetworkViewWidget extends StatelessWidget {
  const NetworkViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: Helper.screeHeight(context) * 0.10,
              ),
              Image(
                height: Helper.isLandscape(context)
                    ? Helper.screeHeight(context) * 0.8
                    : Helper.screeHeight(context) * 0.4,
                image: const AssetImage('assets/images/network.png'),
              ),
              const SizedBox(
                height: 8.0,
              ),
              const Text(
                AppStrings.noInternetTitle,
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w600,
                  fontSize: 22,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 16.0,
              ),
              const Text(
                AppStrings.noInternetMessage,
                style: TextStyle(
                  color: AppColors.mediumGrey,
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
