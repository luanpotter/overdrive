/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  $AssetsImagesCarGen get car => const $AssetsImagesCarGen();
  AssetGenImage get carFrame =>
      const AssetGenImage('assets/images/car_frame.png');
  AssetGenImage get carSpot =>
      const AssetGenImage('assets/images/car_spot.png');
  AssetGenImage get carWheel =>
      const AssetGenImage('assets/images/car_wheel.png');
  AssetGenImage get floorPattern =>
      const AssetGenImage('assets/images/floor_pattern.png');
  AssetGenImage get player => const AssetGenImage('assets/images/player.png');
  AssetGenImage get reference =>
      const AssetGenImage('assets/images/reference.png');
  AssetGenImage get screwDriverTool =>
      const AssetGenImage('assets/images/screw-driver-tool.png');
  AssetGenImage get tireFixerWorkbench =>
      const AssetGenImage('assets/images/tire-fixer-workbench.png');
  AssetGenImage get tireFixer =>
      const AssetGenImage('assets/images/tire_fixer.png');
  $AssetsImagesTitleScreenGen get titleScreen =>
      const $AssetsImagesTitleScreenGen();
  AssetGenImage get toolbox => const AssetGenImage('assets/images/toolbox.png');
}

class $AssetsSfxGen {
  const $AssetsSfxGen();

  String get carArriving => 'assets/sfx/car_arriving.mp3';
  String get carLeaving => 'assets/sfx/car_leaving.mp3';
  String get screwDriver => 'assets/sfx/screw_driver.mp3';
  String get tireFixer => 'assets/sfx/tire_fixer.mp3';
}

class $AssetsImagesCarGen {
  const $AssetsImagesCarGen();

  AssetGenImage get carBack =>
      const AssetGenImage('assets/images/car/car_back.png');
  AssetGenImage get carFrontBlue =>
      const AssetGenImage('assets/images/car/car_front_blue.png');
  AssetGenImage get carFrontCyan =>
      const AssetGenImage('assets/images/car/car_front_cyan.png');
  AssetGenImage get carFrontGreen =>
      const AssetGenImage('assets/images/car/car_front_green.png');
  AssetGenImage get carFrontRed =>
      const AssetGenImage('assets/images/car/car_front_red.png');
  AssetGenImage get carFrontYellow =>
      const AssetGenImage('assets/images/car/car_front_yellow.png');
  AssetGenImage get tyre => const AssetGenImage('assets/images/car/tyre.png');
  AssetGenImage get tyreDamaged =>
      const AssetGenImage('assets/images/car/tyre_damaged.png');
}

class $AssetsImagesTitleScreenGen {
  const $AssetsImagesTitleScreenGen();

  AssetGenImage get scaredChar =>
      const AssetGenImage('assets/images/title_screen/scared_char.png');
  AssetGenImage get title =>
      const AssetGenImage('assets/images/title_screen/title.png');
  AssetGenImage get wheel =>
      const AssetGenImage('assets/images/title_screen/wheel.png');
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsSfxGen sfx = $AssetsSfxGen();
}

class AssetGenImage extends AssetImage {
  const AssetGenImage(String assetName)
      : super(assetName, package: 'overdrive_components');

  Image image({
    Key? key,
    ImageFrameBuilder? frameBuilder,
    ImageLoadingBuilder? loadingBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? width,
    double? height,
    Color? color,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    FilterQuality filterQuality = FilterQuality.low,
  }) {
    return Image(
      key: key,
      image: this,
      frameBuilder: frameBuilder,
      loadingBuilder: loadingBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      width: width,
      height: height,
      color: color,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      filterQuality: filterQuality,
    );
  }

  String get path => assetName;
}
