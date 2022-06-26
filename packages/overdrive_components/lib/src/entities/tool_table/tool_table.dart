import 'package:flame/components.dart';
import 'package:flame/extensions.dart';
import 'package:flame_behaviors/flame_behaviors.dart';
import 'package:overdrive_components/src/entities/tool_table/tool_table_body_component.dart';

import '../items/items.dart';

class ToolTable extends Entity {
  static final toolTableSize = ToolTableBodyComponent.size;

  ItemType? holdingItem;

  ToolTable({required Vector2 position})
      : super(
          children: [
            ToolTableBodyComponent(position),
          ],
        );

  ToolTableBodyComponent get body => firstChild<ToolTableBodyComponent>()!;
}
