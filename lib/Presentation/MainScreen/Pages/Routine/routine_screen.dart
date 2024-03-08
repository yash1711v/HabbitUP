import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttermoji/fluttermojiCircleAvatar.dart';

import '../../../../Widgets/edit_avator.dart';
import '../../../../Widgets/horizontal_date.dart';

class RoutineScreen extends StatelessWidget {
  const RoutineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 65),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: GestureDetector(
                  onDoubleTap: (){
                    HapticFeedback.lightImpact();
                    EditAvator(context);
                  },
                  child: FluttermojiCircleAvatar(
                    radius: 28,
                    backgroundColor: Theme.of(context).textTheme.titleMedium?.color,
                  ),
                ),
              ),
              Row(

                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Stack(
                        children: [
                          IconButton(
                            onPressed: () {},
                            iconSize: 30,
                            icon: Icon(

                              Icons.notifications_none,
                              color: Theme.of(context).textTheme.titleMedium?.color,
                            ),
                          ),
                          Visibility(
                            visible: false,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 16.0,left: 25),
                              child: Container(
                                width: 5.47,
                                height: 5.37,
                                decoration: const ShapeDecoration(
                                  color: Color(0xFFFF0000),
                                  shape: OvalBorder(),
                                ),
                              ),

                            ),
                          ),
                        ]),
                  ),
                  IconButton(onPressed: (){}, icon:  Image.asset("assets/ImagesY/RoutineScreen/TipIg.png",width: 30,
                    height: 30,),),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: IconButton(
                      iconSize: 35,
                      onPressed: () {},
                      icon: Icon(
                        Icons.add,
                        color: Theme.of(context).textTheme.titleMedium?.color,
                      ),
                    ),
                  ),

                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 40),
          child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 140,

              child:  HorizontalCalendar()),
        )
      ],
    );
  }
}
