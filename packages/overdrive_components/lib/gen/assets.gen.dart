/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/car_frame.png
  AssetGenImage get carFrame =>
      const AssetGenImage('assets/images/car_frame.png');

  /// File path: assets/images/car_wheel.png
  AssetGenImage get carWheel =>
      const AssetGenImage('assets/images/car_wheel.png');

  /// File path: assets/images/player.png
  AssetGenImage get player => const AssetGenImage('assets/images/player.png');

  /// File path: assets/images/reference.png
  AssetGenImage get reference =>
      const AssetGenImage('assets/images/reference.png');

  /// File path: assets/images/screw-driver-tool.png
  AssetGenImage get screwDriverTool =>
      const AssetGenImage('assets/images/screw-driver-tool.png');

  /// File path: assets/images/tire-fixer-workbench.png
  AssetGenImage get tireFixerWorkbench =>
      const AssetGenImage('assets/images/tire-fixer-workbench.png');

  /// File path: assets/images/tire_fixer.png
  AssetGenImage get tireFixer =>
      const AssetGenImage('assets/images/tire_fixer.png');

  $AssetsImagesTitleScreenGen get titleScreen =>
      const $AssetsImagesTitleScreenGen();

  /// File path: assets/images/toolbox.png
  AssetGenImage get toolbox => const AssetGenImage('assets/images/toolbox.png');
}

class $AssetsImagesTitleScreenGen {
  const $AssetsImagesTitleScreenGen();

  /// File path: assets/images/title_screen/scared_char.png
  AssetGenImage get scaredChar =>
      const AssetGenImage('assets/images/title_screen/scared_char.png');

  /// File path: assets/images/title_screen/title.png
  AssetGenImage get title =>
      const AssetGenImage('assets/images/title_screen/title.png');

  /// File path: assets/images/title_screen/wheel.png
  AssetGenImage get wheel =>
      const AssetGenImage('assets/images/title_screen/wheel.png');
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package = 'overdrive_components',
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  String get path => _assetName;

  String get keyName => 'packages/overdrive_components/$_assetName';
}
