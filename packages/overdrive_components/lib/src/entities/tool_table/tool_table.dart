import 'package:flame/components.dart';
import 'package:flame/extensions.dart';
import 'package:flame_behaviors/flame_behaviors.dart';
import 'package:overdrive_components/src/entities/items/items.dart';
import 'package:overdrive_components/src/entities/tool_table/tool_table_body_component.dart';

class ToolTable extends Entity {
  static final toolTableSize = ToolTableBodyComponent.size;
  static final _heldItemOffset = Vector2(1, 0);

  ItemType? _holdingItem;

  ItemType? get holdingItem => _holdingItem;

  set holdingItem(ItemType? value) {
    if (_holdingItem != value) {
      _holdingItem = value;
      final current = body.firstChild<ItemEntity>();
      if (current != null) {
        body.remove(current);
      }

      if (value != null) {
        body.add(value.spawn(position: _heldItemOffset, physics: false));
      }
    }
  }

  ToolTable({required Vector2 position})
      : super(
          children: [
            ToolTableBodyComponent(position),
          ],
        );

  ToolTableBodyComponent get body => firstChild<ToolTableBodyComponent>()!;
}
