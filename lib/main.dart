import 'dart:math';
import 'package:flutter/material.dart';
import 'package:gsheet/gsheet_crud.dart';
import 'package:gsheet/gsheet_setup.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await gSheetInit();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(title: 'Gsheet demo'),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final inputText = TextEditingController();
  final _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';

  final Random _rnd = Random();
  String? ID;

  uniqueIdGenerator() async {
    Random random = Random();
    int randomNumber = random.nextInt(1000000);

    String getRandomString(int length) =>
        String.fromCharCodes(Iterable.generate(
            length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
    ID = '$randomNumber${getRandomString(10)}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: TextFormField(
                controller: inputText,
                onChanged: (value) {},
                decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xffe4e4e4),
                      ),
                    ),
                    contentPadding: EdgeInsets.only(top: 10, left: 5),
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 11,
                      color: Color(0xffb2b2b2),
                    ),
                    fillColor: Colors.white,
                    filled: true),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: TextButton(
                  onPressed: () async {
                    // await uniqueIdGenerator();
                    // List<Map<String, dynamic>> userDetailsList = [
                    // {
                    //   'id': '$ID',
                    //   // ignore_for_file: unnecessary_null_comparison
                    //   'name': inputText == null ? '' : inputText.text
                    // }
                    // ];
                    // await insertDataIntoSheet(userDetailsList);
                    // await updateDataFromSheet();
                    await deleteDataFromSheet();
                    await readDataFromSheet();
                    setState(() {});
                  },
                  child: const Text(
                    'Save',
                    style: TextStyle(fontSize: 20),
                  )),
            ),
            ListView.builder(
                itemCount: dataFromSheet.length,
                controller: ScrollController(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Center(
                    child: Text(
                      dataFromSheet[index]['name'],
                      style: const TextStyle(fontSize: 20),
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
