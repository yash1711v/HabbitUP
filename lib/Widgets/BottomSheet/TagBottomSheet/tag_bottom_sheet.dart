import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:HabitUp/CommonMethods/Variable.dart';
import 'package:HabitUp/Presentation/MainScreen/Pages/Routine/SubScreens/AddHabit/SubScreenOfAddHabit/HabbitAddisionScreen/habit_adision_bloc.dart';

import '../../../Presentation/MainScreen/Pages/Routine/SubScreens/AddHabit/SubScreenOfAddHabit/HabbitAddisionScreen/CustomHabit/CustomHabitAdission.dart';
import '../../../Presentation/MainScreen/Pages/Routine/SubScreens/AddHabit/SubScreenOfAddHabit/HabbitAddisionScreen/CustomHabit/custom_habit_bloc.dart';

class TagBottomSheet extends StatefulWidget {
  final VoidCallback onClosePressed;
  final int indexProperties;
  final BuildContext habitAddisionContext;
  bool creatingNew;
   TagBottomSheet(
      {super.key,
      required this.onClosePressed,
      required this.indexProperties,
      required this.habitAddisionContext,
      required this.creatingNew,
      });

  @override
  State<TagBottomSheet> createState() => _TagBottomSheetState();
}

class _TagBottomSheetState extends State<TagBottomSheet> {
  final PageController _pageController = PageController();
  final TextEditingController controller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: ShapeDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40.0),
            topRight: Radius.circular(40.0),
          ),
        ),
      ),
      child:PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30.0, left: 10, right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: Icon(
                            Icons.arrow_back_ios_rounded,
                            color: Theme.of(context).textTheme.displayLarge?.color,
                          )),
                      TextButton(
                          onPressed: () {
                            _pageController.nextPage(duration: const Duration(milliseconds: 700), curve: Curves.easeIn);
                          },
                          child: const Text(
                            'Create',
                            style: TextStyle(
                              color: Color(0xFF9D6BCE),
                              fontSize: 12,
                              fontFamily: 'DM Sans',
                              fontWeight: FontWeight.w700,
                              height: 0,
                            ),
                          )),
                    ],
                  ),
                ),
                ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: Tags.length,
                    padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              SelectedIndexfortags=index;
                            });
                            if(widget.creatingNew){
                              properties[widget.indexProperties] = "${Tags[index]}";
                              BlocProvider.of<CustomHabitBloc>(
                                  widget.habitAddisionContext)
                                  .add(SelectedColorEventCustom(
                                properties: properties,
                              ));
                            }
                           else {
                                Properties[widget.indexProperties] =
                                    "${Tags[index]}";
                                BlocProvider.of<HabitAdisionBloc>(
                                        widget.habitAddisionContext)
                                    .add(SelectedColorEvent(
                                  SelectedIndex: SelectedIndex,
                                  properties: Properties,
                                  name: selectedHabit,
                                  icon: SelectedHabitIcon,
                                  target: target,
                                  Subtasks: Subtasks,
                                ));
                              }
                            },
                          child: Row(
                            children: [
                              Container(
                                width: 16,
                                height: 16,
                                clipBehavior: Clip.antiAlias,
                                decoration: const BoxDecoration(),
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 0,
                                      top: 0,
                                      child: Container(
                                        width: 16,
                                        height: 16,
                                        decoration: ShapeDecoration(
                                          shape: RoundedRectangleBorder(
                                            side:  BorderSide(
                                              width: 0.80,
                                              color: Theme.of(context).textTheme.subtitle1?.color??Colors.grey

                                            ),
                                            borderRadius:
                                            BorderRadius.circular(37.60),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 3.11,
                                      top: 3.11,
                                      child: Container(
                                        width: 9.78,
                                        height: 9.78,
                                        decoration:  ShapeDecoration(
                                          color: SelectedIndexfortags==index?const Color(0xFF9D6BCE):Colors.transparent,
                                          shape: const OvalBorder(),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        SelectedIndexfortags=index;
                                      });

                                      if(widget.creatingNew){
                                        properties[widget.indexProperties] = "${Tags[index]}";
                                        BlocProvider.of<CustomHabitBloc>(
                                            widget.habitAddisionContext)
                                            .add(SelectedColorEventCustom(
                                          properties: properties,
                                        ));
                                      }
                                      else {
                                        Properties[widget.indexProperties] =
                                        "${Tags[index]}";
                                        BlocProvider.of<HabitAdisionBloc>(
                                            widget.habitAddisionContext)
                                            .add(SelectedColorEvent(
                                          SelectedIndex: SelectedIndex,
                                          properties: Properties,
                                          name: selectedHabit,
                                          icon: SelectedHabitIcon,
                                          target: target,
                                          Subtasks: Subtasks,
                                        ));
                                      }
                                    },
                                    child: Text(Tags[index])),
                              ),
                            ],
                          ),
                        ),
                      );
                    })
              ],
            ),
          ),
           Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30.0, left: 10, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {
                          _pageController.previousPage(duration: const Duration(milliseconds: 700), curve: Curves.easeIn);
                        },
                        icon: Icon(
                          Icons.arrow_back_ios_rounded,
                          color: Theme.of(context).textTheme.displayLarge?.color,
                        )),
                    TextButton(
                        onPressed: () {
                          setState(() {
                            if(controller.text.isNotEmpty) {
                                Tags.add(controller.text);
                              }
                            });
                          setState(() {
                            SelectedIndexfortags=Tags.length-1;
                          });
                          _pageController.previousPage(duration: const Duration(milliseconds: 700), curve: Curves.easeIn);

                        },
                        child: const Text(
                          'Create',
                          style: TextStyle(
                            color: Color(0xFF9D6BCE),
                            fontSize: 12,
                            fontFamily: 'DM Sans',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        )),
                  ],
                ),
              ),

               Center(
                child: SizedBox(

                  child: TextField(
                    controller: controller,
                    maxLength: 20,
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                      fillColor: Colors.transparent,
                      border: InputBorder.none, // Removes underline
                      hintText: 'Enter Tag Name',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 26,
                        fontFamily: 'DM Sans',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                    onChanged: (value){

                    },
                    style: TextStyle(
                      color: Theme.of(context).textTheme.subtitle1?.color,
                      fontSize: 26,
                      fontFamily: 'DM Sans',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      )
    );
  }
}
