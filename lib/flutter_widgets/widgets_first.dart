import 'package:flutter/material.dart';
class WidgetsFirst extends StatefulWidget {
  @override
  _WidgetsFirstState createState() => _WidgetsFirstState();
}

class _WidgetsFirstState extends State<WidgetsFirst> {
  final PageController controller=PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Container(
      child:PageView(
        scrollDirection:Axis.horizontal,
        controller:controller,
        children: [
          Scaffold(
            appBar:AppBar(backgroundColor:Colors.blue,title:Text('PageView Implementation'),),
            backgroundColor:Colors.blue[200],
            body: Center(
              child: Text('First Page',style: TextStyle(fontSize:40,color: Colors.white),),
            ),
          ),
          Scaffold(
            appBar:AppBar(backgroundColor:Colors.red,title:Text('PageView Implementation'),),
            backgroundColor:Colors.red[200],
            body: Center(
              child: Text('Second Page',style: TextStyle(fontSize:40,color: Colors.white),),
            ),
          ),
          Scaffold(
            appBar:AppBar(backgroundColor:Colors.amber,title:Text('PageView Implementation'),),
            backgroundColor:Colors.amber[200],
            body: Center(
              child: Text('Third Page',style: TextStyle(fontSize:40,color: Colors.white),),
            ),
          )

        ],
      ),
    );
  }
}
