import 'dart:math' as math;
import 'package:flutter/material.dart'; //mathライブラリのインポート
import 'package:provider/provider.dart';

class ActionTextModel extends ChangeNotifier{

  // 初期化
  String actionText = '';

  // コンストラクタ
  ActionTextModel(){
    actionText = getActionText();
  }

  List<String> _textListSoft = [
    'キスしてください',
    '頭をなでてください',
    '足をなでてください',
    '背中にキスしてください',
    '足にキスしてください',
  ];

  // アクションテキストを取得
  String getActionText() {
    var random = math.Random();
    this.actionText = _textListSoft[random.nextInt(_textListSoft.length)];
    return actionText;
  }

  void changeActionText() {
    var random = math.Random();
    this.actionText = _textListSoft[random.nextInt(_textListSoft.length)];
    notifyListeners();
  }

}

class ActionText extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Text(
      '${Provider.of<ActionTextModel>(context).actionText}',
      style: TextStyle(
        color: Colors.white,
        fontSize: 20.0,
      ),
    );
  }
}

