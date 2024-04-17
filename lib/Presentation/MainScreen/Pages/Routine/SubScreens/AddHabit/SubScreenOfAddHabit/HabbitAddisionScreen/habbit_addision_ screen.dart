import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:HabitUp/CommonMethods/Variable.dart';
import 'package:HabitUp/LocalStorage/SharedPref/Sharedpref.dart';
import 'package:HabitUp/Presentation/MainScreen/Pages/Routine/SubScreens/AddHabit/SubScreenOfAddHabit/HabbitAddisionScreen/habit_adision_bloc.dart';
import 'package:HabitUp/Widgets/BottomSheet/Duration/duration_bloc.dart';
import 'package:HabitUp/Widgets/BottomSheet/Duration/duration_of_habit.dart';
import 'package:HabitUp/Widgets/BottomSheet/Reminder/reminder.dart';
import 'package:HabitUp/Widgets/BottomSheet/Reminder/reminder_bloc.dart';
import 'package:HabitUp/Widgets/BottomSheet/RepeatsEveryDay/bottom_sheet_bloc.dart';
import 'package:intl/intl.dart';
import '../../../../../../../../CommonMethods/InputValidator.dart';
import '../../../../../../../../CommonMethods/Methods.dart';
import '../../../../../../../../FirebaseFunctionality/DatabaseFeatures.dart';
import '../../../../../../../../ScheduleNotifications/notification_scheduler.dart';
import '../../../../../../../../Widgets/BottomSheet/IconChangeBottomSheet/icon_change_bottomsheet.dart';
import '../../../../../../../../Widgets/BottomSheet/RepeatsEveryDay/bottom_sheet.dart';
import '../../../../../../../../Widgets/BottomSheet/TagBottomSheet/tag_bottom_sheet.dart';
import '../../../../../../../../Widgets/CustomDialogBox.dart';
import '../../../../../Progress/progress_bloc.dart';
import '../../../../routine_bloc.dart';
import '../../../stacking_cards.dart';

class HabbitAddisionScreen extends StatefulWidget {
  const HabbitAddisionScreen({super.key});

  @override
  State<HabbitAddisionScreen> createState() => _HabbitAddisionScreenState();
}

