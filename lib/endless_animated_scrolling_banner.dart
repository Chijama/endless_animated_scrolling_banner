import 'package:flutter/material.dart';

class EndlessScrollingAnimatedBanner extends StatefulWidget {
  const EndlessScrollingAnimatedBanner({
    super.key,
    required this.scrollSpeed,
    required this.bannerBuilder,
  });

  final double scrollSpeed;
  final Widget Function(ScrollController) bannerBuilder;

  @override
  State<EndlessScrollingAnimatedBanner> createState() =>
      _EndlessScrollingAnimatedBannerState();
}

class _EndlessScrollingAnimatedBannerState
    extends State<EndlessScrollingAnimatedBanner>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..addListener(() {
        _scrollController
            .jumpTo(_scrollController.position.pixels + widget.scrollSpeed);
        if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent) {
          _scrollController.jumpTo(0);
        }
      });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _animationController.repeat();
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: widget.bannerBuilder(_scrollController),
    );
  }
}
