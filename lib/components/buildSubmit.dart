import 'package:flutter/material.dart';
import 'package:wallet_app/constant/theme/app_colors.dart';
import 'package:wallet_app/constant/theme/app_fonts.dart';

class BuildSubmit extends StatelessWidget {
  final Widget? customWidget;
  final Widget? customButtonChild;
  final double? radius;
  final String? buttonText;
  final Color? buttonTextColor;
  final VoidCallback? buttonHandler;
  final Color? buttonBorderColor;
  final Color? buttonBackgroundColor;
  final List<Widget>? actionWidgets;
  const BuildSubmit(
    BuildContext context, {
    super.key,
    this.customWidget,
    this.customButtonChild,
    this.radius,
    this.buttonText,
    this.buttonTextColor,
    this.buttonHandler,
    this.buttonBorderColor,
    this.buttonBackgroundColor,
    this.actionWidgets,
  });

  @override
  Widget build(BuildContext context) {
    return buildSubmit(
      context,
      customWidget: customWidget,
      customButtonChild: customButtonChild,
      radius: radius,
      buttonText: buttonText,
      buttonTextColor: buttonTextColor,
      buttonHandler: buttonHandler,
      buttonBorderColor: buttonBorderColor,
      buttonBackgroundColor: buttonBackgroundColor,
      actionWidgets: actionWidgets,
    );
  }

  Widget buildSubmit(
    BuildContext context, {
    Widget? customWidget,
    Widget? customButtonChild,
    double? radius,
    String? buttonText,
    Color? buttonTextColor,
    VoidCallback? buttonHandler,
    Color? buttonBorderColor,
    Color? buttonBackgroundColor,
    List<Widget>? actionWidgets,
  }) {
    return Wrap(
      runSpacing:
          actionWidgets != null && actionWidgets.isNotEmpty ? 30.0 : 0.0,
      children: [
        customWidget ??
            ElevatedButton(
              onPressed: buttonHandler ?? () {},
              style: ElevatedButton.styleFrom(
                side: BorderSide(
                  color: buttonBorderColor ?? Colors.transparent,
                ),
                minimumSize: const Size.fromHeight(56.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(radius ?? 52.0),
                ),
                backgroundColor:
                    buttonBackgroundColor ?? AppColors.backgroundPrimary,
              ),
              child: customButtonChild ??
                  Text(
                    buttonText ?? 'ButtonText',
                    style: TextStyle(
                      fontWeight: AppFonts.fontWeight500,
                      fontSize: AppFonts.fontSize15,
                      color: buttonTextColor ?? AppColors.white,
                    ),
                  ),
            ),
        actionWidgets != null
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: actionWidgets,
              )
            : const SizedBox(),
      ],
    );
  }
}
