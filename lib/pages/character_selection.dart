import 'package:flutter/material.dart';
import 'package:overdrive/components/header.dart';
import 'package:overdrive_components/gen/assets.gen.dart';
import 'package:overdrive_components/overdrive_components.dart';

class CharacterSelection extends StatefulWidget {
  @override
  State<CharacterSelection> createState() => _CharacterSelectionState();
}

class _CharacterSelectionState extends State<CharacterSelection> {
  late CharacterType player1 = CharacterType.FEMALE1;
  late CharacterType player2 = CharacterType.EMPTY;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Header(
              title: 'Select your character',
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Player 1',
                    style: TextStyle(
                      fontFamily: 'Monoton',
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
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
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  char.value,
                                  width: 100,
                                  height: 70,
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Radio(
                                  value: char.key,
                                  groupValue: player1,
                                  onChanged: (value) {
                                    setState(
                                      () => player1 = value as CharacterType,
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
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Player 2',
                    style: TextStyle(
                      fontFamily: 'Monoton',
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
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
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.close,
                                size: 70,
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Radio(
                                value: CharacterType.EMPTY,
                                groupValue: player2,
                                onChanged: (value) {
                                  setState(
                                    () => player2 = value as CharacterType,
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
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  char.value,
                                  width: 100,
                                  height: 70,
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Radio(
                                  value: char.key,
                                  groupValue: player2,
                                  onChanged: (value) {
                                    setState(
                                      () => player2 = value as CharacterType,
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
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Let\'s play',
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
  }
}

Map<CharacterType, String> get characterTypes => {
      CharacterType.FEMALE1: Assets.images.characters.female1.keyName,
      CharacterType.FEMALE2: Assets.images.characters.female2.keyName,
      CharacterType.FEMALE3: Assets.images.characters.female3.keyName,
      CharacterType.MALE1: Assets.images.characters.male1.keyName,
      CharacterType.MALE2: Assets.images.characters.male2.keyName,
      CharacterType.MALE3: Assets.images.characters.male3.keyName,
    };
