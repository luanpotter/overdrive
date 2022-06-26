import 'package:flame/components.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:overdrive_components/src/entities/entities.dart';
import 'package:overdrive_components/src/utils.dart';

class CarBodyComponent extends BodyComponent with ParentIsA<Car> {
  final Vector2 startPosition;

  CarBodyComponent({
    required this.startPosition,
  });

  @override
  Future<void> onLoad() async {
    final leftTirePosition = Vector2(Tire.tireSize.x / 2, Car.carSize.y);
    final rightTirePosition = Vector2(
      Car.carSize.x - (Tire.tireSize.x / 2),
      Car.carSize.y,
    );
    switch (parent.status) {
      case CarStatus.damaged:
        add(Tire.damaged(position: leftTirePosition, physics: false));
        add(Tire.normal(position: rightTirePosition, physics: false));
        break;

      case CarStatus.repaired:
        add(Tire.normal(position: leftTirePosition, physics: false));
        add(Tire.normal(position: rightTirePosition, physics: false));
        break;
    }

    await super.onLoad();
  }

  @override
  Body createBody() {
    final def = BodyDef()
      ..type = BodyType.dynamic
      ..position = startPosition;
    final body = world.createBody(def)..userData = this;

    final filter = Filter()
      ..categoryBits = 0x0010
      ..maskBits = 0xFF0F;
    final fixtureDef = FixtureDef(
      Car.carSize.toRect().toPolygonShape(),
    )
      ..restitution = 1.0
      ..filter = filter;
    body.createFixture(fixtureDef);
    return body;
  }
}
