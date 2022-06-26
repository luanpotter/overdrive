import 'package:dartlin/dartlin.dart';
import 'package:flame/components.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flame_behaviors/flame_behaviors.dart';
import 'package:flame_forge2d/flame_forge2d.dart' hide Pair;
import 'package:overdrive_components/gen/assets.gen.dart';
import 'package:overdrive_components/src/entities/entities.dart';
import 'package:overdrive_components/src/entities/player/behaviors/behaviors.dart';
import 'package:overdrive_components/src/utils.dart';

class TireScrewerBehavior extends Behavior<Player> with HasGameRef {
  Tire? _tire;
  Car? _car; // if null: removing tire. if set: adding tire
  double _cooldown = 0.0;

  Body get player => parent.body.body;

  bool get isScrewingTire => _tire != null;

  void start() {
    if (isScrewingTire) {
      return;
    }
    FlameAudio.audioCache.prefix = '';

    final closestCarTire = parent.gameRef.children
        .whereType<Car>()
        .expand((car) => car.tires)
        .map((tire) => Pair(tire, _computeDistanceToTire(tire)))
        .minOrNullBy<num>((pair) => pair.value);
    if (closestCarTire != null && closestCarTire.value <= minDropDistance) {
      final tire = closestCarTire.key;
      final car = tire.car;
      if (car != null) {
        FlameAudio.play(
          'packages/overdrive_components/${Assets.sfx.screwDriver}',
        );
        _tire = tire;
        _cooldown = 2.0;
        return;
      }
    }

    final cars = parent.gameRef.children.whereType<Car>();
    final closestNonCarTire = parent.gameRef.children
        .whereType<Tire>()
        .map((tire) => Pair(tire, _computeDistanceToTire(tire)))
        .where((tire) => cars.any((car) => _isCloseToCar(car, tire.key)))
        .minOrNullBy<num>((pair) => pair.value);
    if (closestNonCarTire != null &&
        closestNonCarTire.value <= minDropDistance) {
      final tire = closestNonCarTire.key;
      final car = tire.car;
      if (car == null) {
        final closestCar = cars.minOrNullBy<num>(
          (car) => _computeDistanceToCar(car, tire) ?? double.maxFinite,
        );
        _tire = tire;
        _cooldown = 2.0;
        _car = closestCar;
      }
    }
  }

  bool _isCloseToCar(Car car, Tire tire) {
    final distance = _computeDistanceToCar(car, tire);
    return distance != null && distance < minDropDistance;
  }

  double? _computeDistanceToCar(Car car, Tire tire) {
    // TODO(luan): use renan's tire positions
    final tireBody = tire.body;
    if (tireBody == null) {
      return null;
    }

    return car.body.body.position.distanceTo(tireBody.body.position);
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
        _computeDistanceToTire(tire) > minDropDistance) {
      stop();
    }
    if (_cooldown == 0.0) {
      final existingCar = _car;
      if (existingCar == null) {
        // remove from car
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
      } else {
        // re-attach to car
        gameRef.remove(tire);
        existingCar.add(
          Tire(
            status: tire.status,
            // TODO(luan) find closest spot
            position: existingCar.body.leftTirePosition,
            physics: false,
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
