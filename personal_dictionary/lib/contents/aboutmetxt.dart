import 'package:flutter/material.dart';

class AboutMeTextOlusturma extends StatelessWidget {
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          aboutMeTxtBilgiOlusturma('Ad Soyad:', 'Hüseyin Said Zeyrek'),
          aboutMeTxtBilgiOlusturma('E-Posta:', 'huseyinsaidzeyrek@gmail.com'),
          aboutMeTxtBilgiOlusturma('Okul:', 'Mehmet Akif Ersoy Üniversitesi'),
        ],
      ),
    );
  }
}


aboutMeTxtBilgiOlusturma(firstBilgi, secondBilgi){
  return Container(
    padding: EdgeInsets.only(top: 50, bottom: 25),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(firstBilgi, style: TextStyle(
          fontSize: 20,
        )),
        Text(secondBilgi, style: TextStyle(
          fontSize: 20,
          ),
        )
      ],
    ),
  );
}