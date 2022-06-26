import 'package:flame/components.dart';
import 'package:flame_behaviors/flame_behaviors.dart';
import 'package:overdrive_components/overdrive_components.dart';

class DriveOutBehavior extends Behavior<Car> with HasGameRef {
  @override
  void update(double dt) {
    if (parent.hasBehavior<DriveInBehavior>()) {
      parent.findBehavior<DriveInBehavior>().removeFromParent();
    }
    final car = parent.body.body;
    final target = gameRef.size.x - CarSprite.spriteSize.x;
    if (car.position.x >= target) {
      parent.removeFromParent();
    } else {
      car.applyLinearImpulse(parent.engineForce);
    }
    super.update(dt);
  }
}
