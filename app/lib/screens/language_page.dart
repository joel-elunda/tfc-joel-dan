import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';

import '../models/language.dart';
import '../components/language_list_element.dart';

class LanguagePage extends StatefulWidget {
  LanguagePage({Key key, this.title, this.isAutomaticEnabled})
      : super(key: key);

  final String title;
  final bool isAutomaticEnabled;

  @override
  _LanguagePageState createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  final TextEditingController _searchTextController = TextEditingController();

  final List<Language> _languageList = [

    Language('auto', 'Automatique', false, false, false),
    Language('fr', 'Français', true, true, true),
    Language('sw', 'Swahili', false, false, true),
    Language('ln', 'Lingala', false, false, true),

  ];

  @override
  void initState() {
    super.initState();

    // Remove the automatic element if disabled
    if (!this.widget.isAutomaticEnabled) {
      var automaticElement = this
          ._languageList
          .where((language) => language.code == 'auto')
          .toList()[0];
      this._languageList.remove(automaticElement);
    }
  }

  // Send back the selected language
  _sendBackLanguage(Language language) {
    Navigator.pop(context, language);
  }

  // Display the delete text icon if we typed text in the search input
  Widget _displayDeleteTextIcon() {
    if (this._searchTextController.text.length > 0) {
      return IconButton(
        icon: Icon(Icons.close),
        color: Colors.grey,
        onPressed: () {
          setState(() {
            _searchTextController.text = "";
          });
        },
      );
    } else {
      return null;
    }
  }

  // Display the list with header if we are not searching
  // Display the list with only languages if we are searching
  Widget _displayTheRightList() {
    if (this._searchTextController.text == "") {
      return this._displayListWithHeaders();
    } else {
      return this._displaySearchedList();
    }
  }

  // Display the language list filtered
  Widget _displaySearchedList() {
    List<Language> searchedList = this
        ._languageList
        .where((e) => e.name
            .toLowerCase()
            .contains(this._searchTextController.text.toLowerCase()))
        .toList();

    // Display
    return Expanded(
      child: ListView.builder(
        itemCount: searchedList.length,
        itemBuilder: (BuildContext ctxt, int index) {
          return LanguageListElement(
            language: searchedList[index],
            onSelect: this._sendBackLanguage,
          );
        },
      ),
    );
  }

  // Display the list with headers, means we are not searching
  Widget _displayListWithHeaders() {
    List<Language> recentLanguages =
        this._languageList.where((e) => e.isRecent).toList();

    // Render
    return Expanded(
      child: CustomScrollView(
        slivers: <Widget>[
          SliverStickyHeader(
            header: Container(
              height: 60.0,
              color: Colors.blue[600],
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              alignment: Alignment.centerLeft,
              child: Text(
                'Récemment utilisées',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, i) => LanguageListElement(
                      language: recentLanguages[i],
                      onSelect: this._sendBackLanguage,
                    ),
                childCount: recentLanguages.length,
              ),
            ),
          ),
          SliverStickyHeader(
            header: Container(
              height: 60.0,
              color: Colors.blue[600],
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              alignment: Alignment.centerLeft,
              child: Text(
                'Toutes les langues',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, i) => LanguageListElement(
                      language: this._languageList[i],
                      onSelect: this._sendBackLanguage,
                    ),
                childCount: this._languageList.length,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.widget.title),
        elevation: 0.0,
      ),
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(
              top: 12.0,
              bottom: 12.0,
              left: 8.0,
              right: 8.0,
            ),
            child: TextField(
              controller: this._searchTextController,
              onChanged: (text) {
                setState(() {});
              },
              decoration: InputDecoration(
                hintText: "Chercher",
                border: InputBorder.none,
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue[600])),
                prefixIcon: Icon(
                  Icons.search,
                  size: 24.0,
                  color: Colors.grey,
                ),
                suffixIcon: this._displayDeleteTextIcon(),
              ),
            ),
          ),
          this._displayTheRightList(),
        ],
      ),
    );
  }
}
