import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IconChangeBottomSheet extends StatefulWidget {
  final Function(String) callback;
  const IconChangeBottomSheet({super.key,required this.callback});

  @override
  State<IconChangeBottomSheet> createState() => _IconChangeBottomSheetState();
}

class _IconChangeBottomSheetState extends State<IconChangeBottomSheet> {
  List<String> icons=[
    "assets/ImagesY/RoutineScreen/AddhabbitIcons/HealthyLifeStyle/Drop_Icon.svg",
    "assets/ImagesY/RoutineScreen/AddhabbitIcons/HealthyLifeStyle/Eat_Fruit_Icon.svg",
    "assets/ImagesY/RoutineScreen/AddhabbitIcons/HealthyLifeStyle/Eat_Health-Meals.svg",
    "assets/ImagesY/RoutineScreen/AddhabbitIcons/HealthyLifeStyle/Eat_Salad_Icon.svg",
    "assets/ImagesY/RoutineScreen/AddhabbitIcons/HealthyLifeStyle/limit_Caffien_icon.svg",
    "assets/ImagesY/RoutineScreen/AddhabbitIcons/HealthyLifeStyle/limit_Fried_Food.svg",
    "assets/ImagesY/RoutineScreen/AddhabbitIcons/HealthyLifeStyle/Limit_Sugar_Icons.svg",
    "assets/ImagesY/RoutineScreen/AddhabbitIcons/HealthyLifeStyle/Quit_Smoking_Icon.svg",
    "assets/ImagesY/RoutineScreen/AddhabbitIcons/HealthyLifeStyle/Skin_care_icon.svg",
    "assets/ImagesY/RoutineScreen/AddhabbitIcons/HealthyLifeStyle/Sleep_8_Hours_Icon.svg",
    "assets/ImagesY/RoutineScreen/AddhabbitIcons/HealthyLifeStyle/Sleep_Early_Icon.svg",
    "assets/ImagesY/RoutineScreen/AddhabbitIcons/LovedOnes/Call_a_Friend_icon.svg",
    "assets/ImagesY/RoutineScreen/AddhabbitIcons/LovedOnes/Call_parents_Icon.svg",
    "assets/ImagesY/RoutineScreen/AddhabbitIcons/LovedOnes/Family_time_icon.svg",
        "assets/ImagesY/RoutineScreen/AddhabbitIcons/LovedOnes/Mini_Vacation_Icon.svg",
    "assets/ImagesY/RoutineScreen/AddhabbitIcons/Others/Brush_2_times_Icon.svg",
    "assets/ImagesY/RoutineScreen/AddhabbitIcons/Others/Clean_Room_Icon.svg",
    "assets/ImagesY/RoutineScreen/AddhabbitIcons/Others/Empty_Inbox_Icon.svg",
    "assets/ImagesY/RoutineScreen/AddhabbitIcons/Others/Engage_in_Hobbies_Icon.svg",
    "assets/ImagesY/RoutineScreen/AddhabbitIcons/Others/Make_your_Bed_Icon.svg",
    "assets/ImagesY/RoutineScreen/AddhabbitIcons/Others/Positive_Affermation_icon.svg",
    "assets/ImagesY/RoutineScreen/AddhabbitIcons/Others/Positive_Self_Talk_Icon.svg",
    "assets/ImagesY/RoutineScreen/AddhabbitIcons/Others/Study_Icon.svg",
    "assets/ImagesY/RoutineScreen/AddhabbitIcons/PersonalFinance/Donate_Icon.svg",
    "assets/ImagesY/RoutineScreen/AddhabbitIcons/PersonalFinance/Limit_Dining_out_Icon.svg",
        "assets/ImagesY/RoutineScreen/AddhabbitIcons/PersonalFinance/No_impluse_Shoping.svg",
    "assets/ImagesY/RoutineScreen/AddhabbitIcons/PersonalFinance/Pay_Bills_Icons.svg",
    "assets/ImagesY/RoutineScreen/AddhabbitIcons/PersonalFinance/Read_Finance_new_Icon.svg",
    "assets/ImagesY/RoutineScreen/AddhabbitIcons/PersonalFinance/Save_10%_Of_Incone_Icon.svg",
    "assets/ImagesY/RoutineScreen/AddhabbitIcons/PersonalFinance/Track_Personal_Expense_Icon.svg",
    "assets/ImagesY/RoutineScreen/AddhabbitIcons/StayingFitIcons/Cardio_Icon.svg",
    "assets/ImagesY/RoutineScreen/AddhabbitIcons/StayingFitIcons/Dance_Icon.svg",
        "assets/ImagesY/RoutineScreen/AddhabbitIcons/StayingFitIcons/ExcerciseIcon.svg",
    "assets/ImagesY/RoutineScreen/AddhabbitIcons/StayingFitIcons/Go_For_Swimming_Icon.svg",
    "assets/ImagesY/RoutineScreen/AddhabbitIcons/StayingFitIcons/Hit_Gym_Icon.svg",
    "assets/ImagesY/RoutineScreen/AddhabbitIcons/StayingFitIcons/Morning_Walk.svg",
    "assets/ImagesY/RoutineScreen/AddhabbitIcons/StayingFitIcons/Play_Sport_Icon.svg",
    "assets/ImagesY/RoutineScreen/AddhabbitIcons/StayingFitIcons/Ride_Bike_Icon.svg",
    "assets/ImagesY/RoutineScreen/AddhabbitIcons/StressRelief/Be_A_GreatFull_Icon.svg",
    "assets/ImagesY/RoutineScreen/AddhabbitIcons/StressRelief/Digital_Detox_Icon.svg",
    "assets/ImagesY/RoutineScreen/AddhabbitIcons/StressRelief/Enjoy_SunRise_Icon.svg",
    "assets/ImagesY/RoutineScreen/AddhabbitIcons/StressRelief/Learn_Skills_Icon.svg",
    "assets/ImagesY/RoutineScreen/AddhabbitIcons/StressRelief/Meditate.svg",
    "assets/ImagesY/RoutineScreen/AddhabbitIcons/StressRelief/Practice_Yoga_Icon.svg",
    "assets/ImagesY/RoutineScreen/AddhabbitIcons/StressRelief/Pray_Icon.svg",
    "assets/ImagesY/RoutineScreen/AddhabbitIcons/StressRelief/Read_A_book_Icon.svg",
    "assets/ImagesY/RoutineScreen/AddhabbitIcons/StressRelief/Write_Journel_Icon.svg",



  ];
  int SelectedIconIndez=-1;
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
    child: SingleChildScrollView(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 20.0),
            child: Text(
              'Choose Icon',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: icons.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                crossAxisSpacing: 40.0,
                mainAxisSpacing: 20.0,
              ),
              padding: EdgeInsets.all(20),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    // Add your logic here
                    setState(() {
                      SelectedIconIndez=index;
                    });
                    widget.callback(icons[index]);
                  },
                  child: SizedBox(
                    width: 5,
                    height: 5,
                    child: SvgPicture.asset(icons[index],
                    color: SelectedIconIndez==index?Color(0xFF9D6BCE): Theme.of(context).inputDecorationTheme.fillColor,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    ));
  }
}
