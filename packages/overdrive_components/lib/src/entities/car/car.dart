import 'package:flame/components.dart';
import 'package:flame_behaviors/flame_behaviors.dart';
import 'package:overdrive_components/overdrive_components.dart';
import 'package:overdrive_components/src/entities/car/car_body_component.dart';

export 'behaviors/behaviors.dart';
export 'car_sprite.dart';

enum CarStatus {
  damaged,
  repaired,
}

class Car extends Entity with HasGameRef {
  static final carSize = Vector2(7.5, 3) * 3;

  Car._({
    required this.lane,
    required this.status,
    super.behaviors,
  }) : super(size: carSize);

  Car.damaged({required int lane, Iterable<Behavior>? behaviors})
      : this._(
          lane: lane,
          status: CarStatus.damaged,
          behaviors: behaviors,
        );

  Car.repaired({required int lane, Iterable<Behavior>? behaviors})
      : this._(
          lane: lane,
          status: CarStatus.repaired,
          behaviors: behaviors,
        );

  final engineForce = Vector2(1, 0);
  final CarStatus status;
  final int lane;

  Vector2 _computeStartPosition() {
    return Vector2(
          -Car.carSize.x,
          (1.5 + 2 * lane) * gameRef.size.y / 5,
        ) -
        carSize / 2;
  }

  @override
  Future<void>? onLoad() async {
    final position = _computeStartPosition();
    await add(CarBodyComponent(startPosition: position));
    return super.onLoad();
  }

  CarBodyComponent get body => firstChild<CarBodyComponent>()!;

  Iterable<Tire> get tires => body.children.whereType<Tire>();
}
