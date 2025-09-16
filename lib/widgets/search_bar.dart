import 'package:flutter/material.dart';
import '../utils/constants.dart';

class CustomSearchBar extends StatefulWidget {
  final ValueChanged<String> onSearchChanged;
  final VoidCallback onSearchSubmitted;

  const CustomSearchBar({
    Key? key,
    required this.onSearchChanged,
    required this.onSearchSubmitted,
  }) : super(key: key);

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(AppDimensions.buttonBorderRadius),
        border: Border.all(color: AppColors.primaryBlue, width: 2),
      ),
      child: Row(
        children: [
          const Icon(Icons.search, color: AppColors.accentOrange),
          const SizedBox(width: 8),
          Expanded(
            child: TextField(
              controller: _controller,
              style: TextStyles.bodyText,
              decoration: InputDecoration(
                hintText: AppStrings.searchHint,
                hintStyle: const TextStyle(color: AppColors.textGrey),
                border: InputBorder.none,
              ),
              onChanged: widget.onSearchChanged,
              onSubmitted: (value) => widget.onSearchSubmitted(),
            ),
          ),
          if (_controller.text.isNotEmpty)
            IconButton(
              icon: const Icon(Icons.clear, color: AppColors.accentOrange),
              onPressed: () {
                _controller.clear();
                widget.onSearchChanged('');
              },
            ),
        ],
      ),
    );
  }
}