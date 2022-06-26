import 'package:flame/components.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flame_behaviors/flame_behaviors.dart';
import 'package:overdrive_components/gen/assets.gen.dart';
import 'package:overdrive_components/src/entities/entities.dart';

class FixTireBehavior extends Behavior<TireFixerWorkbench> with HasGameRef {

  void start() {

    if (parent.currentFixingItem == ItemType.damagedTire) {
      FlameAudio.play(
        'packages/overdrive_components/${Assets.sfx.tireFixer}',
      );
      parent.currentFixingItem = ItemType.normalTire;
    }
  }
}
