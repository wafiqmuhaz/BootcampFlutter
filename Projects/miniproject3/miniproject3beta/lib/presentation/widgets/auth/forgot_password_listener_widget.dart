// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/strings.dart';
import '../../../../core/utils/enum.dart';
import '../../../../core/utils/helper.dart';
import '../../blocs/forgot_password/forgot_password_bloc.dart';
import '../../blocs/network/network_bloc.dart';

class ForgotPasswordListenerWidget extends StatelessWidget {
  final String email;

  const ForgotPasswordListenerWidget({
    Key? key,
    required this.email,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final networkState = context.watch<NetworkBloc>().state;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BlocListener<ForgotPasswordBloc, ForgotPasswordState>(
          listener: (context, state) {
            if (state.status == BlocStatus.error) {
              context
                  .read<ForgotPasswordBloc>()
                  .add(SetForgotStatusToDefault());
              Helper.showSnackBar(
                context,
                state.authMessage,
              );
            }
            if (state.status == BlocStatus.success) {
              context
                  .read<ForgotPasswordBloc>()
                  .add(SetForgotStatusToDefault());
              Helper.showSnackBar(
                context,
                AppStrings.forgotPasswordLinkSendSuccess,
              );
            }
          },
          child: TextButton(
            onPressed: () => _handleResetEmailSendButton(
              context,
              email,
              networkState,
            ),
            child: const Text(
              "Resend Email",
              style: TextStyle(
                color: AppColors.textPrimary,
              ),
            ),
          ),
        ),
      ],
    );
  }

  _handleResetEmailSendButton(
    BuildContext context,
    String email,
    NetworkState networkState,
  ) {
    if (networkState.networkTypes == NetworkTypes.connected) {
      context.read<ForgotPasswordBloc>().add(
            SendResetLinkButtonClickedEvent(email: email),
          );
    } else {
      Helper.showSnackBar(context, AppStrings.noInternetMessage);
    }
  }
}
