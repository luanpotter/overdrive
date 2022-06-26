import 'package:dartlin/dartlin.dart';
import 'package:flame/components.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flame_behaviors/flame_behaviors.dart';
import 'package:flame_forge2d/flame_forge2d.dart' hide Pair;
import 'package:overdrive_components/gen/assets.gen.dart';
import 'package:overdrive_components/src/entities/entities.dart';
import 'package:overdrive_components/src/entities/player/behaviors/behaviors.dart';
import 'package:overdrive_components/src/utils.dart';

class CloseToTireDetails {
  final CarSpot carSpot;
  final Tire tire;
  final double distance;

  CloseToTireDetails(this.carSpot, this.tire, this.distance);
}

class CarSpot {
  final Car car;
  final TireSpot spot;

  CarSpot(this.car, this.spot);
}

class TireScrewerBehavior extends Behavior<Player> with HasGameRef {
  Tire? _tire;
  CarSpot? _carSpot; // if null: removing tire. if set: adding tire
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
    if (closestCarTire != null && closestCarTire.value <= interactDistance) {
      final tire = closestCarTire.key;
      final car = tire.car;
      if (car != null) {
        playSound();
        _tire = tire;
        _cooldown = 2.0;
        return;
      }
    }

    final cars = parent.gameRef.children.whereType<Car>();
    final closestNonCarTire = parent.gameRef.children
        .whereType<Tire>()
        .expand(
          (tire) => cars.expand((car) => _computeDistanceToCar(car, tire)),
        )
        .minOrNullBy<num>((details) => details.distance);
    if (closestNonCarTire != null &&
        closestNonCarTire.distance <= interactDistance) {
      final tire = closestNonCarTire.tire;
      if (tire.car == null) {
        playSound();
        final closestCar = closestNonCarTire.carSpot;
        _tire = tire;
        _cooldown = 2.0;
        _carSpot = closestCar;
      }
    }
  }

  List<CloseToTireDetails> _computeDistanceToCar(Car car, Tire tire) {
    final tireBody = tire.body;
    if (tireBody == null) {
      return [];
    }

    final carPosition = car.body.body.position;
    return TireSpot.values.map((spot) {
      final offset = CarSprite.getTirePosition(spot);
      final distance =
          (carPosition + offset).distanceTo(tireBody.body.position);
      return CloseToTireDetails(CarSpot(car, spot), tire, distance);
    }).toList();
  }

  void stop() {
    _tire = null;
    _cooldown = 0.0;
  }

  void playSound() {
    FlameAudio.play(
      'packages/overdrive_components/${Assets.sfx.screwDriver}',
    );
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
        _computeDistanceToTire(tire) > interactDistance) {
      stop();
    }
    if (_cooldown == 0.0) {
      final existingCarSpot = _carSpot;
      if (existingCarSpot == null) {
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
        existingCarSpot.car.body.addTire(
          status: tire.status,
          spot: existingCarSpot.spot,
        );
      }
      stop();
    }
  }

  double _computeDistanceToTire(Tire tire) {
    final sprite = tire.sprite;
    if (sprite == null) {
      return double.maxFinite;
    }
    final tirePosition =
        sprite.position + (tire.car?.body.body.position ?? Vector2.zero());
    return player.position.distanceTo(tirePosition);
  }
}
