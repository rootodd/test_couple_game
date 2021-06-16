
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CoupleGenModel extends ChangeNotifier{

  // 初期値
  String _player_1 = '女性の名前';
  String _player_2 = '男性の名前';

  // ノーマルに変更
  void changeGenN() {
    _player_1 = '女性の名前';
    _player_2 = '男性の名前';
    notifyListeners();
  }

  // ゲイに変更
  void changeGenG() {
    _player_1 = '男性の名前';
    _player_2 = '男性の名前';
    notifyListeners();
  }

  // レズビアンに変更
  void changeGenL() {
    _player_1 = '女性の名前';
    _player_2 = '女性の名前';
    notifyListeners();
  }
}

// player1のテキスト
class CoupleGenText1 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Text(
      '${Provider.of<CoupleGenModel>(context)._player_1}',
      style: TextStyle(
        color: Colors.white,
      ),
    );
  }
}

// player2のテキスト
class CoupleGenText2 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Text(
      '${Provider.of<CoupleGenModel>(context)._player_2}',
      style: TextStyle(
        color: Colors.white,
      ),
    );
  }
}