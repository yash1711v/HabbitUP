
import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:habitup/CommonMethods/Variable.dart';
import 'add_habit_bloc.dart';

class AddHabitScreen extends StatelessWidget {
  AddHabitScreen({super.key});

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context2) {
    return BlocBuilder<AddHabitBloc, AddHabitState>(
      builder: (context, state) {
        bool searchbarFocused = false;
        bool stayingFit = false;
        bool stressRelief = false;
        bool healthyLifeStyle = false;
        bool lovedOnes = false;
        bool personalFinance = false;
        bool Other = false;
        List<String> Habitnames=[];
        List<String> HabitIcons=[];
        if (state is SearchBartapState) {
          searchbarFocused = state.isTaped;

        }
        if(state is StayingFitState){
          stayingFit=state.isStayingfitOpened;
          Habitnames=state.Habitnames;
          HabitIcons=state.HabitIcons;
          // print(Habitnames);
          // print(HabitIcons);
        }
        if(state is StressReliefState){
          stressRelief=state.isStressReliefStateOpened;
          Habitnames=state.Habitnames;
          HabitIcons=state.HabitIcons;
        }
        if(state is HealthyLifestyleState){
          Habitnames=state.Habitnames;
          HabitIcons=state.HabitIcons;
          healthyLifeStyle=state.isHealthyLifeStyleOpened;
        }
        if(state is LovedOnesState){
          Habitnames=state.Habitnames;
          HabitIcons=state.HabitIcons;
          lovedOnes=state.isLovedOnesOpened;
        }
        if(state is PersonalFinanceState){
          Habitnames=state.Habitnames;
          HabitIcons=state.HabitIcons;
          personalFinance=state.isPersonalFinanceOpened;
        }
        if(state is OthersState){
          Habitnames=state.Habitnames;
          HabitIcons=state.HabitIcons;
          Other=state.isOthersOpened;
        }
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            leading: Padding(
              padding: const EdgeInsets.only(left: 15),
              child: IconButton(onPressed: () { Navigator.of(context).pop(); }, icon: const Icon(Icons.arrow_back_ios),color: Theme.of(context).textTheme.bodyText2?.color,),
            ),

            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 10,left: 10),
                child: AnimSearchBar(
                  boxShadow: false,
                  style: TextStyle(color: Theme.of(context).textTheme.bodyText2?.color),
                  color:Colors.transparent,
                  textFieldIconColor:Theme.of(context).textTheme.bodyText2?.color,
                    textFieldColor: Theme.of(context).inputDecorationTheme.fillColor,
                    searchIconColor: Theme.of(context).textTheme.bodyText2?.color,
                    width: 370, textController: controller, onSuffixTap: (){}, onSubmitted: (value){
                    print(value);
                }, size: 25,),
              )
            ],
          ),
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: const EdgeInsets.only(
                bottom: 35,
              ),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 22, left: 38),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 197,
                          height: 23,
                          child: Text(
                            'Trending habits',
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'DM Sans',
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 22, left: 43),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 197,
                              height: 23,
                              child: Text(
                                'Popular categories',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'DM Sans',
                                  fontWeight: FontWeight.w500,
                                  height: 0,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 15.0, ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap:(){
                                BlocProvider.of<AddHabitBloc>(context).add(StayingFitClickedEvent(StayingFirOpened: !stayingFit));
                                },
                                child: Container(
                                  width: 320,
                                  height: 51,
                                  decoration: ShapeDecoration(
                                    color: Theme.of(context)
                                        .inputDecorationTheme
                                        .fillColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.only(left: 10.0),
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            'Staying Fit',
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontFamily: 'DM Sans',
                                              fontWeight: FontWeight.w400,
                                              height: 0,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 200.0, bottom: 1),
                                        child: IconButton(
                                          splashColor: Colors.transparent,
                                            onPressed: () {
                                              BlocProvider.of<AddHabitBloc>(context).add(StayingFitClickedEvent(StayingFirOpened: !stayingFit));
                                            },
                                            icon: SvgPicture.asset(
                                              stayingFit == true
                                                  ? "assets/ImagesY/RoutineScreen/AddhabbitIcons/UPArrow.svg"
                                                  : "assets/ImagesY/RoutineScreen/AddhabbitIcons/DownArrow.svg",
                                              color: Theme.of(context)
                                                  .textTheme
                                                  .titleMedium
                                                  ?.color,
                                            )),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Visibility(
                        visible: stayingFit,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 11.0,),
                          child: SingleChildScrollView(
                              physics: NeverScrollableScrollPhysics(),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 58.0),
                                  child: GestureDetector(
                                    onTap:(){
                                     },
                                    child: Container(
                                      width: 123,
                                      height: 80,
                                      decoration: ShapeDecoration(
                                        color: const Color(0xFFF36C00),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(15),
                                        ),
                                      ),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 9.0),
                                            child: SvgPicture.asset(
                                                "assets/ImagesY/RoutineScreen/AddhabbitIcons/AddIcon.svg"),
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.only(top: 8.0,bottom: 9),
                                            child: SizedBox(
                                              width: 75,
                                              height: 31,
                                              child: Text(
                                                'Add a new habit',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: Color(0xFF1F1F1F),
                                                  fontSize: 12,
                                                  fontFamily: 'Inter',
                                                  fontWeight: FontWeight.w700,
                                                  height: 0,
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width-182,
                                  height: 81,
                                  child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: Habitnames.length,
                                      itemBuilder: (BuildContext context2,int index){
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                      child: GestureDetector(
                                        onTap: (){
                                          selectedHabit=Habitnames[index];
                                          SelectedHabitIcon=HabitIcons[index];
                                          SelectedCatagory="Staying fit";
                                          SelectedColorIndex=1;
                                          Navigator.of(context2).pushNamed("/HabitAddisionScree",);
                                        },
                                        child: Container(
                                          width: 123,
                                          height: 80,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: ShapeDecoration(
                                            color: Theme.of(context)
                                                .inputDecorationTheme
                                                .fillColor,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(15),
                                            ),
                                          ),
                                          child: Container(
                                            width: 123,
                                            height: 80,
                                            child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                    children: [
                                                      Padding(
                                                        padding: const EdgeInsets.only(top: 7.0,left: 5),
                                                        child: SizedBox(
                                                          width: 81,
                                                          height: 45,
                                                          child: Text(
                                                            Habitnames[index],
                                                            style: TextStyle(
                                                              color: Theme.of(context)
                                                                  .textTheme
                                                                  .titleMedium
                                                                  ?.color,
                                                              fontSize: 16,
                                                              fontFamily: 'DM Sans',
                                                              fontWeight: FontWeight.w700,
                                                              height: 0,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.only(bottom: 12.0,right: 5),
                                                        child: Container(
                                                          width: 24,
                                                          height: 24,
                                                          decoration: ShapeDecoration(
                                                            color: Theme.of(context)
                                                                .textTheme
                                                                .bodyText1
                                                                ?.color,
                                                            shape: const OvalBorder(),
                                                          ),
                                                          child: SvgPicture.asset(HabitIcons[index],width: 10,height: 10,),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(top: 13.0),
                                                    child: Container(
                                                      width: 123,
                                                      height: 15,
                                                      decoration: const ShapeDecoration(
                                                        color: Color(0xffF36C00),
                                                        shape: RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.only(
                                                            topLeft: Radius.circular(0),
                                                            topRight: Radius.circular(0),
                                                            bottomLeft: Radius.circular(15),
                                                            bottomRight: Radius.circular(15),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),]
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                                ),

                              ],
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 15.0,),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap:(){
                                  BlocProvider.of<AddHabitBloc>(context).add(StressReliefClickedEvent(StressReliefOpend: !stressRelief));

                                },
                                child: Container(
                                  width: 320,
                                  height: 51,
                                  decoration: ShapeDecoration(
                                    color: Theme.of(context)
                                        .inputDecorationTheme
                                        .fillColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.only(left: 10.0),
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            'Stress Relief',
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontFamily: 'DM Sans',
                                              fontWeight: FontWeight.w400,
                                              height: 0,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 189.0, bottom: 1),
                                        child: IconButton(
                                            onPressed: () {
                                              BlocProvider.of<AddHabitBloc>(context).add(StressReliefClickedEvent(StressReliefOpend: !stressRelief));

                                            },
                                            icon: SvgPicture.asset(
                                              stressRelief == true
                                                  ? "assets/ImagesY/RoutineScreen/AddhabbitIcons/UPArrow.svg"
                                                  : "assets/ImagesY/RoutineScreen/AddhabbitIcons/DownArrow.svg",
                                              color: Theme.of(context)
                                                  .textTheme
                                                  .titleMedium
                                                  ?.color,
                                            )),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Visibility(
                        visible: stressRelief,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 11.0,),
                          child: SingleChildScrollView(
                            physics: NeverScrollableScrollPhysics(),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 58.0),
                                  child: Container(
                                    width: 123,
                                    height: 80,
                                    decoration: ShapeDecoration(
                                      color: const Color(0xFF9E6ACE),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 9.0),
                                          child: SvgPicture.asset(
                                              "assets/ImagesY/RoutineScreen/AddhabbitIcons/AddIcon.svg"),
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.only(top: 8.0,bottom: 9),
                                          child: SizedBox(
                                            width: 75,
                                            height: 31,
                                            child: Text(
                                              'Add a new habit',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Color(0xFF1F1F1F),
                                                fontSize: 12,
                                                fontFamily: 'Inter',
                                                fontWeight: FontWeight.w700,
                                                height: 0,
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width-182,
                                  height: 81,
                                  child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: Habitnames.length,
                                      itemBuilder: (BuildContext context2,int index){
                                        return Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                          child: GestureDetector(
                                            onTap: (){
                                              selectedHabit=Habitnames[index];
                                              SelectedHabitIcon=HabitIcons[index];
                                              SelectedCatagory="Stress Relief";
                                              SelectedColorIndex=0;
                                              Navigator.of(context2).pushNamed("/HabitAddisionScree",);
                                            },
                                            child: Container(
                                              width: 123,
                                              height: 80,
                                              clipBehavior: Clip.antiAlias,
                                              decoration: ShapeDecoration(
                                                color: Theme.of(context)
                                                    .inputDecorationTheme
                                                    .fillColor,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(15),
                                                ),
                                              ),
                                              child: Container(
                                                width: 123,
                                                height: 80,
                                                child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                        children: [
                                                          Padding(
                                                            padding: const EdgeInsets.only(top: 7.0,left: 5),
                                                            child: SizedBox(
                                                              width: 81,
                                                              height: 45,
                                                              child: Text(
                                                                Habitnames[index],
                                                                style: TextStyle(
                                                                  color: Theme.of(context)
                                                                      .textTheme
                                                                      .titleMedium
                                                                      ?.color,
                                                                  fontSize: 16,
                                                                  fontFamily: 'DM Sans',
                                                                  fontWeight: FontWeight.w700,
                                                                  height: 0,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding: const EdgeInsets.only(bottom: 12.0,right: 5),
                                                            child: Container(
                                                              width: 24,
                                                              height: 24,
                                                              decoration: ShapeDecoration(
                                                                color: Theme.of(context)
                                                                    .textTheme
                                                                    .bodyText1
                                                                    ?.color,
                                                                shape: const OvalBorder(),
                                                              ),
                                                              child: SvgPicture.asset(HabitIcons[index],width: 10,height: 10,),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.only(top: 13.0),
                                                        child: Container(
                                                          width: 123,
                                                          height: 15,
                                                          decoration: const ShapeDecoration(
                                                            color: Color(0xFF9D6BCE),
                                                            shape: RoundedRectangleBorder(
                                                              borderRadius: BorderRadius.only(
                                                                topLeft: Radius.circular(0),
                                                                topRight: Radius.circular(0),
                                                                bottomLeft: Radius.circular(15),
                                                                bottomRight: Radius.circular(15),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),]
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      }),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 15.0, ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap:(){
                                  BlocProvider.of<AddHabitBloc>(context).add(HealthyLifeStyleClickedEvent(HealthyLifeStyleOpend: !healthyLifeStyle));

                                },
                                child: Container(
                                  width: 320,
                                  height: 51,
                                  decoration: ShapeDecoration(
                                    color: Theme.of(context)
                                        .inputDecorationTheme
                                        .fillColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.only(left: 10.0),
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            'Healthy Lifestyle',
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontFamily: 'DM Sans',
                                              fontWeight: FontWeight.w400,
                                              height: 0,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 164.0, bottom: 1),
                                        child: IconButton(
                                            onPressed: () {
                                              BlocProvider.of<AddHabitBloc>(context).add(HealthyLifeStyleClickedEvent(HealthyLifeStyleOpend: !healthyLifeStyle));

                                            },
                                            icon: SvgPicture.asset(
                                              healthyLifeStyle == true
                                                  ? "assets/ImagesY/RoutineScreen/AddhabbitIcons/UPArrow.svg"
                                                  : "assets/ImagesY/RoutineScreen/AddhabbitIcons/DownArrow.svg",
                                              color: Theme.of(context)
                                                  .textTheme
                                                  .titleMedium
                                                  ?.color,
                                            )),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Visibility(
                        visible: healthyLifeStyle,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 11.0,),
                          child: SingleChildScrollView(
                            physics: NeverScrollableScrollPhysics(),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 58.0),
                                  child: Container(
                                    width: 123,
                                    height: 80,
                                    decoration: ShapeDecoration(
                                      color: const Color(0xFF01BBF6),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 9.0),
                                          child: SvgPicture.asset(
                                              "assets/ImagesY/RoutineScreen/AddhabbitIcons/AddIcon.svg"),
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.only(top: 8.0,bottom: 9),
                                          child: SizedBox(
                                            width: 75,
                                            height: 31,
                                            child: Text(
                                              'Add a new habit',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Color(0xFF1F1F1F),
                                                fontSize: 12,
                                                fontFamily: 'Inter',
                                                fontWeight: FontWeight.w700,
                                                height: 0,
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),

                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width-182,
                                  height: 81,
                                  child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: Habitnames.length,
                                      itemBuilder: (BuildContext context2,int index){
                                        return Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                          child: GestureDetector(
                                            onTap: (){
                                              selectedHabit=Habitnames[index];
                                              SelectedHabitIcon=HabitIcons[index];
                                              SelectedCatagory="Healthy LifeStyle";
                                              SelectedColorIndex=3;
                                              Navigator.of(context2).pushNamed("/HabitAddisionScree",
                                              );
                                            },
                                            child: Container(
                                              width: 123,
                                              height: 80,
                                              clipBehavior: Clip.antiAlias,
                                              decoration: ShapeDecoration(
                                                color: Theme.of(context)
                                                    .inputDecorationTheme
                                                    .fillColor,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(15),
                                                ),
                                              ),
                                              child: Container(
                                                width: 123,
                                                height: 80,
                                                child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                        children: [
                                                          Padding(
                                                            padding: const EdgeInsets.only(top: 7.0,left: 5),
                                                            child: SizedBox(
                                                              width: 81,
                                                              height: 45,
                                                              child: Text(
                                                                Habitnames[index],
                                                                style: TextStyle(
                                                                  color: Theme.of(context)
                                                                      .textTheme
                                                                      .titleMedium
                                                                      ?.color,
                                                                  fontSize: 16,
                                                                  fontFamily: 'DM Sans',
                                                                  fontWeight: FontWeight.w700,
                                                                  height: 0,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding: const EdgeInsets.only(bottom: 12.0,right: 5),
                                                            child: Container(
                                                              width: 24,
                                                              height: 24,
                                                              decoration: ShapeDecoration(
                                                                color: Theme.of(context)
                                                                    .textTheme
                                                                    .bodyText1
                                                                    ?.color,
                                                                shape: const OvalBorder(),
                                                              ),
                                                              child: SvgPicture.asset(HabitIcons[index],width: 10,height: 10,),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.only(top: 13.0),
                                                        child: Container(
                                                          width: 123,
                                                          height: 15,
                                                          decoration: const ShapeDecoration(
                                                            color: Color(0xFF01BBF6),
                                                            shape: RoundedRectangleBorder(
                                                              borderRadius: BorderRadius.only(
                                                                topLeft: Radius.circular(0),
                                                                topRight: Radius.circular(0),
                                                                bottomLeft: Radius.circular(15),
                                                                bottomRight: Radius.circular(15),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),]
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      }),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 15.0,),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap:(){
                                  BlocProvider.of<AddHabitBloc>(context).add(LovedOnesClickedEvent(LovedOnesOpend: !lovedOnes));

                                },
                                child: Container(
                                  width: 320,
                                  height: 51,
                                  decoration: ShapeDecoration(
                                    color: Theme.of(context)
                                        .inputDecorationTheme
                                        .fillColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.only(left: 10.0),
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            'Loved Ones',
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontFamily: 'DM Sans',
                                              fontWeight: FontWeight.w400,
                                              height: 0,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 190.0, bottom: 1),
                                        child: IconButton(
                                            onPressed: () {
                                              BlocProvider.of<AddHabitBloc>(context).add(LovedOnesClickedEvent(LovedOnesOpend: !lovedOnes));
                                            },
                                            icon: SvgPicture.asset(
                                              lovedOnes == true
                                                  ? "assets/ImagesY/RoutineScreen/AddhabbitIcons/UPArrow.svg"
                                                  : "assets/ImagesY/RoutineScreen/AddhabbitIcons/DownArrow.svg",
                                              color: Theme.of(context)
                                                  .textTheme
                                                  .titleMedium
                                                  ?.color,
                                            )),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Visibility(
                        visible: lovedOnes,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 11.0,),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 58.0),
                                  child: Container(
                                    width: 123,
                                    height: 80,
                                    decoration: ShapeDecoration(
                                      color: const Color(0xFFFE8596),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 9.0),
                                          child: SvgPicture.asset(
                                              "assets/ImagesY/RoutineScreen/AddhabbitIcons/AddIcon.svg"),
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.only(top: 8.0,bottom: 9),
                                          child: SizedBox(
                                            width: 75,
                                            height: 31,
                                            child: Text(
                                              'Add a new habit',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Color(0xFF1F1F1F),
                                                fontSize: 12,
                                                fontFamily: 'Inter',
                                                fontWeight: FontWeight.w700,
                                                height: 0,
                                              ),
                                            ),
                                          ),
                                        ),

                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width-182,
                                  height: 81,
                                  child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: Habitnames.length,
                                      itemBuilder: (BuildContext context2,int index){
                                        return Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                          child: GestureDetector(
                                            onTap: (){
                                              selectedHabit=Habitnames[index];
                                              SelectedHabitIcon=HabitIcons[index];
                                              SelectedCatagory="Loved Ones";
                                              SelectedColorIndex=6;
                                              Navigator.of(context2).pushNamed("/HabitAddisionScree",
                                              );
                                            },
                                            child: Container(
                                              width: 123,
                                              height: 80,
                                              clipBehavior: Clip.antiAlias,
                                              decoration: ShapeDecoration(
                                                color: Theme.of(context)
                                                    .inputDecorationTheme
                                                    .fillColor,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(15),
                                                ),
                                              ),
                                              child: Container(
                                                width: 123,
                                                height: 80,
                                                child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                        children: [
                                                          Padding(
                                                            padding: const EdgeInsets.only(top: 7.0,left: 5),
                                                            child: SizedBox(
                                                              width: 81,
                                                              height: 45,
                                                              child: Text(
                                                                Habitnames[index],
                                                                style: TextStyle(
                                                                  color: Theme.of(context)
                                                                      .textTheme
                                                                      .titleMedium
                                                                      ?.color,
                                                                  fontSize: 16,
                                                                  fontFamily: 'DM Sans',
                                                                  fontWeight: FontWeight.w700,
                                                                  height: 0,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding: const EdgeInsets.only(bottom: 12.0,right: 5),
                                                            child: Container(
                                                              width: 24,
                                                              height: 24,
                                                              decoration: ShapeDecoration(
                                                                color: Theme.of(context)
                                                                    .textTheme
                                                                    .bodyText1
                                                                    ?.color,
                                                                shape: const OvalBorder(),
                                                              ),
                                                              child: SvgPicture.asset(HabitIcons[index],width: 10,height: 10,),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.only(top: 13.0),
                                                        child: Container(
                                                          width: 123,
                                                          height: 15,
                                                          decoration: const ShapeDecoration(
                                                            color: Color(0xFFFE8596),
                                                            shape: RoundedRectangleBorder(
                                                              borderRadius: BorderRadius.only(
                                                                topLeft: Radius.circular(0),
                                                                topRight: Radius.circular(0),
                                                                bottomLeft: Radius.circular(15),
                                                                bottomRight: Radius.circular(15),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),]
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      }),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 15.0, ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap:(){
                                  BlocProvider.of<AddHabitBloc>(context).add(PersonalFinanceEvent(PersonalFinanceOpened: !personalFinance));

                                },
                                child: Container(
                                  width: 320,
                                  height: 51,
                                  decoration: ShapeDecoration(
                                    color: Theme.of(context)
                                        .inputDecorationTheme
                                        .fillColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.only(left: 10.0),
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            'Personal Finance',
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontFamily: 'DM Sans',
                                              fontWeight: FontWeight.w400,
                                              height: 0,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 156.0, bottom: 1),
                                        child: IconButton(
                                            onPressed: () {
                                              BlocProvider.of<AddHabitBloc>(context).add(PersonalFinanceEvent(PersonalFinanceOpened: !personalFinance));

                                            },
                                            icon: SvgPicture.asset(
                                              personalFinance == true
                                                  ? "assets/ImagesY/RoutineScreen/AddhabbitIcons/UPArrow.svg"
                                                  : "assets/ImagesY/RoutineScreen/AddhabbitIcons/DownArrow.svg",
                                              color: Theme.of(context)
                                                  .textTheme
                                                  .titleMedium
                                                  ?.color,
                                            )),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Visibility(
                        visible: personalFinance,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 11.0,),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 58.0),
                                  child: Container(
                                    width: 123,
                                    height: 80,
                                    decoration: ShapeDecoration(
                                      color: const Color(0xFFA8E32C),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 9.0),
                                          child: SvgPicture.asset(
                                              "assets/ImagesY/RoutineScreen/AddhabbitIcons/AddIcon.svg"),
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.only(top: 8.0,bottom: 9),
                                          child: SizedBox(
                                            width: 75,
                                            height: 31,
                                            child: Text(
                                              'Add a new habit',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Color(0xFF1F1F1F),
                                                fontSize: 12,
                                                fontFamily: 'Inter',
                                                fontWeight: FontWeight.w700,
                                                height: 0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width-182,
                                  height: 81,
                                  child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: Habitnames.length,
                                      itemBuilder: (BuildContext context2,int index){
                                        return Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                          child: GestureDetector(
                                            onTap: (){
                                              selectedHabit=Habitnames[index];
                                              SelectedHabitIcon=HabitIcons[index];
                                              SelectedCatagory="Personal Finance";
                                              SelectedColorIndex=2;
                                              Navigator.of(context2).pushNamed("/HabitAddisionScree",
                                              );
                                            },
                                            child: Container(
                                              width: 123,
                                              height: 80,
                                              clipBehavior: Clip.antiAlias,
                                              decoration: ShapeDecoration(
                                                color: Theme.of(context)
                                                    .inputDecorationTheme
                                                    .fillColor,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(15),
                                                ),
                                              ),
                                              child: Container(
                                                width: 123,
                                                height: 80,
                                                child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                        children: [
                                                          Padding(
                                                            padding: const EdgeInsets.only(top: 7.0,left: 5),
                                                            child: SizedBox(
                                                              width: 81,
                                                              height: 45,
                                                              child: Text(
                                                                Habitnames[index],
                                                                style: TextStyle(
                                                                  color: Theme.of(context)
                                                                      .textTheme
                                                                      .titleMedium
                                                                      ?.color,
                                                                  fontSize: 16,
                                                                  fontFamily: 'DM Sans',
                                                                  fontWeight: FontWeight.w700,
                                                                  height: 0,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding: const EdgeInsets.only(bottom: 12.0,right: 5),
                                                            child: Container(
                                                              width: 24,
                                                              height: 24,
                                                              decoration: ShapeDecoration(
                                                                color: Theme.of(context)
                                                                    .textTheme
                                                                    .bodyText1
                                                                    ?.color,
                                                                shape: const OvalBorder(),
                                                              ),
                                                              child: SvgPicture.asset(HabitIcons[index],width: 10,height: 10,),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.only(top: 13.0),
                                                        child: Container(
                                                          width: 123,
                                                          height: 15,
                                                          decoration: const ShapeDecoration(
                                                            color: Color(0xFFA8E32C),
                                                            shape: RoundedRectangleBorder(
                                                              borderRadius: BorderRadius.only(
                                                                topLeft: Radius.circular(0),
                                                                topRight: Radius.circular(0),
                                                                bottomLeft: Radius.circular(15),
                                                                bottomRight: Radius.circular(15),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),]
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      }),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 15.0,),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap:(){
                                  BlocProvider.of<AddHabitBloc>(context).add(OthersEvent(OthersOpened: !Other));

                                },
                                child: Container(
                                  width: 320,
                                  height: 51,
                                  decoration: ShapeDecoration(
                                    color: Theme.of(context)
                                        .inputDecorationTheme
                                        .fillColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.only(left: 10.0),
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            'Other',
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontFamily: 'DM Sans',
                                              fontWeight: FontWeight.w400,
                                              height: 0,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 220.0, bottom: 1),
                                        child: IconButton(
                                            onPressed: () {
                                              BlocProvider.of<AddHabitBloc>(context).add(OthersEvent(OthersOpened: !Other));
                                            },
                                            icon: SvgPicture.asset(
                                              Other == true
                                                  ? "assets/ImagesY/RoutineScreen/AddhabbitIcons/UPArrow.svg"
                                                  : "assets/ImagesY/RoutineScreen/AddhabbitIcons/DownArrow.svg",
                                              color: Theme.of(context)
                                                  .textTheme
                                                  .titleMedium
                                                  ?.color,
                                            )),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Visibility(
                        visible: Other,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 11.0,),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 58.0),
                                  child: Container(
                                    width: 123,
                                    height: 80,
                                    decoration: ShapeDecoration(
                                      color: const Color(0xFFD03C91),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 9.0),
                                          child: SvgPicture.asset(
                                              "assets/ImagesY/RoutineScreen/AddhabbitIcons/AddIcon.svg"),
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.only(top: 8.0,bottom: 9),
                                          child: SizedBox(
                                            width: 75,
                                            height: 31,
                                            child: Text(
                                              'Add a new habit',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Color(0xFF1F1F1F),
                                                fontSize: 12,
                                                fontFamily: 'Inter',
                                                fontWeight: FontWeight.w700,
                                                height: 0,
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width-182,
                                  height: 81,
                                  child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: Habitnames.length,
                                      itemBuilder: (BuildContext context2,int index){
                                        return Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                          child: GestureDetector(
                                            onTap: (){
                                              selectedHabit=Habitnames[index];
                                              SelectedHabitIcon=HabitIcons[index];
                                              SelectedCatagory="Others";
                                              SelectedColorIndex=4;
                                              Navigator.of(context2).pushNamed("/HabitAddisionScree",
                                              );
                                            },
                                            child: Container(
                                              width: 123,
                                              height: 80,
                                              clipBehavior: Clip.antiAlias,
                                              decoration: ShapeDecoration(
                                                color: Theme.of(context)
                                                    .inputDecorationTheme
                                                    .fillColor,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(15),
                                                ),
                                              ),
                                              child: Container(
                                                width: 123,
                                                height: 80,
                                                child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                        children: [
                                                          Padding(
                                                            padding: const EdgeInsets.only(top: 7.0,left: 5),
                                                            child: SizedBox(
                                                              width: 81,
                                                              height: 45,
                                                              child: Text(
                                                                Habitnames[index],
                                                                style: TextStyle(
                                                                  color: Theme.of(context)
                                                                      .textTheme
                                                                      .titleMedium
                                                                      ?.color,
                                                                  fontSize: 16,
                                                                  fontFamily: 'DM Sans',
                                                                  fontWeight: FontWeight.w700,
                                                                  height: 0,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding: const EdgeInsets.only(bottom: 12.0,right: 5),
                                                            child: Container(
                                                              width: 24,
                                                              height: 24,
                                                              decoration: ShapeDecoration(
                                                                color: Theme.of(context)
                                                                    .textTheme
                                                                    .bodyText1
                                                                    ?.color,
                                                                shape: const OvalBorder(),
                                                              ),
                                                              child: SvgPicture.asset(HabitIcons[index],width: 10,height: 10,),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.only(top: 13.0),
                                                        child: Container(
                                                          width: 123,
                                                          height: 15,
                                                          decoration: const ShapeDecoration(
                                                            color: Color(0xFFD03C91),
                                                            shape: RoundedRectangleBorder(
                                                              borderRadius: BorderRadius.only(
                                                                topLeft: Radius.circular(0),
                                                                topRight: Radius.circular(0),
                                                                bottomLeft: Radius.circular(15),
                                                                bottomRight: Radius.circular(15),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),]
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      }),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 12.0),
                          child: Container(
                            width: 320,
                            height: 51,
                            padding: const EdgeInsets.all(10),
                            decoration: ShapeDecoration(
                              color: const Color(0xFFFEF656),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const SizedBox(
                                  width: 273,
                                  child: Text(
                                    'Create a new habit',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.black,
                                      fontFamily: 'DM Sans',
                                      fontWeight: FontWeight.w400,
                                      height: 0,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Container(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 17,
                                        height: 14,
                                        padding: const EdgeInsets.all(0.88),
                                        clipBehavior: Clip.antiAlias,
                                        decoration: const BoxDecoration(),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              width: 12.25,
                                              height: 12.25,
                                              child: SvgPicture.asset("assets/ImagesY/RoutineScreen/AddhabbitIcons/CreateNewHabitAdd.svg"),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
