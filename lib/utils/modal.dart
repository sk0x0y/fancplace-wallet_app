import 'package:flutter/material.dart';
import 'package:wallet_app/components/modal/bottom_modal.dart';

class Modal {
  static void openBottomSheet(
    BuildContext context, {
    required double radius,
    required double height,
    required Widget child,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return BottomModal(
          radius: radius,
          height: height,
          child: child,
        );
      },
    );
  }
}
