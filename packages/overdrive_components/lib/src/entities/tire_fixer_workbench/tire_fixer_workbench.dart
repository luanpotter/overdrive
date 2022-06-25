import 'package:flame/components.dart';
import 'package:flame_behaviors/flame_behaviors.dart';
import 'package:overdrive_components/src/entities/tire_fixer_workbench/tire_fixer_workbench_body_component.dart';

class TireFixerWorkbench extends Entity {
  static final tireFixerWorkbenchSize = TireFixerWorkbenchBodyComponent.size;

  TireFixerWorkbench({
    required Vector2 position,
  }) : super(
          children: [
            TireFixerWorkbenchBodyComponent(startPosition: position),
          ],
        );
  
  TireFixerWorkbenchBodyComponent get body => firstChild<TireFixerWorkbenchBodyComponent>()!;
}
