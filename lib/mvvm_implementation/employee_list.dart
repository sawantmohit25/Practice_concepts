import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sembast_app/mvvm_implementation/animation_employee_details.dart';
import 'package:sembast_app/mvvm_implementation/custom_route_scaletransition.dart';
import 'package:sembast_app/mvvm_implementation/custom_route_slidetransition.dart';
import 'package:sembast_app/mvvm_implementation/employee_model.dart';
import 'package:sembast_app/mvvm_implementation/employee_viewmodel.dart';
import 'package:sembast_app/mvvm_implementation/route_animation_screen.dart';
class EmployeeList extends StatefulWidget {
  @override
  _EmployeeListState createState() => _EmployeeListState();
}

class _EmployeeListState extends State<EmployeeList> {
  List<Widget> _animatedList=[];

  final GlobalKey<AnimatedListState> _listKey=GlobalKey<AnimatedListState>();

  Tween<Offset> _offset =Tween(begin: Offset(1,0),end: Offset(0,0));
  double _opacity=0;


  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp)async{
      List<EmployeeModel> providerValue=await Provider.of<EmployeeListViewModel>(context,listen: false).fetchUsers();
      // var listValue=Provider.of<EmployeeListViewModel>(context,listen: false).employeeList;
      addListItems(providerValue);
         });
      Future.delayed(Duration(seconds: 3),(){
        setState(() {
          _opacity=1;
        });
      });
    // TODO: implement initState
    super.initState();
  }
  Widget buildList(EmployeeModel element){
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 10.0,
      color:Colors.amberAccent,
      child: ListTile(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder:(context) => EmployeeDetails(firstName:element.firstName,lastName:element.lastName,email:element.email,avatar:element.avatar,)));
        },
        leading:CircleAvatar(backgroundColor:Colors.amberAccent,child:Hero(tag:'image-${element.firstName}',child: Image.network(element.avatar,)),),
        title: Row(
          children: [
            Text(element.firstName),
            SizedBox(width: 5.0,),
            Text(element.lastName),
          ],
        ),
        subtitle: Text(element.email),
      ),
    );
  }
  void addListItems(List<EmployeeModel> data){
    print('mand${data}');
    Future ft =Future((){});
    data.forEach(( EmployeeModel element) {
      ft=ft.then((_){
        return Future.delayed(const Duration(milliseconds:150),(){
          _animatedList.add(buildList(element));
          print('mandar${_animatedList}');
          _listKey.currentState.insertItem(_animatedList.length-1);
        });
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MVVM implemetation'),
        backgroundColor: Colors.amber,
        centerTitle: true,
      ),
      body:Column(
        children: [
          AnimatedOpacity(duration:Duration(seconds:3),opacity:_opacity,child: Text('Employees Information',style: TextStyle(color:Colors.black,fontSize: 30),)),
          SizedBox(height: 20,),
          Container(
            child:AnimatedList(
                  shrinkWrap: true,
                    key: _listKey,
                    initialItemCount:_animatedList.length,
                    itemBuilder:(context,index,animation){
                  return SlideTransition(
                    position:animation.drive(_offset),
                    child:_animatedList[index],
                  );
                }),
          ),
          SizedBox(height:20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              RaisedButton(
                onPressed: (){
                  Navigator.push(context,
                      CustomScaleRoute(widget:RouteAnimationScreen()));
                },
              color:Colors.yellow,child: Text('Scale Transition'),),
              RaisedButton(
                onPressed: (){
                  Navigator.push(context,
                    CustomRoute(widget:RouteAnimationScreen()));
                  },
                color:Colors.yellow,child: Text('Slide Transition'),),
            ],
          )
        ],
      ),
    );
  }
}
