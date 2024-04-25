import 'package:flutter/material.dart';
import 'package:wallet_app/components/modal/bottom_modal.dart';

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
}
