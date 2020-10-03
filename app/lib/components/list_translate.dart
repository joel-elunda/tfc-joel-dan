import 'package:flutter/material.dart';
import '../models/translate.dart';

class ListTranslate extends StatefulWidget {
  ListTranslate({Key key}) : super(key: key);

  @override
  _ListTranslateState createState() => _ListTranslateState();
}

class _ListTranslateState extends State<ListTranslate> {
  List<Translate> _items = [
  Translate(
      "Bonjour",
      "Mbote",
      false,
    ),
    Translate(
      "Comment allez-vous",
      "Boni",
      false,
    ),
    Translate(
      "Très bien, merci et vous",
      "Ngai malamu, bongo yo",
      false,
    ),
    Translate(
      "Parlez-vous français",
      "Oyebi koloba français",
      false,
    ),
    Translate(
      "Je ne comprends pas",
      "nazoyoka te",
      true,
    ),
    Translate(
      "Pardon",
      "Limbisa ngai",
      false,
    ),
    Translate(
      "Je m’appelle…",
      "Kombo na ngai...",
      true,
    ),
    Translate(
      "C’est très bon marché",
      "Ezali ya motoya te",
      false,
    ),
    Translate(
      "Pouvez-vous baisser le prix ?",
      "Kitisa talo ?",
      false,
    ),
    Translate(
      "Je voudrais acheter",
      "Nalingi sumba",
      false,
    ),
    Translate(
      "Je ne fais que regarder.",
      "Nazali ekeka.",
      false,
    ),
  ];

  Widget _displayCard(int index) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(0.0)),
      ),
      margin: EdgeInsets.only(left: 8.0, right: 8.0, top: 0.5),
      child: Container(
        height: 80.0,
        padding: EdgeInsets.only(left: 16.0, top: 16.0, bottom: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(
                    _items[index].text,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    _items[index].translatedText,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                _items[index].isStarred ? Icons.star : Icons.star_border,
                size: 23.0,
                color: _items[index].isStarred ? Colors.blue[600] : Colors.grey[700],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _items.length,
      itemBuilder: (BuildContext ctxt, int index) {
        return _displayCard(index);
      },
    );
  }
}
