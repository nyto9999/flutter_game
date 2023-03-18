import 'package:flame/game.dart';

import 'package:flutter/material.dart';
import 'package:game/drag_events_game.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(GameWidget(game: DragEventsGame()));
}
