import 'package:flame/components.dart';

import '../item_type.dart';
import 'pneumatic_screwdriver_body_component.dart';

class PneumaticScrewdriver extends ItemEntity {
  PneumaticScrewdriver({
    required Vector2 position,
  }) : super(
          children: [
            PneumaticScrewdriverBodyComponent(startPosition: position),
          ],
        );

  PneumaticScrewdriverBodyComponent get body =>
      firstChild<PneumaticScrewdriverBodyComponent>()!;

  @override
  Vector2 get realPosition => body.body.position;

  @override
  ItemType itemType = ItemType.screwdriver;
}
