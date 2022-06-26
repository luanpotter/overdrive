import 'package:flutter/material.dart';
import 'package:overdrive/components/header.dart';
import 'package:overdrive_components/gen/assets.gen.dart';
import 'package:overdrive_components/overdrive_components.dart';

class CharacterSelection extends StatefulWidget {
  const CharacterSelection({super.key});

  @override
  State<CharacterSelection> createState() => _CharacterSelectionState();
}

class _CharacterSelectionState extends State<CharacterSelection> {
  late CharacterType player1 = CharacterType.female_1;
  late CharacterType player2 = CharacterType.empty;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Header(
              title: 'Select your character',
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'Player 1',
                    style: TextStyle(
                      fontFamily: 'Monoton',
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 150,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ...characterTypes.entries.map(
                          (char) => Padding(
                            padding: const EdgeInsets.only(right: 10.0),
                            child: Column(
                              children: [
                                Image.asset(
                                  char.value,
                                  width: 100,
                                  height: 70,
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                Radio(
                                  value: char.key,
                                  groupValue: player1,
                                  onChanged: (value) {
                                    setState(
                                      () => player1 = value! as CharacterType,
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    'Player 2',
                    style: TextStyle(
                      fontFamily: 'Monoton',
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 150,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 20.0),
                          child: Column(
                            children: [
                              const Icon(
                                Icons.close,
                                size: 70,
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Radio(
                                value: CharacterType.empty,
                                groupValue: player2,
                                onChanged: (value) {
                                  setState(
                                    () => player2 = value! as CharacterType,
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                        ...characterTypes.entries.map(
                          (char) => Padding(
                            padding: const EdgeInsets.only(right: 20.0),
                            child: Column(
                              children: [
                                Image.asset(
                                  char.value,
                                  width: 100,
                                  height: 70,
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                Radio(
                                  value: char.key,
                                  groupValue: player2,
                                  onChanged: (value) {
                                    setState(
                                      () => player2 = value! as CharacterType,
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: ElevatedButton(
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    "Let's play",
                    style: TextStyle(fontSize: 30),
                  ),
                ),
                onPressed: () {
                  showDialog<void>(
                    context: context,
                    builder: (_) => AlertDialog(
                      alignment: Alignment.center,
                      scrollable: true,
                      content: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'How to play',
                            style: TextStyle(
                              fontSize: 50,
                              fontFamily: 'Monoton',
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          const Text(
                            'Player 1',
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'Monoton',
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          const Text(
                            'Movements: WASD / Run: H',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                          const Text(
                            'Use tools: T',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                          const Text(
                            'Hold objects: G',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                          if (player2 != CharacterType.empty) ...[
                            const SizedBox(
                              height: 30,
                            ),
                            const Text(
                              'Player 2',
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'Monoton',
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            const Text(
                              'Movements: arrows / Run: K',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                            const Text(
                              'Use tools: ;',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                            const Text(
                              'Hold objects: L',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                          ],
                          const SizedBox(
                            height: 50,
                          ),
                          Center(
                            child: ElevatedButton(
                              child: const Padding(
                                padding: EdgeInsets.all(16.0),
                                child: Text(
                                  'Play',
                                  style: TextStyle(fontSize: 30),
                                ),
                              ),
                              onPressed: () => Navigator.of(context).pushNamed(
                                '/game',
                                arguments: {
                                  'player1': player1,
                                  'player2': player2,
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Map<CharacterType, String> get characterTypes => {
      CharacterType.female_1: Assets.images.characters.female1.keyName,
      CharacterType.female_2: Assets.images.characters.female2.keyName,
      CharacterType.female_3: Assets.images.characters.female3.keyName,
      CharacterType.male_1: Assets.images.characters.male1.keyName,
      CharacterType.male_2: Assets.images.characters.male2.keyName,
      CharacterType.male_3: Assets.images.characters.male3.keyName,
    };
