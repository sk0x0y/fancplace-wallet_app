import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wallet_app/constant/theme/theme_resources.dart';

class BuildPointCard extends StatelessWidget {
  final double? borderRadius;
  final Color? backgroundColor;
  final Color? actionBackgroundColor;
  final Widget? label;
  final Widget? currency;
  final List<Widget>? actions;
  const BuildPointCard({
    super.key,
    this.borderRadius,
    this.backgroundColor,
    this.actionBackgroundColor,
    this.label,
    this.currency,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return buildPointCard(
      context,
      borderRadius: borderRadius,
      backgroundColor: backgroundColor,
      actionBackgroundColor: actionBackgroundColor,
      label: label,
      currency: currency,
      actions: actions,
    );
  }

  Widget buildPointCard(
    BuildContext context, {
    double? borderRadius,
    Color? backgroundColor,
    Color? actionBackgroundColor,
    Widget? label,
    Widget? currency,
    List<Widget>? actions,
  }) {
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadius ?? 0.0),
              color: backgroundColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20.0,
                    horizontal: 24.0,
                  ),
                  child: Wrap(
                    runSpacing: 12.0,
                    children: [
                      label ?? const Text('Label Area'),
                      currency ?? const Text('Currency Area'),
                    ],
                  ),
                ),
                Container(
                  height: 50.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(borderRadius ?? 0.0),
                      bottomRight: Radius.circular(borderRadius ?? 0.0),
                    ),
                    color: actionBackgroundColor,
                  ),
                  child: Flex(
                    direction: Axis.horizontal,
                    children: [...?actions],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
