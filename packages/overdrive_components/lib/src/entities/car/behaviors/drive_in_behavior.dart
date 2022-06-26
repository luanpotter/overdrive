import 'package:flame/components.dart';
import 'package:flame_behaviors/flame_behaviors.dart';
import 'package:overdrive_components/overdrive_components.dart';

class DriveInBehavior extends Behavior<Car> with HasGameRef {
  @override
  void update(double dt) {
    final car = parent.body.body;
    var target = (gameRef.size.x - Car.carSize.x) / 2;
    if (car.position.x >= target) {
      car.linearVelocity = Vector2.zero();
    } else if (target - car.position.x < 4) {
      car.applyLinearImpulse(parent.engineForce / 4);
    } else {
      car.applyLinearImpulse(parent.engineForce);
    }
    super.update(dt);
  }
}
