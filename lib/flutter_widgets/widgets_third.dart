import 'package:flutter/material.dart';
class WidgetsThird extends StatefulWidget {
  @override
  _WidgetsThirdState createState() => _WidgetsThirdState();
}

class _WidgetsThirdState extends State<WidgetsThird> {
  String _targetImageUrl;
  bool visible=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:AppBar(title:Text('Draggable Widget'),),
        body:Padding(
          padding: EdgeInsets.all(55),
          child:Column(
            mainAxisAlignment:MainAxisAlignment.center,
            children: [
              Draggable<String>(data:'https://images.unsplash.com/photo-1615801626607-0bfd985f5ae9?ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDh8NnNNVmpUTFNrZVF8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
                child: visible==false?Container(
                  color: Colors.purple,
                  width: 300,
                    height: 200,
                    alignment: Alignment.center,
                    child: Image.network('https://images.unsplash.com/photo-1615801626607-0bfd985f5ae9?ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDh8NnNNVmpUTFNrZVF8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',fit: BoxFit.cover,
                    ),
                  ):Container(
                  width: 300,
                  height: 200,
                  color: Colors.purple,

                  alignment: Alignment.center,
                ),
                  feedback:Opacity(
                    opacity: 0.4,
                    child: Container(
                      width: 300,
                      height: 200,
                      alignment: Alignment.center,
                      child: Image.network('https://images.unsplash.com/photo-1615801626607-0bfd985f5ae9?ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDh8NnNNVmpUTFNrZVF8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',fit: BoxFit.cover,
                      ),
                    ),
                  ),
          ),
              SizedBox(height: 50),
              DragTarget<String>(
                onAccept:(value) {
                  setState(() {
                    visible=!visible;
                    _targetImageUrl = value;
                  });
                },
                builder: (_, candidateData, rejectedData) {
                  return Container(
                    width: 300,
                    height: 200,
                    color: Colors.amber,
                    alignment: Alignment.center,
                    child: _targetImageUrl != null
                        ? Image.network(
                      _targetImageUrl,
                      fit: BoxFit.cover,
                    )
                        : Container(),
                  );
                },
              )
            ],
          ),
        )
    );
  }
}
