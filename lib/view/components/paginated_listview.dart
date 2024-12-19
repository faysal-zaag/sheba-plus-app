import 'package:flutter/material.dart';
import 'package:sheba_plus/utils/constant/app_colors.dart';
import 'package:sheba_plus/view/global_texts.dart';

class PaginatedListview extends StatefulWidget {
  final Widget Function(BuildContext, int) itemBuilder;
  final double gap;
  final int itemCount;
  final int totalPages;
  final int currentPage;
  final RefreshCallback onRefresh;
  final VoidCallback onFetchNextPage;
  final bool fetchingMoreDataLoading;
  final String? noDataMessage;

  const PaginatedListview({
    super.key,
    required this.itemBuilder,
    this.gap = 12,
    required this.itemCount,
    required this.onRefresh,
    required this.onFetchNextPage,
    required this.fetchingMoreDataLoading,
    this.noDataMessage,
    required this.totalPages,
    required this.currentPage,
  });

  @override
  State<PaginatedListview> createState() => _PaginatedListviewState();
}

class _PaginatedListviewState extends State<PaginatedListview> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent && widget.currentPage < widget.totalPages) {
        widget.onFetchNextPage();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: AppColors.primary,
      displacement: 50,
      onRefresh: widget.onRefresh,
      child: widget.itemCount == 0
          ? Center(child: Text(widget.noDataMessage ?? GlobalTexts.noData))
          : ListView.separated(
              controller: _scrollController,
              itemBuilder: widget.itemBuilder,
              separatorBuilder: (_, index) => const SizedBox(
                height: 12,
              ),
              itemCount: widget.itemCount,
            ),
    );
  }
}
