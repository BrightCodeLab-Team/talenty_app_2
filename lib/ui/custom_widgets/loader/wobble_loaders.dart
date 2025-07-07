import 'dart:math' as math;
import 'package:flutter/material.dart';

class WobbleLoader extends StatefulWidget {
  final Widget child;
  final Duration duration;

  const WobbleLoader({
    super.key,
    required this.child,
    this.duration = const Duration(seconds: 2),
  });

  @override
  _WobbleLoaderState createState() => _WobbleLoaderState();
}

class _WobbleLoaderState extends State<WobbleLoader>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _rotation;
  late final Animation<double> _scale;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this, duration: widget.duration)
      ..repeat();

    // Rotate: 0→-30°→0→+30°→0
    _rotation = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween(begin: 0, end: -30 * math.pi / 180),
        weight: 1,
      ), // rotate left
      TweenSequenceItem(
        tween: Tween(begin: -30 * math.pi / 180, end: 0),
        weight: 1,
      ), // back
      TweenSequenceItem(
        tween: Tween(begin: 0, end: 30 * math.pi / 180),
        weight: 1,
      ), // rotate right
      TweenSequenceItem(
        tween: Tween(begin: 30 * math.pi / 180, end: 0),
        weight: 1,
      ), // back
    ]).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    // Scale: 1→0.8→1→0.8→1
    _scale = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 1.0, end: 0.8), weight: 1),
      TweenSequenceItem(tween: Tween(begin: 0.8, end: 1.0), weight: 1),
      TweenSequenceItem(tween: Tween(begin: 1.0, end: 0.8), weight: 1),
      TweenSequenceItem(tween: Tween(begin: 0.8, end: 1.0), weight: 1),
    ]).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      child: widget.child,
      builder: (context, child) {
        return Transform.rotate(
          angle: _rotation.value,
          child: Transform.scale(scale: _scale.value, child: child),
        );
      },
    );
  }
}
