import 'package:flutter/material.dart';
import 'package:wallet_app/constant/theme/app_colors.dart';
import 'package:wallet_app/constant/theme/app_fonts.dart';

class BuildSubmit extends StatelessWidget {
  final String? buttonText;
  final VoidCallback? buttonHandler;
  final Color? buttonBackgroundColor;
  final List<Widget>? actionWidgets;
  const BuildSubmit(
    BuildContext context, {
    super.key,
    this.buttonText,
    this.buttonHandler,
    this.buttonBackgroundColor,
    this.actionWidgets,
  });

  @override
  Widget build(BuildContext context) {
    return buildSubmit(
      context,
      buttonText: buttonText,
      buttonHandler: buttonHandler,
      buttonBackgroundColor: buttonBackgroundColor,
      actionWidgets: actionWidgets,
    );
  }

  Widget buildSubmit(
    BuildContext context, {
    String? buttonText,
    VoidCallback? buttonHandler,
    Color? buttonBackgroundColor,
    List<Widget>? actionWidgets,
  }) {
    return Wrap(
      runSpacing: 30.0,
      children: [
        ElevatedButton(
          onPressed: buttonHandler ?? () {},
          style: ElevatedButton.styleFrom(
            minimumSize: const Size.fromHeight(56.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(52.0),
            ),
            backgroundColor:
                buttonBackgroundColor ?? AppColors.backgroundPrimary,
          ),
          child: Text(
            buttonText ?? 'ButtonText',
            style: const TextStyle(
              fontWeight: AppFonts.fontWeight500,
              fontSize: AppFonts.fontSize15,
              color: AppColors.white,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: actionWidgets ?? [],
        )
      ],
    );
  }
}
