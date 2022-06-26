import 'package:dartlin/dartlin.dart';
import 'package:flame/components.dart';
import 'package:flame_forge2d/flame_forge2d.dart' hide Pair;
import 'package:overdrive_components/src/utils.dart';

import '../../entities.dart';
import 'package:flame_behaviors/flame_behaviors.dart';

import 'behaviors.dart';

class TireRemoverBehavior extends Behavior<Player> with HasGameRef {
  Tire? _tire = null;
  double _cooldown = 0.0;

  Body get player => parent.body.body;

  bool get isRemoving => _tire != null;

  void start() {
    if (isRemoving) {
      return;
    }

    final closestTire = parent.gameRef.children
        .whereType<Car>()
        .expand((car) => car.tires)
        .map((tire) => Pair(tire, _computeDistanceToTire(tire)))
        .minOrNullBy((pair) => pair.value);
    if (closestTire != null && closestTire.value <= MIN_DROP_DISTANCE) {
      final tire = closestTire.key;
      final car = tire.car;
      if (car != null) {
        _tire = tire;
        _cooldown = 2.0;
      }
    }
  }

  void stop() {
    _tire = null;
    _cooldown = 0.0;
  }

  @override
  void update(double dt) {
    if (_cooldown > 0.0) {
      _cooldown -= dt;
      if (_cooldown < 0.0) {
        _cooldown = 0.0;
      }
    }

    final tire = _tire;
    if (tire == null) {
      return;
    }

    if (parent.holdingItem != ItemType.screwdriver ||
        _computeDistanceToTire(tire) > MIN_DROP_DISTANCE) {
      stop();
    }
    if (_cooldown == 0.0) {
      final car = tire.car;
      if (car != null) {
        // remove tire
        car.body.remove(tire);
        gameRef.add(
          Tire(
            status: tire.status,
            position: parent.body.body.position + Vector2(2.0, 0),
            physics: true,
          ),
        );
      }
      stop();
    }
  }

  double _computeDistanceToTire(Tire tire) {
    final tirePosition =
        tire.position + (tire.car?.body.body.position ?? Vector2.zero());
    return player.position.distanceTo(tirePosition);
  }
}
