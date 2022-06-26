import 'package:flame/events.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:overdrive/pages/stage_selection.dart';
import 'package:overdrive/pages/title_screen.dart';
import 'package:overdrive_components/overdrive_components.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';

import 'pages/credits_screen.dart';

void main() {
  Flame.images.prefix = '';

  runApp(
    MaterialApp(
      theme: overdriveTheme,
      routes: {
        '/': (context) => TitleScreen(),
        '/stages': (context) => StageSelection(),
        '/game': (context) => GameWidget(game: OverdriveGame()),
        '/credits': (context) => CreditsScreen(),
      },
    ),
  );
}

ThemeData get overdriveTheme {
  ColorScheme flexSchemeDark() => ColorScheme(
        brightness: Brightness.dark,
        primary: Color(0xff55018C),
        onPrimary: Color(0xfff5f6fe),
        primaryContainer: Color(0xff283593),
        onPrimaryContainer: Color(0xffd9dcf2),
        secondary: Color(0xff9575cd),
        onSecondary: Color(0xfff8f4ff),
        secondaryContainer: Color(0xff502ca7),
        onSecondaryContainer: Color(0xffe3daf7),
        tertiary: Color(0xff7e57c2),
        onTertiary: Color(0xfff5f1fd),
        tertiaryContainer: Color(0xff4433a4),
        onTertiaryContainer: Color(0xffe0dcf6),
        error: Color(0xffcf6679),
        onError: Color(0xff1e1214),
        errorContainer: Color(0xffb1384e),
        onErrorContainer: Color(0xfff9dde2),
        outline: Color(0xff959599),
        background: Color(0xff17171b),
        onBackground: Color(0xffe3e3e4),
        surface: Color(0xff131416),
        onSurface: Color(0xfff1f1f1),
        surfaceVariant: Color(0xff16171b),
        onSurfaceVariant: Color(0xffe3e3e4),
        inverseSurface: Color(0xfffbfbfd),
        onInverseSurface: Color(0xff0e0e0e),
        inversePrimary: Color(0xff414663),
        shadow: Color(0xff000000),
      );

  return FlexThemeData.light(
    scheme: FlexScheme.indigo,
    scaffoldBackground: Color(0xff060642),
    colorScheme: flexSchemeDark(),
    surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
    blendLevel: 20,
    appBarOpacity: 0.95,
    subThemesData: const FlexSubThemesData(
      blendOnLevel: 20,
      blendOnColors: false,
      elevatedButtonRadius: 10,
    ),
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    useMaterial3: true,
  );
}

class OverdriveGame extends Forge2DGame with HasKeyboardHandlerComponents {
  OverdriveGame()
      : super(
          gravity: Vector2.zero(),
          camera: createCamera(),
        );

  static Camera createCamera() {
    final camera = Camera();
    camera.viewport = FixedResolutionViewport(Vector2(1280, 720));
    return camera;
  }

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    add(Garage());
    add(
      Player.wasd(position: size / 2 - Vector2(10, Player.playerSize.y / 2)),
    );
    add(ToolTable(position: (size - ToolTable.toolTableSize) / 2));
    add(TireFixerWorkbench(position: size / 2 + Vector2(10, -27)));
    add(TireFixerWorkbench(position: size / 2 - Vector2(16, -24)));
    add(
      PneumaticScrewdriver(
        position: size / 2 + Vector2(-5, -27),
        physics: true,
      ),
    );
  }
}
