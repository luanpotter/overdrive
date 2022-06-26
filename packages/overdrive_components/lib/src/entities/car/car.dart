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
  Car._({
    required this.lane,
    super.behaviors,
    this.startRepaired = false,
  }) : super(size: CarSprite.spriteSize);

  Car.damaged({required int lane, Iterable<Behavior>? behaviors})
      : this._(
          lane: lane,
          behaviors: behaviors,
        );

  Car.repaired({required int lane, Iterable<Behavior>? behaviors})
      : this._(
          lane: lane,
          behaviors: behaviors,
          startRepaired: true,
        );

  final engineForce = Vector2(1, 0);
  final bool startRepaired;
  final int lane;

  late final TimerComponent timer;

  CarStatus get status {
    final hasAnyDamaged =
        tires.any((element) => element.status == TireStatus.damaged);
    return hasAnyDamaged ? CarStatus.damaged : CarStatus.repaired;
  }

  Vector2 _computeStartPosition() {
    return Vector2(
          -CarSprite.spriteSize.x,
          (1.5 + 2 * lane) * gameRef.size.y / 5,
        ) -
        CarSprite.spriteSize / 2;
  }

  @override
  Future<void> onLoad() async {
    final position = _computeStartPosition();
    await add(CarBodyComponent(startPosition: position));
    await add(
      timer = TimerComponent(
        period: 1,
        repeat: true,
        onTick: verifyLeave,
      ),
    );
    return super.onLoad();
  }

  void verifyLeave() {
    if (status == CarStatus.repaired) {
      add(DriveOutBehavior());
    }
  }

  CarBodyComponent get body => firstChild<CarBodyComponent>()!;

  Iterable<Tire> get tires => body.children.whereType<Tire>();
}
