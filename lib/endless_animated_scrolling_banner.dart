import 'package:flutter/material.dart';

class EndlessScrollingAnimatedBanner extends StatefulWidget {
  const EndlessScrollingAnimatedBanner({
    super.key,
    required this.scrollSpeed,
    this.bannerBuilder,
    this.bannerBuilder2,
  });

  final double scrollSpeed;
  final Widget Function(ScrollController)? bannerBuilder;
  final Widget Function(Offset)? bannerBuilder2;

  @override
  State<EndlessScrollingAnimatedBanner> createState() =>
      _EndlessScrollingAnimatedBannerState();
}

class _EndlessScrollingAnimatedBannerState
    extends State<EndlessScrollingAnimatedBanner>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late ScrollController _scrollController;
  late final Animation<Offset> _animation =
      Tween<Offset>(begin: Offset.zero, end: Offset(410, 0))
          .animate(_animationController);
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    )..addListener(() {
        setState(() {});

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
    if (widget.bannerBuilder != null) {
      return Center(
        child: widget.bannerBuilder!(_scrollController),
      );
    } else if (widget.bannerBuilder2 != null) {
      return Center(
        child: widget.bannerBuilder2!(_animation.value),
      );
    } else {
      return Center(child: Text("No banner builder provided"));
    }
  }
}
