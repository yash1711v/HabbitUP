import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:habitup/FirebaseFunctionality/DatabaseFeatures.dart';
import 'package:habitup/LocalStorage/SharedPref/Sharedpref.dart';
import 'package:habitup/Widgets/DialogBox/Logsadition/logs_adition.dart';

import '../../../../../CommonMethods/Variable.dart';
import '../../Routine/SubScreens/stacking_cards.dart';

class ViewAllScreen extends StatefulWidget {
  String habitName;
  Map<String, dynamic> Habits;
   ViewAllScreen({super.key,required this.habitName,required this.Habits});

  @override
  State<ViewAllScreen> createState() => _ViewAllScreenState();
}

class _ViewAllScreenState extends State<ViewAllScreen> {
  Map<String, dynamic> progressMap = {};
  List<String> dates = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      progressMap=widget.Habits[widget.habitName]['logs'];
      dates=getlogs(progressMap);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Theme.of(context).scaffoldBackgroundColor,
      child: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 129,
              decoration: ShapeDecoration(
                color: convertToColor(widget.Habits[widget.habitName]['colors']),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(0),
                    topRight: Radius.circular(0),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 45.0,left: 10.0),
                    child: IconButton(onPressed: () { Navigator.of(context).pop(); }, icon: const Icon(Icons.arrow_back_ios),color: Colors.black,),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 45.0,),
                    child: Text(widget.habitName,
                        style: TextStyle(
                      color: Color(0xFF1F1F1F),
                      fontSize: 30,
                      fontFamily: 'DM Sans',
                      fontWeight: FontWeight.bold,
                      height: 0,
                          decoration: TextDecoration.none
                    ),),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 45.0,left: 175.0),
                    child: SvgPicture.asset(widget.Habits[widget.habitName]['icon'],
                    width: 30,
                    height: 30,
                    color: Colors.black,
                    ),
                  )
                ],
              ),
            ),
            SingleChildScrollView(
              child: Container(
                width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: dates.length>0?ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: dates.length,

                itemBuilder: (context, index) {
                  TextEditingController textEditingController=TextEditingController(text: widget.Habits[widget.habitName]["logs"][dates[index]]);

                  return  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                           Row(
                             children: [
                               Text(dates[index],
                                 style: TextStyle(
                                   color: Colors.grey,
                                   fontSize: 16,
                                   fontFamily: 'Inter',
                                   fontWeight: FontWeight.w700,
                                   height: 0,
                                   decoration: TextDecoration.none
                                 ),
                               ),
                               IconButton( onPressed: () {

                                 showDialog(
                                   context: context,
                                   builder: (context) {
                                     return LogsUpdate(
                                       callback: (String log) async {
                                          setState(() {
                                            widget.Habits[widget.habitName]["logs"][dates[index]]=log;
                                            progressMap=widget.Habits[widget.habitName]['logs'];
                                          });
                                          userhabitScreenController.UserHabit.value.forEach((Catogries, value) async {

                                            for(int i=0;i<value.length;i++){

                                             if(value[i].containsKey(widget.habitName)){
                                               print(value[i]);
                                              setState(() {
                                                userhabitScreenController.UserHabit.value[Catogries][i][widget.habitName]["logs"].update(dates[index], (value) =>   widget.Habits[widget.habitName]["logs"][dates[index]]);
                                              });
                                              Sharedpref().saveData(userhabitScreenController.UserHabit.value);
                                              String Uid=await Sharedpref().getUid();
                                              await Sharedpref().loadData().then((value) {
                                               DatabaseFeatures().updateUserhabits(UserHabits: value, Uid: Uid);
                                              });
                                             }
                                            }
                                          });
                                     },
                                       controller: textEditingController,
                                       date: dates[index],); // Show the dialog
                                   },
                                 );
                               }, icon: Icon(Icons.edit_outlined,color: Colors.grey),iconSize: 20,),
                             ],
                           ),
                        SizedBox(
                          width: 320,
                          child: Text(
                            widget.Habits[widget.habitName]["logs"][dates[index]],
                            style: TextStyle(
                              color: Theme.of(
                                  context)
                                  .textTheme
                                  .titleMedium
                                  ?.color,
                              fontSize: 20,
                              fontFamily: 'DM Sans',
                              fontWeight: FontWeight.w400,
                              height: 0,
                              decoration: TextDecoration.none
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Target-',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                      decoration: TextDecoration.none

                                  ),
                                ),
                                TextSpan(
                                  text: " ${widget.Habits[widget.habitName]["target"]}",
                                  style: TextStyle(

                                        color: Theme.of(
                                            context)
                                            .textTheme
                                            .titleMedium
                                            ?.color,
                                    fontSize: 16,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                      decoration: TextDecoration.none

                                  ),
                                ),
                                TextSpan(
                                  text: " ${widget.Habits[widget.habitName]['changableunits']}",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 16,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w400,
                                      height: 0,
                                      decoration: TextDecoration.none

                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Achieved-',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                      decoration: TextDecoration.none

                                  ),
                                ),
                                TextSpan(
                                  text: " ${widget.Habits[widget.habitName]["Progress"][dates[index]]}",
                                  style: TextStyle(
                                      color: Theme.of(
                                          context)
                                          .textTheme
                                          .titleMedium
                                          ?.color,
                                    fontSize: 16,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                      decoration: TextDecoration.none

                                  ),
                                ),
                                TextSpan(
                                  text: " ${widget.Habits[widget.habitName]['changableunits']}",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 16,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w400,
                                      height: 0,
                                      decoration: TextDecoration.none

                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Progress-',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                      decoration: TextDecoration.none

                                  ),
                                ),
                                TextSpan(
                                  text: progress(widget.Habits[widget.habitName]["Progress"][dates[index]].toString(),widget.Habits[widget.habitName]["target"]),
                                  style: TextStyle(
                                      color: Theme.of(
                                          context)
                                          .textTheme
                                          .titleMedium
                                          ?.color,
                                    fontSize: 16,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                      decoration: TextDecoration.none

                                  ),
                                ),
                                TextSpan(
                                  text: " %",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 16,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w400,
                                      height: 0,
                                      decoration: TextDecoration.none

                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 14.0),
                          child: Divider(
                            color: Colors.grey,
                            thickness: 0.5,),
                        )
                      ],
                    ),
                  );
                },
              ):Padding(
                padding: const EdgeInsets.only(left: 180.0,top: 350),
                child: Text(
                  'No Logs Present',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    height: 0,
                    decoration: TextDecoration.none
                  ),),
              ),),
            )
          ],
        ),
      ),
    );
  }
}


List<String> getlogs(Map<String,dynamic> logs){
  List<String> dates=[];
  logs.forEach((key, value) {
    if(value!="" && value!=null){
       dates.add(key);
    }
  });
  return dates;
}

String progress(String completed,String target){
  int tar=int.parse(target);
  int Achievements=int.parse(completed);
  return  ((Achievements/tar)*100).toStringAsFixed(0);

}