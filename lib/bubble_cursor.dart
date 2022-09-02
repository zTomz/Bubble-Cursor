library bubble_cursor;

import 'dart:ui';

import 'package:flutter/material.dart';

class BubbleCursor extends StatefulWidget {
  final Widget? widget;
  final double? size;

  /// Normal 150
  final Color? color;

  /// Normal white
  final int? speed;

  /// Normal 2

  const BubbleCursor({
    super.key,
    this.widget,
    this.size,
    this.color,
    this.speed,
  });

  @override
  State<BubbleCursor> createState() => _BubbleCursorState();
}

class _BubbleCursorState extends State<BubbleCursor> {
  Offset mousePosition = const Offset(0, 0);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (details) {
        setState(() {
          mousePosition = details.position;
        });
      },
      onHover: (details) {
        setState(() {
          mousePosition = details.position;
        });
      },
      onExit: (details) {
        setState(() {
          mousePosition = details.position;
        });
      },
      child: Stack(
        children: [
          if (widget.widget != null) widget.widget!,
          if (mousePosition != Offset.zero)
            AnimatedPositioned(
              duration: Duration(milliseconds: (widget.speed ?? 2) * 100),
              left: mousePosition.dx - (widget.size ?? 150 / 2),
              top: mousePosition.dy - (widget.size ?? 150 / 2),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(180),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 3.5, sigmaY: 3.5),
                  child: Container(
                    width: widget.size ?? 150,
                    height: widget.size ?? 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(180),
                      border: Border.all(
                        width: 3,
                        color: Colors.grey,
                      ),
                      gradient: RadialGradient(
                        colors: [
                          Colors.transparent,
                          widget.color ?? Colors.white60
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
