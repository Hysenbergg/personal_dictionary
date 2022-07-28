import 'package:flutter/material.dart';
import '../screens/aboutme.dart';
import '../screens/addword.dart';
import '../screens/myList.dart';

class FlatButtonCreate extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        butonOlusturma(context, 'Kelime Ekle', MyCustomForm()),
        butonOlusturma(context, 'Listeye Göz at', MyList()),
        butonOlusturma(context, 'Hakkimda', aboutMe())
      ],
    );
  }
}

butonOlusturma(BuildContext context, txtButonName, gidilecekKonum){
  return Container(
    margin: EdgeInsets.only(top: 50),
    child: FlatButton(
      child: Text(
        txtButonName,
        style: TextStyle(fontSize: 25.0, color: Colors.black),
      ),
      color: Colors.amber,
      onPressed: () => Navigator.push(context,
          MaterialPageRoute(builder: (context) => gidilecekKonum)),
    ),
  );
}