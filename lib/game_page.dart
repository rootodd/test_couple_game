
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'model/action_text_model.dart';


class GamePage extends StatelessWidget{

  final String player_1;
  final String player_2;

  const GamePage({Key key, this.player_1, this.player_2}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Couple Gmage Page',
      home: ChangeNotifierProvider<ActionTextModel>(
        create: (context) => ActionTextModel(),
        child: Consumer<ActionTextModel>(
          builder: (context, model, child) => Scaffold(
            appBar: AppBar(
              title: Text('ゲーム画面'),
            ),
            body: Container(
              // 背景のグラデーションを設定
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: FractionalOffset.topLeft,
                  end: FractionalOffset.bottomRight,
                  colors: [
                    const Color(0xffe4a972).withOpacity(0.6),
                    const Color(0xff9941d8).withOpacity(0.6),
                  ],
                  stops: const [
                    0.0,
                    1.0,
                  ],
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      this.player_1,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                    Text(
                      this.player_2,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                    ActionText(),
                    ElevatedButton(
                        child: Text('次のお題へ'),
                        onPressed: model.changeActionText,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}