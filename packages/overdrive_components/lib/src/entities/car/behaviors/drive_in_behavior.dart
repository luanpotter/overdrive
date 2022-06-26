import 'package:flame/components.dart';
import 'package:flame_behaviors/flame_behaviors.dart';
import 'package:overdrive_components/overdrive_components.dart';

class DriveInBehavior extends Behavior<Car> with HasGameRef {
  @override
  void update(double dt) {
    if (parent.position.x >= gameRef.size.x / 2) return;
    parent.position += parent.velocity * dt;
    super.update(dt);
  }
}
