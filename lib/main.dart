import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
        brightness: Brightness.light,

        /* light theme settings */
      ),
      darkTheme: ThemeData(
        primarySwatch: Colors.red,
        brightness: Brightness.dark,

        /* dark theme settings */
      ),
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Typer'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> mono = [
    '𝙰',
    '𝙱',
    '𝙲',
    '𝙳',
    '𝙴',
    '𝙵',
    '𝙶',
    '𝙷',
    '𝙸',
    '𝙹',
    '𝙺',
    '𝙻',
    '𝙼',
    '𝙽',
    '𝙾',
    '𝙿',
    '𝚀',
    '𝚁',
    '𝚂',
    '𝚃',
    '𝚄',
    '𝚅',
    '𝚆',
    '𝚇',
    '𝚈',
    '𝚉',
    '𝚊',
    '𝚋',
    '𝚌',
    '𝚍',
    '𝚎',
    '𝚏',
    '𝚐',
    '𝚑',
    '𝚒',
    '𝚓',
    '𝚔',
    '𝚕',
    '𝚖',
    '𝚗',
    '𝚘',
    '𝚙',
    '𝚚',
    '𝚛',
    '𝚜',
    '𝚝',
    '𝚞',
    '𝚟',
    '𝚠',
    '𝚡',
    '𝚢',
    '𝚣',
    '𝟷',
    '𝟸',
    '𝟹',
    '𝟺',
    '𝟻',
    '𝟼',
    '𝟽',
    '𝟾',
    '𝟿',
    '0',
    '!',
    '.',
    ',',
    '“',
    '‘',
    '’',
    '”',
    '"',
    '-',
    '?',
    ' '
  ];
  String raw =
      'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890!.,“‘’”"-? ';
  String sdata = "";
  final myController = TextEditingController();

  @override
  void initState() {
    super.initState();

    // Start listening to changes.
    myController.addListener(_printLatestValue);
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    // This also removes the _printLatestValue listener.
    myController.dispose();
    super.dispose();
  }

  void _printLatestValue() {
    if (myController.text.isEmpty) sdata = '';
    String character = "";
    if (myController.text.split('')[myController.text.length - 1] == ' ') {
      character += ' ';
    } else {
      myController.text.split('').forEach((ch) {
        int x = raw.split('').indexOf(ch);
        print(ch);
        print(x);
        sdata = '';
        character += mono[x];
        print(character);
      });

      setState(() {
        sdata += character;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Scaffold(
          appBar: AppBar(
            // Here we take the value from the MyHomePage object that was created by
            // the App.build method, and use it to set our appbar title.
            title: Text(widget.title),
          ),
          body: Padding(
            padding: EdgeInsets.all(10),
            // Center is a layout widget. It takes a single child and positions it
            // in the middle of the parent.
            child: Column(
              // Column is also a layout widget. It takes a list of children and
              // arranges them vertically. By default, it sizes itself to fit its
              // children horizontally, and tries to be as tall as its parent.
              //
              // Invoke "debug painting" (press "p" in the console, choose the
              // "Toggle Debug Paint" action from the Flutter Inspector in Android
              // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
              // to see the wireframe for each widget.
              //
              // Column has various properties to control how it sizes itself and
              // how it positions its children. Here we use mainAxisAlignment to
              // center the children vertically; the main axis here is the vertical
              // axis because Columns are vertical (the cross axis would be
              // horizontal).
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(
                  controller: myController,
                  maxLines: null,
                  minLines: 5,
                  keyboardType: TextInputType.text,
                  textCapitalization: TextCapitalization.sentences,
                  decoration: InputDecoration(
                    hintText: 'Enter your text',
                    suffixIcon: IconButton(
                      onPressed: () {
                        print('Clear text');
                        myController.text = '';
                        myController.clear;
                        setState(() {
                          sdata = '';
                        });
                      },
                      icon: Icon(Icons.clear),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
                  child: Text(
                    sdata,
                    style: TextStyle(fontSize: 22.0),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Row(children: [
                      Expanded(flex: 1, child: SizedBox()),
                      CupertinoButton(
                        color: Colors.red,
                        onPressed: sdata.isEmpty
                            ? null
                            : () {
                                Clipboard.setData(ClipboardData(text: sdata));
                              },
                        child: Row(children: [
                          Icon(CupertinoIcons.doc_on_doc),
                          VerticalDivider(
                            width: 10,
                          ),
                          Text('Copy'),
                          VerticalDivider(
                            width: 10,
                          ),
                        ]),
                      ),
                    ]))
              ],
            ),
          ),
          // This trailing comma makes auto-formatting nicer for build methods.
        ));
  }
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}
