import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../main.dart';

// Şimdilik kullanılmıyor.

final controllerFirstWord = TextEditingController();
final controllerSecondWord = TextEditingController();

class txtFieldCreate extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        mesajKutusuOlusturma('Birinci Metni Giriniz:', controllerFirstWord ),
        mesajKutusuOlusturma('İkinci Metni Giriniz:', controllerSecondWord),
      ],
    );
  }
}

mesajKutusuOlusturma(bilgiMetni, metinKutusuSecimi){
  return Padding(
    padding: EdgeInsets.only(left: 10, right: 10, top: 30, bottom: 10),
    child: TextField(
      controller: metinKutusuSecimi,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: bilgiMetni,
      ),
    ),
  );
}

