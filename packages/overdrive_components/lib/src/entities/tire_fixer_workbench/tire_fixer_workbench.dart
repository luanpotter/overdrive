import 'package:flame/components.dart';
import 'package:flame_behaviors/flame_behaviors.dart';
import 'package:overdrive_components/src/entities/entities.dart';
import 'package:overdrive_components/src/entities/tire_fixer_workbench/tire_fixer_workbench_body_component.dart';

class TireFixerWorkbench extends Entity {
  static final tireFixerWorkbenchSize = TireFixerWorkbenchBodyComponent.size;
  static final _fixingItemOffset = Vector2(4, 0);

  ItemType? _currentFixingItem;

  ItemType? get currentFixingItem => _currentFixingItem;

  set currentFixingItem(ItemType? value) {
    if (_currentFixingItem != value) {
      _currentFixingItem = value;
      final current = body.firstChild<ItemEntity>();
      if (current != null) {
        body.remove(current);
      }

      if (value != null) {
        body.add(value.spawn(position: _fixingItemOffset, physics: false));
      }
    }
  }

  TireFixerWorkbench({
    required Vector2 position,
  }) : super(
          children: [
            TireFixerWorkbenchBodyComponent(startPosition: position),
          ],
        );

  TireFixerWorkbenchBodyComponent get body =>
      firstChild<TireFixerWorkbenchBodyComponent>()!;
}
