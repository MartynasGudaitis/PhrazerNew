import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:phrazer_new/providers/category_provider.dart';
import 'package:phrazer_new/providers/phrase_provider.dart';
import 'package:phrazer_new/screens/welcome_page.dart';
import 'package:phrazer_new/services/firestore_service.dart';
import 'package:phrazer_new/styles/buttons.dart';
import 'package:phrazer_new/styles/input_fields.dart';
import 'package:provider/provider.dart';
import './styles/fonts.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firestoreService = FirestoreService();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => PhraseProvider()),
        ChangeNotifierProvider(create: (context) => CategoryProvider()),
        StreamProvider(create: (context) => firestoreService.getPhrases()),
        StreamProvider(create: (context) => firestoreService.getCategories()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Phrazer',
        theme: ThemeData(
          fontFamily: 'Arial',
          textTheme: TextTheme(
            headline: HeadlineTextStyle,
            subhead: SubheadTextStyle,
            title: TitleTextStyle,
            subtitle: SubtitleTextStyle,
            body1: Body1TextStyle,
          ),
          inputDecorationTheme: InputDecorationThemeStyle,
          buttonTheme: ButtomThemeStyle,
        ),
        home: WelcomePage(),
      ),
    );
  }
}
