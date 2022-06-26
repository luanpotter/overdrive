import 'package:flame/components.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:overdrive_components/src/entities/entities.dart';
import 'package:overdrive_components/src/utils.dart';

class CarBodyComponent extends BodyComponent with ParentIsA<Car> {
  final Vector2 startPosition;

  CarBodyComponent({
    required this.startPosition,
  });

  Future<void> addTire({
    required TireStatus status,
    required TireSpot spot,
  }) async {
    return add(_getTire(status, CarSprite.getTirePosition(spot)));
  }

  Tire _getTire(
    TireStatus status,
    Vector2 position,
  ) {
    switch (status) {
      case TireStatus.normal:
        return Tire.normal(position: position, physics: false);
      case TireStatus.damaged:
        return Tire.damaged(position: position, physics: false);
    }
  }

  @override
  Future<void> onLoad() async {
    await add(CarSpriteBackground());

    switch (parent.status) {
      case CarStatus.damaged:
        await addTire(status: TireStatus.damaged, spot: TireSpot.back);
        await addTire(status: TireStatus.normal, spot: TireSpot.front);
        break;

      case CarStatus.repaired:
        await addTire(status: TireStatus.normal, spot: TireSpot.back);
        await addTire(status: TireStatus.normal, spot: TireSpot.front);
        break;
    }

    await add(CarSprite.anyColor());

    await super.onLoad();
  }

  @override
  Body createBody() {
    renderBody = false;
    final def = BodyDef()
      ..type = BodyType.dynamic
      ..position = startPosition;
    final body = world.createBody(def)..userData = this;

    final filter = Filter()
      ..categoryBits = 0x0010
      ..maskBits = 0xFF0F;
    final fixtureDef = FixtureDef(
      CarSprite.spriteSize.toRect().toPolygonShape(),
    )
      ..restitution = 1.0
      ..filter = filter;
    body.createFixture(fixtureDef);
    return body;
  }
}
