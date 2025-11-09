import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

class FrameAnimation extends StatefulWidget {
  final List<List<String>> animations; // multiple animation sets
  final int fps;
  final double width;
  final double height;
  final int switchSeconds; // how often to switch animations

  const FrameAnimation({
    super.key,
    required this.animations,
    this.fps = 2,
    this.width = 150,
    this.height = 150,
    this.switchSeconds = 60, // change every 5 seconds
  });

  @override
  State<FrameAnimation> createState() => _FrameAnimationState();
}

class _FrameAnimationState extends State<FrameAnimation> {
  int _currentFrame = 0;
  int _currentAnimationIndex = 0;
  Timer? _frameTimer;
  Timer? _switchTimer;
  final Random _random = Random();

  @override
  void initState() {
    super.initState();

    // start frame timer (controls frame updates)
    _frameTimer = Timer.periodic(
      Duration(milliseconds: (1000 / widget.fps).round()),
      (timer) {
        setState(() {
          _currentFrame =
              (_currentFrame + 1) % widget.animations[_currentAnimationIndex].length;
        });
      },
    );

    // start switch timer (controls which animation set to use)
    _switchTimer = Timer.periodic(
      Duration(seconds: widget.switchSeconds),
      (timer) {
        setState(() {
          // pick a random new animation index
          int newIndex = _random.nextInt(widget.animations.length);
          // make sure it's not the same animation twice in a row
          while (newIndex == _currentAnimationIndex && widget.animations.length > 1) {
            newIndex = _random.nextInt(widget.animations.length);
          }
          _currentAnimationIndex = newIndex;
          _currentFrame = 0; // restart animation
        });
      },
    );
  }

  @override
  void dispose() {
    _frameTimer?.cancel();
    _switchTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final frames = widget.animations[_currentAnimationIndex];
    return Image.asset(
      frames[_currentFrame],
      width: widget.width,
      height: widget.height,
      fit: BoxFit.contain,
    );
  }
}
