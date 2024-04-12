import 'package:flutter/material.dart';
import 'package:wallet_app/constant/theme/app_colors.dart';
import 'package:wallet_app/constant/theme/app_fonts.dart';

class BuildInput extends StatelessWidget {
  final double? runSpacing;
  final String? labelText;
  final Widget? customLabelText;
  final Widget? inputWidget;
  const BuildInput(
    BuildContext context, {
    super.key,
    this.runSpacing,
    this.labelText,
    this.customLabelText,
    this.inputWidget,
  });

  @override
  Widget build(BuildContext context) {
    return renderInput(
      context: context,
      runSpacing: runSpacing,
      labelText: labelText,
      customLabelText: customLabelText,
      inputWidget: inputWidget,
    );
  }

  Widget renderInput({
    required BuildContext context,
    double? runSpacing,
    String? labelText,
    Widget? customLabelText,
    Widget? inputWidget,
  }) {
    return Wrap(
      runSpacing: 10.0,
      children: [
        customLabelText ??
            Text(
              labelText ?? 'LabelText Area',
              style: const TextStyle(
                fontWeight: AppFonts.fontWeight700,
                fontSize: AppFonts.fontSize16,
                color: AppColors.textLabel,
              ),
            ),
        SizedBox(
          // height: 56.0,
          child: inputWidget ??
              const SizedBox(
                width: double.infinity,
                child: Text('inputWidget Area'),
              ),
        )
      ],
    );
  }
}
