import 'package:flutter/material.dart';
import 'package:wallet_app/components/modal/bottom_modal.dart';
import 'package:wallet_app/components/modal/pin_code_authentication_modal.dart';
import 'package:wallet_app/components/modal/recover_private_key_modal.dart';

class ModalService {
  static void openBottomSheet(
    BuildContext context, {
    bool usePreventPop = false,
    bool useRootNavigator = false,
    String? barrierLabel,
    required double radius,
    double? height,
    required Widget child,
  }) {
    showModalBottomSheet(
      context: context,
      useRootNavigator: useRootNavigator,
      barrierLabel: barrierLabel,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(radius),
          topRight: Radius.circular(radius),
        ),
      ),
      builder: (context) {
        return PopScope(
          canPop: usePreventPop ? false : true,
          child: BottomModal(
            radius: radius,
            height: height,
            child: child,
          ),
        );
      },
    );
  }

  static void openGeneralDialog(
    BuildContext context, {
    bool usePreventPop = false,
    bool useRootNavigator = true,
    String? barrierLabel,
    required Widget child,
  }) {
    showGeneralDialog(
      context: context,
      useRootNavigator: useRootNavigator,
      barrierLabel: barrierLabel,
      pageBuilder: (context, animation, secondaryAnimation) {
        return PopScope(
          canPop: usePreventPop ? false : true,
          child: child,
        );
      },
    );
  }

  static void openDialog(
    BuildContext context, {
    required Widget child,
  }) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: child,
        );
      },
    );
  }

  static void openPinCodeAuthenticationModal(
    BuildContext context, {
    Function(String pin)? onCompletedHandler,
  }) {
    openGeneralDialog(
      context,
      child: PinCodeAuthenticationModal(onCompletedHandler: onCompletedHandler),

  static void openRecoverPrivateKeyModal(BuildContext context) {
    openGeneralDialog(
      context,
      child: const RecoverPrivateKeyModal(),
    );
  }
}
