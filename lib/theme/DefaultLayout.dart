import 'package:flutter/material.dart';
import 'package:wallet_app/constant/theme/app_colors.dart';
import 'package:wallet_app/constant/theme/app_fonts.dart';

class DefaultLayout extends StatelessWidget {
  final Color? backgroundColor;
  final Color? appBarBackgroundColor;
  final Widget child;
  final bool useSafeArea;
  final String? title;
  final Widget? customTitleWidget;
  final Widget? titleBottom;
  final double? titleFontSize;
  final double? scrolledUnderElevation;
  final Widget? bottomNavigationBar;
  final Widget? leader;
  final bool? resizeToAvoidBottomInset;
  final bool? centerTitle;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final Widget? floatingActionButton;
  final List<Widget>? actions;

  const DefaultLayout({
    this.backgroundColor,
    this.appBarBackgroundColor,
    required this.child,
    this.useSafeArea = true,
    this.title,
    this.customTitleWidget,
    this.titleBottom,
    this.titleFontSize,
    this.scrolledUnderElevation,
    this.bottomNavigationBar,
    this.leader,
    this.actions,
    this.resizeToAvoidBottomInset,
    this.floatingActionButtonLocation,
    this.floatingActionButton,
    this.centerTitle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor ?? Colors.white,
      appBar: renderAppBar(context, appBarBackgroundColor),
      body: useSafeArea ? SafeArea(child: child) : child,
      bottomNavigationBar: bottomNavigationBar,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset ?? true,
      floatingActionButtonLocation: floatingActionButtonLocation,
      floatingActionButton: floatingActionButton,
    );
  }

  AppBar? renderAppBar(BuildContext context, Color? appBarBackgroundColor) {
    if (title == null && customTitleWidget == null) {
      return null;
    }

    assert(!(title != null && customTitleWidget != null),
        "title하고 customTitleWidget은 동시에 선언할 수 없습니다.");

    final bottomWidget = (titleBottom != null)
        ? PreferredSize(
            preferredSize: const Size.fromHeight(100),
            child: titleBottom!,
          )
        : null;

    final titleLeader = (leader != null) ? leader : null;

    return AppBar(
      backgroundColor: appBarBackgroundColor ?? Colors.white,
      elevation: 0,
      centerTitle: centerTitle ?? true,
      title: (title != null)
          ? Text(
              title!,
              style: TextStyle(
                color: AppColors.black,
                fontWeight: AppFonts.fontWeight600,
                fontSize: titleFontSize ?? 16,
              ),
            )
          : customTitleWidget,
      bottom: bottomWidget,
      leading: titleLeader,
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            children: actions ?? [],
          ),
        ),
      ],
      scrolledUnderElevation: scrolledUnderElevation ?? 0,
    );
  }
}
