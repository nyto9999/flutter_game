import 'package:flame/components.dart';
import 'package:flame/experimental.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(GameWidget(game: MyGame()));
}

//create my game calss which has CanvasTouchDetector and onPanUpdate and onTapDown methods
class MyGame extends FlameGame with HasTappableComponents {
  MyGame() {
    add(MyCircle());
  }

  var touchPoint = Vector2.zero();

  @override
  void onTapDown(TapDownEvent event) {
    super.onTapDown(event);
    if (!event.handled) {
      touchPoint = event.canvasPosition;
    }
  }
}

// create a circle which position update by touchPoint
class MyCircle extends PositionComponent with HasGameRef<MyGame> {
  MyCircle() {
    size = Vector2.all(100);
    anchor = Anchor.center;
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);

    canvas.drawCircle(Offset.zero, 50, Paint()..color = Colors.red);
  }

  @override
  void update(double dt) {
    super.update(dt);
    position = gameRef.touchPoint;
  }
}
