import 'package:flutter/material.dart';
import 'package:congo_translate/providers/translate_provider.dart';
import 'package:congo_translate/screens/conversation_page.dart';
import 'package:congo_translate/screens/record_page.dart';
import 'package:provider/provider.dart';

import 'action_button.dart';

class TranslateText extends StatefulWidget {
  TranslateText({
    Key key,
    this.onTextTouched,
  }) : super(key: key);

  final Function(bool) onTextTouched;

  @override
  _TranslateTextState createState() => _TranslateTextState();
}

class _TranslateTextState extends State<TranslateText> {
  TranslateProvider _translateProvider;

  @override
  Widget build(BuildContext context) {
    _translateProvider = Provider.of<TranslateProvider>(context, listen: true);

    return Card(
      color: Colors.white,
      margin: EdgeInsets.all(0.0),
      elevation: 2.0,
      child: Container(
        height: 150.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: InkWell(
                onTap: () {
                  this.widget.onTextTouched(true);
                },
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
                  child: Text(
                    "Entrer du texte",
                    style: TextStyle(
                      color: Colors.grey[700],
                    ),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                ActionButton(
                  icon: Icons.save,
                  text: "Enregistrer",
                ),
                // ActionButton(
                //   imageIcon: AssetImage("assets/pen.png"),
                //   text: "Handwriting",
                // ),
                ActionButton(
                  icon: Icons.volume_up,
                  text: "Lire",
                  onClick: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ConversationPage(),
                      ),
                    );
                  },
                ),
                ActionButton(
                  onClick: () async {
                    var result = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RecordPage(),
                      ),
                    );

                    if (result != null && result != "") {
                      _translateProvider.setTextToTranslate(result);
                      _translateProvider.setIsTranslating(true);
                    }
                  },
                  icon: Icons.keyboard_voice,
                  text: "Voix",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
