import 'package:flutter/cupertino.dart';
import 'package:wallet_app/constant/theme/theme_resources.dart';

class BottomModal extends StatelessWidget {
  final double radius;
  final double? height;
  final Widget child;
  const BottomModal({
    super.key,
    required this.radius,
    required this.height,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return buildBottomModal(context, radius, height, child);
  }

  Widget buildBottomModal(
    BuildContext context,
    double radius,
    double? height,
    Widget child,
  ) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: height,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(radius),
          topRight: Radius.circular(radius),
          bottomLeft: Radius.zero,
          bottomRight: Radius.zero,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          child,
        ],
      ),
    );
  }
}
