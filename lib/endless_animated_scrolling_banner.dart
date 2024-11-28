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
      duration: const Duration(seconds: 10),
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
    return widget.bannerBuilder(_scrollController);
  }
}

class EndlessScrollingAnimatedBanner2 extends StatefulWidget {
  const EndlessScrollingAnimatedBanner2({
    super.key,
    required this.scrollSpeed,
    required this.bannerBuilder,
  });

  final double scrollSpeed;

  final Widget Function(Offset) bannerBuilder;

  @override
  State<EndlessScrollingAnimatedBanner2> createState() =>
      _EndlessScrollingAnimatedBanner2State();
}

class _EndlessScrollingAnimatedBanner2State
    extends State<EndlessScrollingAnimatedBanner2>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  late final Animation<Offset> _animation =
      Tween<Offset>(begin: Offset.zero, end: const Offset(-500, 0))
          .animate(_animationController);
  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3000),
    )..addListener(() {
        setState(() {});
      });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _animationController.repeat();
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.bannerBuilder(_animation.value);
  }
}
