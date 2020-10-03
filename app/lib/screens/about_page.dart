import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {


  AboutPage(String title) {
    this.title = title;
  }
  
  String title; 
  String about  = "Congo Translate est une application de traduction des langues étrangères en langues nationales parlées en République Démocratique de Congo.";
  
  String also = "C'est un application capable de palier aux contraintes de communication pouvant subvenir lors des échanges entre des personnes des langues étrangères à celles des langues locales.";
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        centerTitle: true,
        title: Text(title),
        actions: [],
      ),
      body: Column(
        
        children: <Widget>[
          Padding(padding: EdgeInsets.all(50)),
          Center(
            child:
            Text('Congo Traslate',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey[700],
                fontSize: 25
              ),
              maxLines: 254,
            ),   
          ),

          Text('version 1.0',
            textAlign: TextAlign.center, 
            style: TextStyle(
              color: Colors.grey[700],
              fontSize: 15,
            ),
            maxLines: 254,
          ),  

          Padding(padding: EdgeInsets.only(top: 20)),
          
          Text(about,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey[700],
                fontSize: 15,
              ),
            
              maxLines: 254,
            ),  
         
          Padding(padding: EdgeInsets.only(top: 30)),
          
          Text(also,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey[700],
                fontSize: 17,
              ),
            
              maxLines: 254,
            ),  
         
          Padding(padding: EdgeInsets.only(top: 30)),
          Icon(Icons.translate, size: 65.0, color: Colors.blue,)
          ],
        ),
        
    
    );
  }
  
  
}

