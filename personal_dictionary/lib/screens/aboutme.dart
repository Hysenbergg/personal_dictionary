import 'package:flutter/material.dart';
import 'package:personal_dictionary/contents/aboutmetxt.dart';

class aboutMe extends StatelessWidget {
  const aboutMe();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kelime Ekleme Ekrani"),
      ),
      body: AboutMeTextOlusturma(),
    );
  }
}