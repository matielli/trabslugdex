import 'package:flutter/material.dart';
import '../utils/constants.dart';

class ThemeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBackButton;

  const ThemeAppBar({
    Key? key,
    required this.title,
    this.showBackButton = true,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.primaryBlue,
      title: Text(
        title,
        style: TextStyles.pageTitle,
      ),
      leading: showBackButton
          ? IconButton(
              icon: const Icon(Icons.arrow_back, color: AppColors.accentOrange),
              onPressed: () => Navigator.of(context).pop(),
            )
          : null,
    );
  }
}