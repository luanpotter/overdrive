import 'package:flame/components.dart';
import 'package:flame_behaviors/flame_behaviors.dart';
import 'package:overdrive_components/src/entities/pneumatic_screwdriver/pneumatic_screwdriver_body_component.dart';

class PneumaticScrewdriver extends Entity {
  PneumaticScrewdriver({
    required Vector2 position,
  }) : super(
          children: [
            PneumaticScrewdriverBodyComponent(startPosition: position),
          ],
        );
  
  PneumaticScrewdriverBodyComponent get body =>
      firstChild<PneumaticScrewdriverBodyComponent>()!;

}
