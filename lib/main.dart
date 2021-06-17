import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_couple_game/model/gender_model.dart';
import 'package:flutter/services.dart';

import 'game_page.dart';

void main() {
  runApp(AppPage());
}

class AppPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // ステータスバーとナビゲーションバーを非表示
    SystemChrome.setEnabledSystemUIOverlays([]);
    return MaterialApp(
      title: 'Couple Game',
      theme: ThemeData(
        primarySwatch: Colors.red,
        scaffoldBackgroundColor: Color(0xFFb70086),
      ),
      home: CoupleGameHome(),
    );
  }
}

class CoupleGameHome extends StatelessWidget{

  String player_1 = '';
  String player_2 = '';
  int game_mode = 0;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CoupleGenModel>(
      create: (context) => CoupleGenModel(),
      child: Consumer<CoupleGenModel>(
        builder: (context, model, child) => Scaffold(
          // キーボードを表示した時にレイアウトを崩さない
          resizeToAvoidBottomInset:  false,
          body: Container(
            // 背景のグラデーション設定
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: model.changeGenN,
                        child: Text('N'),
                      ),
                      ElevatedButton(
                        onPressed: model.changeGenG,
                        child: Text('G'),
                      ),
                      ElevatedButton(
                        onPressed: model.changeGenL,
                        child: Text('L'),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(20.0),

                  ),
                  CoupleGenText1(),
                  // プレイヤー名1の入力フィールド
                  Padding(
                    padding: EdgeInsets.only(top: 10, right: 40, bottom: 0, left: 40),
                    child: TextFormField(
                      onChanged:(name_1){
                        this.player_1 = name_1;
                      },
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.legend_toggle,
                          color: Colors.white,
                        ),
                        border: OutlineInputBorder(),
//                        labelText: '女性の名前',
                        labelStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        ),
                        // 外枠の装飾
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 0, right: 40, bottom: 0, left: 40),
                    child: Text(
                      '',
                      style: TextStyle(
                          color: Colors.white
                      ),),
                  ),
                  CoupleGenText2(),
                  // プレイヤー名2の入力フィールド
                  Padding(
                    padding: EdgeInsets.only(top: 0, right: 40, bottom: 0, left: 40),
                    child: TextFormField(
                      onChanged:(name_2){
                        this.player_2 = name_2;
                      },
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.access_alarm,
                          color: Colors.white,
                        ),
                        border: OutlineInputBorder(),
//                        labelText: '男性の名前',
                        labelStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        ),
                        // 外枠の装飾
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical:   20.0,
                    ),
                    child: ElevatedButton(
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                          builder: (context) => GamePage(player_1,player_2),
                          ),
                        );
                        // ゲーム開始時にテキストフィールドのフォーカスをはずす
                        // キーボードを非表示
                        FocusScope.of(context).unfocus();
                      },
                      child: Text(
                        'ゲームスタート',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFF930020),
                        onPrimary: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 0, right: 40, bottom: 50, left: 40),
                    child: Text(
                      '',
                      style: TextStyle(
                          color: Colors.white
                      ),),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}