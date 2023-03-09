import 'dart:async';
import 'dart:ffi';
import 'dart:js_util';
import 'package:flutter/gestures.dart';
import 'package:flame/components.dart';

import 'package:flame/experimental.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(GameWidget(game: MyGame()));
}

class MyGame extends FlameGame with HasDraggableComponents {
  @override
  Future<void> onLoad() async {
    await super.onLoad();
  }

  @override
  void onDragEnd(DragEndEvent event) {
    super.onDragEnd(event);
    if (!event.handled) {
      print('Drag ended at ${event.toString()}');
    }
  }
}

class Star extends PositionComponent with DragCallbacks {
  final Color color;
  final Paint _paint = Paint();
  final Paint _borderPaint = Paint()
    ..color = const Color(0xFF000000)
    ..style = PaintingStyle.stroke
    ..strokeWidth = 2.0;

  final _shadowPaint = Paint()
    ..color = const Color(0x44000000)
    ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 4.0);

  late final Path _path;
  bool _isDragged = false;

  @override
  bool containsLocalPoint(Vector2 point) {
    return super.containsLocalPoint(point);
  }

  @override
  void render(Canvas canvas) {
    if (_isDragged) {
      _paint.color = color.withOpacity(0.5);
      canvas.drawPath(_path, _shadowPaint);
      canvas.drawPath(_path, _paint);
    } else {
      _paint.color = color;
      canvas.drawPath(_path, _paint);
      canvas.drawPath(_path, _borderPaint);
    }
  }

  @override
  void onDragStart(DragStartEvent event) {
    _isDragged = true;
    super.onDragStart(event);
  }
}
