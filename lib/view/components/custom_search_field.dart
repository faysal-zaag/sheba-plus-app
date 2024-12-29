import 'dart:async';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:sheba_plus/utils/constant/app_colors.dart';
import 'package:sheba_plus/view/components/custom_text_field.dart';
import 'package:sheba_plus/view/profile/profile_screen_text.dart';

class CustomSearchField extends StatefulWidget {
  final TextEditingController searchController;
  final VoidCallback onSearch;

  const CustomSearchField({super.key, required this.searchController, required this.onSearch});

  @override
  State<CustomSearchField> createState() => _CustomSearchFieldState();
}

class _CustomSearchFieldState extends State<CustomSearchField> {
  Timer? _debounceTimer;

  @override
  void initState() {
    super.initState();
    widget.searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _debounceTimer?.cancel();
    widget.searchController.removeListener(_onSearchChanged);
    super.dispose();
  }

  void _onSearchChanged() {
    // Cancel the previous timer if it exists
    if (_debounceTimer?.isActive ?? false) {
      _debounceTimer!.cancel();
    }

    // Start a new timer
    _debounceTimer = Timer(const Duration(seconds: 1), () {
      widget.onSearch();
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      controller: widget.searchController,
      suffixIcon: Icon(
        PhosphorIcons.magnifyingGlass(),
        color: AppColors.paragraph,
      ),
      hintText: ProfileScreenTexts.searchByTicketNumber,
    );
  }
}
