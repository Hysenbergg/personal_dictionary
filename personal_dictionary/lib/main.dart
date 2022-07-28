import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:personal_dictionary/contents/flatbutton.dart';

Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp()); 
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Kisisel Sozluk';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Colors.amber),
        child: Center(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 100),
                  child: Text(
                    "MyDictionary",
                    style: TextStyle(
                      fontSize: 34,
                      color: Colors.black,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
                FlatButtonCreate(),
              ],
            ),
        ),
      ),
    );
  }

  Stream<List<Word>> readWords() => FirebaseFirestore.instance     // Verileri okuyarak listeye alma.
    .collection('words')
    .snapshots()
    .map((snapshot) => 
      snapshot.docs.map((doc) => Word.fromJson(doc.data())).toList());

  Future createWord({required String firstword, required String secondword}) async{    // kelimeyi dbye kaydetme.
    final docWord = FirebaseFirestore.instance.collection('words').doc();

    final word = Word(
      id: docWord.id,
      firstword: firstword,
      secondword: secondword,
    );;
    final json = word.toJson();

    await docWord.set(json);
  }
}

class Word {                        // kelimeler için olusturulan sınıf.
  String id;
  final String firstword;
  final String secondword;

  Word({                            // constructor
    this.id = '',
    required this.firstword,
    required this.secondword,
  });

  Map<String, dynamic> toJson() => {     // Sözlük yapısını kullanarak kaydediyoruz.
    'id': id,
    'firstword': firstword,
    'secondword': secondword,
  }; 

  static Word fromJson(Map<String, dynamic> json) => Word(     // Gelen verileri tanımlama.
    id: json['id'],
    firstword: json['firstword'],
    secondword: json['secondword'],
  ); 
}


