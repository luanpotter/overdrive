import 'package:flame_behaviors/flame_behaviors.dart';
import 'package:overdrive_components/overdrive_components.dart';

class DriveOutBehavior extends Behavior<Car> {
  @override
  void update(double dt) {
    if (parent.position.x <= -parent.size.x) return parent.removeFromParent();
    parent.position -= parent.engineForce * dt;
    super.update(dt);
  }
}
