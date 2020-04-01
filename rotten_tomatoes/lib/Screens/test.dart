import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchUI extends StatefulWidget {
  @override
  _SearchUIState createState() => _SearchUIState();
}

TabController controller;

class _SearchUIState extends State<SearchUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Search Movie",
          ),
        ),
      body: ListView.builder(
        itemCount: 8,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) => Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
          child: Card(
            elevation: 5.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0.0),
            ),
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: 55.0,
                          width: 55.0,
                        child: CircleAvatar(
//                          backgroundImage: NetworkImage(),
                        ),
                      ),
                      SizedBox(width: 5.0,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('bbb',
                            style: TextStyle(color: Colors.black,
                              fontWeight: FontWeight.bold,fontSize: 18.0)
                          ),
                          Text('aaa',
                              style: TextStyle(color: Colors.grey)
                          )
                        ],
                      ),
                    ],
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                    child: Row(children: <Widget>[
                      IconButton(
                          icon: new Icon(Icons.edit),
                          onPressed: () {
                            // edit
                          }),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          // delete
                        }),
                    ]),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }


}