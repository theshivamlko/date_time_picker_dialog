import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() => runApp(MaterialApp(home: Homepage(),));


class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  String selectedTime;
  String selectedDate;
  String selectedDateTime;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Date & Time Picker Dialog"),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
mainAxisAlignment: MainAxisAlignment.center,
           children: <Widget>[

             Text(" ${selectedDate??"Selected Time"}",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w800),),
             RaisedButton(onPressed: ()=>_showDatePicker(),child: Text("Show Time Picker"),),
             Divider(),
             SizedBox(height: 50,),

             Text(" ${selectedTime??"Selected Time"}",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w800),),
             RaisedButton(onPressed: ()=>_showTimePicker(),child: Text("Show Date Picker"),),
             Divider(),

             SizedBox(height: 50,),

             Text(" ${selectedDateTime??"Selected Time"}",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w800),),

             RaisedButton(onPressed: ()=>_showDateTimePicker(),child: Text("Show Date and Time Picker"),),
        ],
        ),
      ),
    );
  }
  Future<void> _showTimePicker()async{
    final TimeOfDay picked=await showTimePicker(context: context,initialTime: TimeOfDay(hour: 5,minute: 10));
    if(picked != null)
      {
        setState(() {
          selectedTime=picked.format(context);
        });
      }
  }

  Future<void> _showDatePicker()async{
    final DateTime picked=await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(2015, 8), lastDate: DateTime(2101));
    if(picked != null)
    {
      setState(() {
        selectedDate=DateFormat("yyyy-MM-dd").format(picked);
      });
    }
  }

  Future<void> _showDateTimePicker()async
  {
    final DateTime datePicked=await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(2015, 8), lastDate: DateTime(2101));

      if(datePicked!=null)
        {
          final TimeOfDay timePicked=await showTimePicker(context: context,initialTime: TimeOfDay(hour: TimeOfDay.now().hour,minute: TimeOfDay.now().minute));
              if(timePicked !=null)
                {
                  setState(() {
                    selectedDateTime="${ DateFormat("yyyy-MM-dd").format(datePicked)}  ${timePicked.format(context)}";


                  });
                }
        }

  }
}

