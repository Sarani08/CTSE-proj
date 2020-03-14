import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => new _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  bool showFirst = true;

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Pyxy",
        style: GoogleFonts.pacifico(),
        // TextStyle(
        //   GoogleFonts.pacifico(),
        //   fontStyle: FontStyle.italic,
        //   fontSize: 18.0,
        // ),
        ),
      ),
      drawer: Drawer(),
      body: new Center(

      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        onPressed: () => {},
        child: Icon(Icons.person, color: Colors.white, size: 40.0,),
      ),
    );
  }
}