class _HabbitAddisionScreenState extends State<HabbitAddisionScreen> {
  String SelectedHabitname = selectedHabit;
  @override
  Widget build(BuildContext context2) {
    late TextEditingController controller =
        TextEditingController(text: SelectedHabitname);
    late TextEditingController SubtaskController =
        TextEditingController();
    late TextEditingController Unit = TextEditingController(
        text: target);

    return BlocBuilder<HabitAdisionBloc, HabitAdisionState>(
      builder: (context, state) {

        String habitIcon = SelectedHabitIcon;
        SelectedIndex=SelectedColorIndex;

        // Target of the habit
        List<Color> colors = [
          const Color(0xFF9D6BCE),
          const Color(0xFFF36C00),
          const Color(0xFFA8E32C),
          const Color(0xFF01BBF6),
          const Color(0xFFD03C91),
          const Color(0xFFFEF656),
          const Color(0xFFFE8596),
          const Color(0xFFF69140),
          const Color(0xFFCCF379),
          const Color(0xFF9EB8DD),
          const Color(0xFFFDD7F0),
          const Color(0xFFF5EDC9),
        ];
        late Map<String,List<int>>datesOnwhichTheHabbitsAreList={
          "January":[],
          "February":[],
          "March":[],
          "April":[],
          "May":[],
          "June":[],
          "July":[],
          "August":[],
          "September":[],
          "October":[],
          "November":[],
          "December":[],
        };
        List<String> reminder=[];
        List<String> colorsforsaving = [
            "0xFF9D6BCE",
           "0xFFF36C00",
           "0xFFA8E32C",
           "0xFF01BBF6",
           "0xFFD03C91",
           "0xFFFEF656",
           "0xFFFE8596",
           "0xFFF69140",
           "0xFFCCF379",
           "0xFF9EB8DD",
           "0xFFFDD7F0",
           "0xFFF5EDC9",
        ];
        List<String> SubIcons = [
          "assets/ImagesY/RoutineScreen/AddhabbitIcons/Repeats_Every_Day.svg",
          "assets/ImagesY/RoutineScreen/AddhabbitIcons/Clock_icon.svg",
          "assets/ImagesY/RoutineScreen/AddhabbitIcons/No_Reminder_Icon.svg",
          "assets/ImagesY/RoutineScreen/AddhabbitIcons/Morning_Routinetag.svg"
        ];
        List<bool> isSelected = List.generate(
            12,
            (index) => index == SelectedColorIndex
                ? true
                : false); // List to track selected state
        if (state is SelectedColorState) {
          isSelected =
              List.generate(12, (index) => index == state.index ? true : false);
          SelectedIndex = state.index;
          SelectedHabitIcon = state.icon;
          target = state.target;
          habitIcon = state.icon;
          Subtasks=state.Subtasks;
        }
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            leading: Padding(
              padding: const EdgeInsets.only(left: 5),
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.close),
                color: Theme.of(context).textTheme.bodyMedium?.color,
              ),
            ),
            actions: [
              Padding(
                  padding: const EdgeInsets.only(right: 10, left: 10),
                  child: TextButton(
                    onPressed: () async {
                      if(doesHabitExist(userhabitScreenController.UserHabit.value[SelectedCatagory]==null?[]:userhabitScreenController.UserHabit.value[SelectedCatagory], "$SelectedHabitname")==true){
                        ScaffoldMessenger.of(context).showSnackBar(   SnackBar(

                            backgroundColor: Theme.of(context).inputDecorationTheme.fillColor,
                            shape: const RoundedRectangleBorder(
                              // side: BorderSide(width: borderWidth, color: borderColor),
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                            ),
                            content: Text("Habit With This Name Already Exist Please Change The Tame OR Change The Habit",style: TextStyle(color: Theme.of(context).textTheme.bodyMedium?.color,),)));
                      }else{
                        if(checkIfAnyHabitsSet(datesOnwhichTheHabbitsAreSet)){
                          print("if dates exist");
                          userhabitScreenController.UserHabit.value.putIfAbsent(SelectedCatagory, () => []);

                          datesOnwhichTheHabbitsAreSet.forEach((key, value) {
                            datesOnwhichTheHabbitsAreList[key]=datesOnwhichTheHabbitsAreSet[key]!.toList();

                          });
                          reminder=Reminders.toList();
                        setState(() {
                          userhabitScreenController.UserHabit.value[SelectedCatagory].add({
                            SelectedHabitname: {
                              "colors": colorsforsaving[SelectedColorIndex],
                              "icon": habitIcon,
                              "dates": datesOnwhichTheHabbitsAreList, // Convert set to list
                              "Subtasks": Subtasks.toList(),
                              "target": target,
                              "Reminders": reminder, // Convert set to list
                              "Completed": generateDateMap(),
                              "Progress": generateDateMapProgress(),
                              "startTime":startTime.isNotEmpty?startTime:"0000",
                              "endTime":endTime.isNotEmpty?endTime:"0000",
                              "Hastag":Tags[SelectedIndexfortags],
                              "logs":generateDateMapLogs(),
                              "changableunits": Habbits[SelectedCatagory]![selectedHabit]!['changableunits'],
                            }
                          });
                        });
                        }
                        else{
                          print("if dates doesn't exist");
                          addDates(
                            frequency: 1,
                            endDate: endDate.isNotEmpty?endDate:"31-12-${DateTime.now().year}",
                          );
                          userhabitScreenController.UserHabit.value.putIfAbsent(SelectedCatagory, () => []);
                          datesOnwhichTheHabbitsAreSet.forEach((key, value) {
                            datesOnwhichTheHabbitsAreList[key]=datesOnwhichTheHabbitsAreSet[key]!.toList();

                          });
                          reminder=Reminders.toList();
                          setState(() {
                            userhabitScreenController.UserHabit.value[SelectedCatagory].add({
                              SelectedHabitname: {
                                "colors": colorsforsaving[SelectedColorIndex],
                                "icon": habitIcon,
                                "dates": datesOnwhichTheHabbitsAreList, // Convert set to list
                                "Subtasks": Subtasks.toList(),
                                "target": target,
                                "Reminders": reminder, // Convert set to list
                                "Completed": generateDateMap(),
                                "Progress": generateDateMapProgress(),
                                "startTime":startTime.isNotEmpty?startTime:"0000",
                                "endTime":endTime.isNotEmpty?endTime:"0000",
                                "Hastag":Tags[SelectedIndexfortags],
                                "logs":generateDateMapLogs(),
                                "changableunits": Habbits[SelectedCatagory]![selectedHabit]!['changableunits'],
                              }
                            });
                          });
                        }
                      }



                      Sharedpref().saveData(userhabitScreenController.UserHabit.value);
                      String Uid=await Sharedpref().getUid();
                     await Sharedpref().loadData().then((value) {
                       value.forEach((key, value2) {
                         value2.forEach((element) {
                           element.forEach((key3,value3) {

                             value3.forEach((key4, value4) {
                                print('key $key4: \n value $value4');});

                            });
                         });
                       });

                       DatabaseFeatures().updateUserhabits(UserHabits: value, Uid: Uid);
                     });

                      BlocProvider.of<RoutineBloc>(contextRoutineScreen).add(ListchangeEvent(fancyCards: fancyCards,state: whichState, habits: userhabitScreenController.UserHabit.value));
                     Navigator.pushNamed(context, '/MainScreen');
                      BlocProvider.of<ProgressBloc>(contextProgress).add(Progresschangeevent(userhabitScreenController.UserHabit.value));

                    },
                    child: Text(
                      "Save",
                      style: TextStyle(
                        color: Theme.of(context).textTheme.bodyText2?.color,
                        fontSize: 16,
                        fontFamily: 'DM Sans',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                  ))
            ],
          ),
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30, bottom: 5),
                  child: GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return IconChangeBottomSheet(
                              callback: (String) {
                                habitIcon = String;
                                BlocProvider.of<HabitAdisionBloc>(context2)
                                    .add(SelectedColorEvent(
                                  SelectedIndex: SelectedIndex,
                                  properties: Properties,
                                  name: controller.text,
                                  target: target,
                                  icon: habitIcon,
                                  Subtasks: Subtasks,
                                ));
                              },
                            );
                          });
                    },
                    child: Center(
                        child: SvgPicture.asset(
                      habitIcon,
                      color: colors[SelectedIndex],
                    )),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context2,
                      builder: (context2) {
                        return CustomDialogBox(
                          title: "Enter The Habit name",
                          content: controller,
                          onClosePressed: () {
                            print(controller.text);
                           setState(() {
                             SelectedHabitname=controller.text;
                           });
                            Navigator.of(context).pop();
                          }, ButtonteText: 'save',
                        ); // Show the dialog
                      },
                    );
                  },
                  child: Text(
                    SelectedHabitname,
                    style: const TextStyle(
                      fontSize: 26,
                      fontFamily: 'DM Sans',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: SizedBox(
                    width: 350,
                    height: 120,
                    child: GridView.count(
                      crossAxisCount: 6,
                      children: List.generate(12, (index) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 13, right: 13),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                SelectedColorIndex = index;
                              });
                              BlocProvider.of<HabitAdisionBloc>(context).add(
                                  SelectedColorEvent(
                                      SelectedIndex: index,
                                      properties: Properties,
                                      name: controller.text,
                                      target: target,
                                      icon: habitIcon, Subtasks: Subtasks));
                            },
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                color: colors[index],
                                shape: BoxShape.circle,
                              ),
                              child: isSelected[index]
                                  ? const Icon(Icons.check,
                                      color: Colors.black,
                                      size:
                                          20) // Display check icon if selected
                                  : null, // Display nothing if not selected,
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 31.0),
                  child: Container(
                    width: 319,
                    height: 268,
                    child: ListView.builder(
                      itemCount: Habbits[SelectedCatagory]![selectedHabit]![
                              'properties']
                          .length, // Assuming you have 5 containers
                      itemBuilder: (context, index) {
                        // Determine the decoration based on the index

                        Decoration decoration;
                        if (index == 0) {
                          decoration = BoxDecoration(
                            color: Theme.of(context)
                                .inputDecorationTheme
                                .fillColor==Color(0xFFF0EFEA)?Color(0xFFF3F3F3):Color(0xFF292929),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                          );
                        } else if (index == Habbits[SelectedCatagory]![selectedHabit]![
                                        'properties']
                                    .length -
                                1) {
                          decoration = BoxDecoration(
                             color: Theme.of(context)
                              .inputDecorationTheme
                              .fillColor==Color(0xFFF0EFEA)?Color(0xFFF3F3F3):Color(0xFF292929),
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            ),
                          );
                        } else {
                          decoration = BoxDecoration(
                            color: Theme.of(context)
                                .inputDecorationTheme
                                .fillColor==Color(0xFFF0EFEA)?Color(0xFFF3F3F3):Color(0xFF292929),
                          );
                        }

                        return Padding(
                          padding: const EdgeInsets.only(top: 0.5),
                          child: GestureDetector(
                            onTap: () {
                              if (Properties.length == 5) {
                                if (index == 0) {
                                  if(checkIfAnyHabitsSet(datesOnwhichTheHabbitsAreSet)){}else{
                                    addDates(
                                      frequency: 1,
                                      endDate: endDate.isNotEmpty?endDate:"31-12-${DateTime.now().year}",
                                    );
                                  }
                                  showModalBottomSheet(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return BlocProvider(
                                          create: (context) =>
                                              BottomSheetBloc(),
                                          child: BottomSheetCustom(
                                            index: index,
                                            habitAddisionContext: context2,
                                          ),
                                        );
                                      });
                                } else if (index == 1) {
                                  showDialog(
                                    context: context2,
                                    builder: (context2) {
                                      return BlocProvider(
                                        create: (context2) =>
                                            HabitAdisionBloc(),
                                        child: CustomDialogBox(
                                          title: "${Properties[index]}",
                                          content: Unit,
                                          onClosePressed: () {
                                            BlocProvider.of<HabitAdisionBloc>(
                                                    context)
                                                .add(SelectedColorEvent(
                                                    SelectedIndex:
                                                        SelectedIndex,
                                                    properties: Properties,
                                                    name: SelectedHabitname,
                                                    icon: habitIcon,
                                                    target: InputValidator.validateInput(
                                                        Unit.text,
                                                        unit: Habbits[
                                                                    SelectedCatagory]![
                                                                selectedHabit]![
                                                            "changableunits"]),
                                                Subtasks: Subtasks));
                                            Navigator.of(context).pop();
                                          },
                                          ButtonteText: 'Save',
                                        ),
                                      ); // Show the dialog
                                    },
                                  );
                                } else if (index == 2) {
                                  showModalBottomSheet(
                                    isDismissible: false,
                                      enableDrag: false,
                                      context: context,
                                      builder: (BuildContext context) {
                                        return BlocProvider(
                                          create: (context) => DurationBloc(),
                                          child: DurationOfHabit(
                                            index: index,
                                            habitAddisionContext: context2,
                                          ),
                                        );
                                      });
                                } else if (index == 3) {
                                  showModalBottomSheet(
                                      isDismissible: false,
                                      enableDrag: false,
                                      context: context,
                                      builder: (BuildContext context) {
                                        return BlocProvider(
                                          create: (context) => ReminderBloc(),
                                          child: Reminder(
                                            index: index,
                                            habitAddisionContext: context2,
                                          ),
                                        );
                                      });
                                } else if (index == 4) {
                                  showModalBottomSheet(

                                      context: context,
                                      builder: (BuildContext context) {
                                        return TagBottomSheet(
                                          onClosePressed: () {},
                                          indexProperties: index,
                                          habitAddisionContext: context2, creatingNew: false,
                                        );
                                      });
                                }
                              } else if (Properties.length == 4) {
                                if (index == 0) {
                                  showModalBottomSheet(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return BlocProvider(
                                          create: (context) =>
                                              BottomSheetBloc(),
                                          child: BottomSheetCustom(
                                            index: index,
                                            habitAddisionContext: context2,
                                          ),
                                        );
                                      });
                                } else if (index == 1) {
                                  showModalBottomSheet(
                                      isDismissible: false,
                                      enableDrag: false,
                                      context: context,
                                      builder: (BuildContext context) {
                                        return BlocProvider(
                                          create: (context) => DurationBloc(),
                                          child: DurationOfHabit(
                                            index: index,
                                            habitAddisionContext: context2,
                                          ),
                                        );
                                      });
                                } else if (index == 2) {
                                  showModalBottomSheet(
                                      isDismissible: false,
                                      enableDrag: false,
                                      context: context,
                                      builder: (BuildContext context) {
                                        return BlocProvider(
                                          create: (context) => ReminderBloc(),
                                          child: Reminder(
                                            index: index,
                                            habitAddisionContext: context2,
                                          ),
                                        );
                                      });
                                } else if (index == 3) {
                                  showModalBottomSheet(

                                      context: context,
                                      builder: (BuildContext context) {
                                        return TagBottomSheet(
                                          onClosePressed: () {},
                                          indexProperties: index,
                                          habitAddisionContext: context2, creatingNew: false,
                                        );
                                      });
                                }
                              }
                            },
                            child: Container(
                                width: 319,
                                height: 42,
                                clipBehavior: Clip.antiAlias,
                                decoration: decoration,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 10),
                                  child: Container(
                                    width: 283,
                                    height: 24,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: 265,
                                          height: 24,
                                          child: Text(
                                            Properties[index],
                                            style: const TextStyle(
                                              fontSize: 16,
                                              fontFamily: 'DM Sans',
                                              fontWeight: FontWeight.w500,
                                              height: 0,
                                            ),
                                          ),
                                        ),

                                        if (Properties.length == 5)
                                          index == 1
                                              ? Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 3.0),
                                                  child: Center(
                                                      child: Text(
                                                    target,
                                                    style: const TextStyle(
                                                      fontFamily: 'DM Sans',
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  )),
                                                )
                                              : SvgPicture.asset(
                                                  SubIcons[index == 0
                                                      ? index
                                                      : index - 1],
                                                  color: Theme.of(context)
                                                      .textTheme
                                                      .headline1
                                                      ?.color,
                                                ),
                                        if (Properties.length == 4)
                                          SvgPicture.asset(
                                            SubIcons[index],
                                            color: Theme.of(context)
                                                .textTheme
                                                .headline1
                                                ?.color,
                                          ),
                                      ],
                                    ),
                                  ),
                                )),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    showDialog(
                      context: context2,
                      builder: (context2) {
                        return BlocProvider(
                          create: (context2) => HabitAdisionBloc(),
                          child: CustomDialogBox(
                            title: "Enter Subtask",
                            content: SubtaskController,
                            onClosePressed: () {
                              if(SubtaskController.text.isNotEmpty){
                                Subtasks.add(SubtaskController.text);
                                BlocProvider.of<HabitAdisionBloc>(context).add(
                                    SelectedColorEvent(
                                        SelectedIndex: SelectedIndex,
                                        properties: Properties,
                                        name: controller.text,
                                        target: target,

                                        icon: habitIcon, Subtasks: Subtasks));
                              }else{
                                ScaffoldMessenger.of(context).showSnackBar(   SnackBar(

                                    backgroundColor: Theme.of(context).inputDecorationTheme.fillColor,
                                    shape: const RoundedRectangleBorder(
                                      // side: BorderSide(width: borderWidth, color: borderColor),
                                      borderRadius: BorderRadius.all(Radius.circular(10)),
                                    ),
                                    content: Text("Please Enter The Subtask",style: TextStyle(color: Theme.of(context).textTheme.bodyMedium?.color,),)));
                              }
                              Navigator.of(context).pop();
                            },
                            ButtonteText: 'Save',
                          ),
                        ); // Show the dialog
                      },
                    );
                  },
                  child: Container(
                    width: 314,
                    height: 58,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 17),
                    clipBehavior: Clip.antiAlias,
                    decoration: Subtasks.length >= 1
                        ? ShapeDecoration(
                      color: Theme.of(context)
                          .inputDecorationTheme
                          .fillColor==Color(0xFFF0EFEA)?Color(0xFFF3F3F3):Color(0xFF292929),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20),
                                topLeft: Radius.circular(20),
                              ),
                            ),
                          )
                        : ShapeDecoration(
                      color: Theme.of(context)
                          .inputDecorationTheme
                          .fillColor==Color(0xFFF0EFEA)?Color(0xFFF3F3F3):Color(0xFF292929),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                    child: Container(
                      width: 282,
                      height: 24,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            width: 174,
                            height: 24,
                            child: Text(
                              'Add Subtask',
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'DM Sans',
                                fontWeight: FontWeight.w500,
                                height: 0,
                              ),
                            ),
                          ),
                          const SizedBox(width: 84),
                          SizedBox(
                            width: 20,
                            height: 20,
                            child: SvgPicture.asset(
                              "assets/ImagesY/RoutineScreen/PlusIcon.svg",
                              fit: BoxFit.fitHeight,
                              width: 20,
                              color: Theme.of(context).textTheme.headline1?.color,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Visibility(
                  visible:  Subtasks.length >= 1,
                  child: Container(
                    width: 314,
                    height: MediaQuery.of(context).size.height-700,
                    child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: Subtasks.length,
                        itemBuilder: (BuildContext context, index) {
                          Decoration decoration;
                          if (index == Subtasks.length-1) {
                            decoration = BoxDecoration(
                              color: Theme.of(context)
                                  .inputDecorationTheme
                                  .fillColor==Color(0xFFF0EFEA)?Color(0xFFF3F3F3):Color(0xFF292929),
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                              ),
                            );
                          } else {
                            decoration = BoxDecoration(
                              color: Theme.of(context)
                                  .inputDecorationTheme
                                  .fillColor==Color(0xFFF0EFEA)?Color(0xFFF3F3F3):Color(0xFF292929),
                            );
                          }
                          return Container(
                            clipBehavior: Clip.antiAlias,
                            decoration: decoration,
                            child: Container(
                              width: 282,
                              height: 58,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                   SizedBox(
                                    width: 174,
                                    height: 24,
                                    child: Text(
                                      Subtasks.elementAt(index),
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontFamily: 'DM Sans',
                                        fontWeight: FontWeight.w500,
                                        height: 0,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 84),
                                  GestureDetector(
                                      onTap: (){
                                        String value=Subtasks.elementAt(index);
                                        Subtasks.remove(value);
                                        BlocProvider.of<HabitAdisionBloc>(context).add(
                                            SelectedColorEvent(
                                                SelectedIndex: SelectedIndex,
                                                properties: Properties,
                                                name: controller.text,
                                                icon: habitIcon,
                                                target: target,
                                                Subtasks: Subtasks));
                                      },
                                      child: Icon(Icons.cancel,color: Colors.red,)),
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
bool doesHabitExist(List<dynamic> habitsList, String habitName) {
  // Iterate over the list of habits
  for (var habit in habitsList) {
    // Assuming each habit is a Map and has a 'name' or similar key
    if (habit is Map && habit.containsKey(habitName)) {
      return true; // Found the habit with the given name
    }
  }
  return false; // Did not find the habit
}
Map<String, bool> generateDateMap() {
  // Initialize an empty map
  Map<String, bool> dateMap = {};

  // Get today's date
  DateTime now = DateTime.now();
  // Get the end of the current year
  DateTime endOfYear = DateTime(now.year, 12, 31);

  // Loop from today to the end of the year
  for (DateTime date = now; date.isBefore(endOfYear) || date.isAtSameMomentAs(endOfYear); date = date.add(Duration(days: 1))) {
    // Format the date and add it to the map with a value of false
    String formattedDate = DateFormat('dd-MM-yyyy').format(date);
    dateMap[formattedDate] = false;
  }

  return dateMap;
}
Map<String, int> generateDateMapProgress() {
  // Initialize an empty map
  Map<String, int> dateMap = {};

  // Get today's date
  DateTime now = DateTime.now();
  // Get the end of the current year
  DateTime endOfYear = DateTime(now.year, 12, 31);

  // Loop from today to the end of the year
  for (DateTime date = now; date.isBefore(endOfYear) || date.isAtSameMomentAs(endOfYear); date = date.add(Duration(days: 1))) {
    // Format the date and add it to the map with a value of false
    String formattedDate = DateFormat('dd-MM-yyyy').format(date);
    dateMap[formattedDate] = 0;
  }

  return dateMap;
}
bool checkIfAnyHabitsSet(Map<String,Set<int>> habitsMap) {
  for (var entry in habitsMap.entries) {
    if (entry.value.isNotEmpty) {
      return true; // Found a month with at least one habit set, return true
    }
  }
  return false; // No habits found in any month, return false
}

Map<String, String> generateDateMapLogs() {
  // Initialize an empty map
  Map<String, String> dateMap = {};

  // Get today's date
  DateTime now = DateTime.now();
  // Get the end of the current year
  DateTime endOfYear = DateTime(now.year, 12, 31);

  // Loop from today to the end of the year
  for (DateTime date = now; date.isBefore(endOfYear) || date.isAtSameMomentAs(endOfYear); date = date.add(Duration(days: 1))) {
    // Format the date and add it to the map with a value of false
    String formattedDate = DateFormat('dd-MM-yyyy').format(date);
    dateMap[formattedDate] = "";
  }

  return dateMap;
}