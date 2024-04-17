import 'package:HabitUp/Presentation/MainScreen/Pages/Routine/SubScreens/AddHabit/SubScreenOfAddHabit/HabbitAddisionScreen/CustomHabit/CustomHabitAdission.dart';
import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:HabitUp/CommonMethods/Variable.dart';
import '../../../../../../CommonMethods/Methods.dart';
import 'add_habit_bloc.dart';

class AddHabitScreen extends StatefulWidget {
  AddHabitScreen({super.key});

  @override
  State<AddHabitScreen> createState() => _AddHabitScreenState();
}

class _AddHabitScreenState extends State<AddHabitScreen> {
  final TextEditingController controller = TextEditingController();
  bool searconTap = false;
  List<String> CustomHabitNames=[];
  List<String> CustomHabitIcons=[];

  void Customames(){
    Habbits["Custom"]?.forEach((key1, value) {
      setState(() {
        CustomHabitNames.add(key1);
      });
      Habbits["Custom"]![key1]!.forEach((key, value) {
        if(key=="Icon") {
          setState(() {
            CustomHabitIcons.add(Habbits["Custom"]![key1]![key]);

          });
        }
      });
    });
  }
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    Customames();
  }
  @override
  Widget build(BuildContext context2) {
    return BlocBuilder<AddHabitBloc, AddHabitState>(
      builder: (context, state) {
        bool searchbarFocused = false;
        bool stayingFit = false;
        bool Custom = false;
        bool stressRelief = false;
        bool healthyLifeStyle = false;
        bool lovedOnes = false;
        bool personalFinance = false;
        bool Other = false;
        List<String> Habitnames = [];
        List<String> HabitIcons = [];
        if (state is SearchBartapState) {
          searchbarFocused = state.isTaped;
        }
        if (state is StayingFitState) {
          stayingFit = state.isStayingfitOpened;
          Habitnames = state.Habitnames;
          HabitIcons = state.HabitIcons;
          // print(Habitnames);
          // print(HabitIcons);
        }
        if (state is StressReliefState) {
          stressRelief = state.isStressReliefStateOpened;
          Habitnames = state.Habitnames;
          HabitIcons = state.HabitIcons;
        }
        if (state is HealthyLifestyleState) {
          Habitnames = state.Habitnames;
          HabitIcons = state.HabitIcons;
          healthyLifeStyle = state.isHealthyLifeStyleOpened;
        }
        if (state is LovedOnesState) {
          Habitnames = state.Habitnames;
          HabitIcons = state.HabitIcons;
          lovedOnes = state.isLovedOnesOpened;
        }
        if (state is PersonalFinanceState) {
          Habitnames = state.Habitnames;
          HabitIcons = state.HabitIcons;
          personalFinance = state.isPersonalFinanceOpened;
        }
        if (state is OthersState) {
          Habitnames = state.Habitnames;
          HabitIcons = state.HabitIcons;
          Other = state.isOthersOpened;
        } if (state is OthersState) {
          Habitnames = state.Habitnames;
          HabitIcons = state.HabitIcons;
          Other = state.isOthersOpened;
        }
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            leading: Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Visibility(
                  visible: true,
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(Icons.arrow_back_ios),
                    color: Theme.of(context).textTheme.bodyText2?.color,
                  )),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 10, left: 5),
                child: AnimSearchBar(
                  boxShadow: false,
                  style: TextStyle(
                      color: Theme.of(context).textTheme.bodyText2?.color),
                  color: Colors.transparent,
                  textFieldIconColor:
                      Theme.of(context).textTheme.bodyText2?.color,
                  textFieldColor:
                      Theme.of(context).inputDecorationTheme.fillColor,
                  searchIconColor: Theme.of(context).textTheme.bodyText2?.color,
                  width: 390,
                  textController: controller,
                  onSuffixTap: () {
                    controller.clear();

                  },
                  onSubmitted: (value) {
                    SearchedResult(Habbits, value);
                    setState(() {
                      searconTap=!searconTap;
                    });
                  },
                  size: 25,
                ),
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
                  AnimatedOpacity(

                    opacity: searconTap?1:0,
                    duration: Duration(milliseconds: 500),
                    child: Visibility(
                      visible: searconTap,
                      child: const Padding(
                        padding: EdgeInsets.only(top: 22, left: 19),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 197,
                              height: 23,
                              child: Text(
                                'Search Results',
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
                    ),
                  ),
                  AnimatedOpacity(

                    opacity: searconTap?1:0,
                    duration: Duration(milliseconds: 500),
                    child: Visibility(
                      visible: searconTap,
                      child: Padding(
                        padding: EdgeInsets.only(top: 10, left: 19),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {
                                selectedHabit = "Drink water";

                                SelectedCatagory = "Healthy LifeStyle";
                                target = "30";
                                SelectedHabitIcon = Habbits[
                                    SelectedCatagory]![selectedHabit]!['Icon'];
                                SelectedColorIndex = 3;
                                Properties = Habbits[SelectedCatagory]![
                                    selectedHabit]!['properties'];
                                Navigator.of(context2).pushNamed(
                                  "/HabitAddisionScree",
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
                                  decoration: ShapeDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment(-1.00, 0.00),
                                      end: Alignment(1, 0),
                                      colors: [
                                        Color(0x0001BBF6),
                                        Color(0x3301BBF6)
                                      ],
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 7.0, left: 5),
                                              child: SizedBox(
                                                width: 81,
                                                height: 45,
                                                child: Text(
                                                  "Drinkin Water",
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
                                              padding: const EdgeInsets.only(
                                                  bottom: 12.0, right: 5),
                                              child: SvgPicture.asset(
                                                "assets/ImagesY/RoutineScreen/AddhabbitIcons/HealthyLifeStyle/Drop_Icon.svg",
                                                width: 24,
                                                height: 24,
                                              ),
                                            )
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 13.0),
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
                                                  bottomRight:
                                                      Radius.circular(15),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ]),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                   Padding(
                    padding: EdgeInsets.only(top: searconTap?20:25, left: 19),
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
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 11.0,
                    ),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                selectedHabit = "Drink water";

                                SelectedCatagory = "Healthy LifeStyle";
                                target = "30";
                                SelectedHabitIcon = Habbits[
                                    SelectedCatagory]![selectedHabit]!['Icon'];
                                SelectedColorIndex = 3;
                                List<String> p=[];
                                Habbits[SelectedCatagory]![
                                selectedHabit]!['properties'].forEach((element) {
                                  p.add(element.toString());
                                });
                                Properties =
                                    p;
                                Navigator.of(context2).pushNamed(
                                  "/HabitAddisionScree",
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
                                  decoration: ShapeDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment(-1.00, 0.00),
                                      end: Alignment(1, 0),
                                      colors: [
                                        Color(0x0001BBF6),
                                        Color(0x3301BBF6)
                                      ],
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 7.0, left: 5),
                                              child: SizedBox(
                                                width: 81,
                                                height: 45,
                                                child: Text(
                                                  "Drinking Water",
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
                                              padding: const EdgeInsets.only(
                                                  bottom: 12.0, right: 5),
                                              child: SvgPicture.asset(
                                                "assets/ImagesY/RoutineScreen/AddhabbitIcons/HealthyLifeStyle/Drop_Icon.svg",
                                                width: 24,
                                                height: 24,
                                              ),
                                            )
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 13.0),
                                          child: Container(
                                            width: 123,
                                            height: 15,
                                            decoration: const ShapeDecoration(
                                              color: Color(0xFF01BBF6),
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(0),
                                                  topRight: Radius.circular(0),
                                                  bottomLeft:
                                                      Radius.circular(15),
                                                  bottomRight:
                                                      Radius.circular(15),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ]),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            GestureDetector(
                              onTap: () {
                                List<String> p=[];
                                Habbits[SelectedCatagory]![
                                selectedHabit]!['properties'].forEach((element) {
                                  p.add(element.toString());
                                });
                                print(Habbits[SelectedCatagory]![
                                selectedHabit]!['properties']);
                                selectedHabit = "Exercise";

                                SelectedCatagory = "Staying fit";
                                SelectedColorIndex = 1;
                                target = "30";
                                SelectedHabitIcon = Habbits[
                                    SelectedCatagory]![selectedHabit]!['Icon'];
                                Properties = p;
                                print(Properties);
                                Navigator.of(context2).pushNamed(
                                  "/HabitAddisionScree",
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
                                  decoration: ShapeDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment(-1.00, 0.00),
                                      end: Alignment(1, 0),
                                      colors: [
                                        Color(0x00DB6100),
                                        Color(0x33DB6100)
                                      ],
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 7.0, left: 5),
                                              child: SizedBox(
                                                width: 81,
                                                height: 45,
                                                child: Text(
                                                  "Exercise",
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
                                              padding: const EdgeInsets.only(
                                                  bottom: 12.0, right: 5),
                                              child: SvgPicture.asset(
                                                "assets/ImagesY/RoutineScreen/AddhabbitIcons/StayingFitIcons/ExcerciseIcon.svg",
                                                width: 24,
                                                height: 24,
                                              ),
                                            )
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 13.0),
                                          child: Container(
                                            width: 123,
                                            height: 15,
                                            decoration: const ShapeDecoration(
                                              color: Color(0xffF36C00),
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(0),
                                                  topRight: Radius.circular(0),
                                                  bottomLeft:
                                                      Radius.circular(15),
                                                  bottomRight:
                                                      Radius.circular(15),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ]),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            GestureDetector(
                              onTap: () {
                                selectedHabit = "Morning Walk";

                                SelectedCatagory = "Staying fit";
                                target = "30";
                                List<String> p=[];
                                Habbits[SelectedCatagory]![
                                selectedHabit]!['properties'].forEach((element) {
                                  p.add(element.toString());
                                });
                                SelectedHabitIcon = Habbits[
                                    SelectedCatagory]![selectedHabit]!['Icon'];
                                SelectedColorIndex = 1;
                                Properties =
                                    p;
                                Navigator.of(context2).pushNamed(
                                  "/HabitAddisionScree",
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
                                  decoration: ShapeDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment(-1.00, 0.00),
                                      end: Alignment(1, 0),
                                      colors: [
                                        Color(0x00DB6100),
                                        Color(0x33DB6100)
                                      ],
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 7.0, left: 5),
                                              child: SizedBox(
                                                width: 81,
                                                height: 45,
                                                child: Text(
                                                  "Morning Walk",
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
                                              padding: const EdgeInsets.only(
                                                  bottom: 12.0, right: 5),
                                              child: SvgPicture.asset(
                                                "assets/ImagesY/RoutineScreen/AddhabbitIcons/StayingFitIcons/Morning_Walk.svg",
                                                width: 24,
                                                height: 24,
                                              ),
                                            )
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 13.0),
                                          child: Container(
                                            width: 123,
                                            height: 15,
                                            decoration: const ShapeDecoration(
                                              color: Color(0xffF36C00),
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(0),
                                                  topRight: Radius.circular(0),
                                                  bottomLeft:
                                                      Radius.circular(15),
                                                  bottomRight:
                                                      Radius.circular(15),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ]),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            GestureDetector(
                              onTap: () {
                                selectedHabit = "Sleep Early";

                                SelectedCatagory = "Healthy LifeStyle";
                                target = "30";
                                SelectedHabitIcon = Habbits[
                                    SelectedCatagory]![selectedHabit]!['Icon'];
                                SelectedColorIndex = 3;
                                List<String> p=[];
                                Habbits[SelectedCatagory]![
                                selectedHabit]!['properties'].forEach((element) {
                                  p.add(element.toString());
                                });
                                Properties =
                                    p;
                                Navigator.of(context2).pushNamed(
                                  "/HabitAddisionScree",
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
                                  decoration: ShapeDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment(-1.00, 0.00),
                                      end: Alignment(1, 0),
                                      colors: [
                                        Color(0x0001BBF6),
                                        Color(0x3301BBF6)
                                      ],
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 7.0, left: 5),
                                              child: SizedBox(
                                                width: 81,
                                                height: 45,
                                                child: Text(
                                                  "Sleep Early",
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
                                              padding: const EdgeInsets.only(
                                                  bottom: 12.0, right: 5),
                                              child: SvgPicture.asset(
                                                "assets/ImagesY/RoutineScreen/AddhabbitIcons/HealthyLifeStyle/Sleep_Early_Icon.svg",
                                                width: 24,
                                                height: 24,
                                              ),
                                            )
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 13.0),
                                          child: Container(
                                            width: 123,
                                            height: 15,
                                            decoration: const ShapeDecoration(
                                              color: Color(0xFF01BBF6),
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(0),
                                                  topRight: Radius.circular(0),
                                                  bottomLeft:
                                                      Radius.circular(15),
                                                  bottomRight:
                                                      Radius.circular(15),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ]),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            GestureDetector(
                              onTap: () {
                                selectedHabit = "Read A Book";

                                SelectedCatagory = "Stress Relief";
                                target = "30";
                                SelectedHabitIcon = Habbits[
                                    SelectedCatagory]![selectedHabit]!['Icon'];
                                SelectedColorIndex = 0;
                                List<String> p=[];
                                Habbits[SelectedCatagory]![
                                selectedHabit]!['properties'].forEach((element) {
                                  p.add(element.toString());
                                });
                                Properties =
                                   p;
                                Navigator.of(context2).pushNamed(
                                  "/HabitAddisionScree",
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
                                  decoration: ShapeDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment(-1.00, 0.00),
                                      end: Alignment(1, 0),
                                      colors: [
                                        Color(0x009D6BCE),
                                        Color(0x339D6BCE)
                                      ],
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 7.0, left: 5),
                                              child: SizedBox(
                                                width: 81,
                                                height: 45,
                                                child: Text(
                                                  "Read A Book",
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
                                              padding: const EdgeInsets.only(
                                                  bottom: 12.0, right: 5),
                                              child: SvgPicture.asset(
                                                "assets/ImagesY/RoutineScreen/AddhabbitIcons/StressRelief/Read_A_book_Icon.svg",
                                                width: 24,
                                                height: 24,
                                              ),
                                            )
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 13.0),
                                          child: Container(
                                            width: 123,
                                            height: 15,
                                            decoration: const ShapeDecoration(
                                              color: Color(0xFF9D6BCE),
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(0),
                                                  topRight: Radius.circular(0),
                                                  bottomLeft:
                                                      Radius.circular(15),
                                                  bottomRight:
                                                      Radius.circular(15),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ]),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            GestureDetector(
                              onTap: () {
                                selectedHabit = "Limit caffiene";

                                SelectedCatagory = "Healthy LifeStyle";
                                target = "30";
                                SelectedHabitIcon = Habbits[
                                    SelectedCatagory]![selectedHabit]!['Icon'];
                                SelectedColorIndex = 3;
                                List<String> p=[];
                                Habbits[SelectedCatagory]![
                                selectedHabit]!['properties'].forEach((element) {
                                  p.add(element.toString());
                                });
                                Properties =p;
                                Navigator.of(context2).pushNamed(
                                  "/HabitAddisionScree",
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
                                  decoration: ShapeDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment(-1.00, 0.00),
                                      end: Alignment(1, 0),
                                      colors: [
                                        Color(0x0001BBF6),
                                        Color(0x3301BBF6)
                                      ],
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 7.0, left: 5),
                                              child: SizedBox(
                                                width: 81,
                                                height: 45,
                                                child: Text(
                                                  "Limit caffiene",
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
                                              padding: const EdgeInsets.only(
                                                  bottom: 12.0, right: 5),
                                              child: SvgPicture.asset(
                                                "assets/ImagesY/RoutineScreen/AddhabbitIcons/HealthyLifeStyle/limit_Caffien_icon.svg",
                                                width: 24,
                                                height: 24,
                                              ),
                                            )
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 13.0),
                                          child: Container(
                                            width: 123,
                                            height: 15,
                                            decoration: const ShapeDecoration(
                                              color: Color(0xFF01BBF6),
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(0),
                                                  topRight: Radius.circular(0),
                                                  bottomLeft:
                                                      Radius.circular(15),
                                                  bottomRight:
                                                      Radius.circular(15),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ]),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            GestureDetector(
                              onTap: () {
                                selectedHabit = "Make your bed";

                                SelectedCatagory = "Others";
                                target = "30";
                                SelectedHabitIcon = Habbits[
                                    SelectedCatagory]![selectedHabit]!['Icon'];
                                SelectedColorIndex = 4;
                                List<String> p=[];
                                Habbits[SelectedCatagory]![
                                selectedHabit]!['properties'].forEach((element) {
                                  p.add(element.toString());
                                });
                                Properties =p;
                                Navigator.of(context2).pushNamed(
                                  "/HabitAddisionScree",
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
                                  decoration: ShapeDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment(-1.00, 0.00),
                                      end: Alignment(1, 0),
                                      colors: [
                                        Color(0x00D03C91),
                                        Color(0x33D03C91)
                                      ],
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 7.0, left: 5),
                                              child: SizedBox(
                                                width: 81,
                                                height: 45,
                                                child: Text(
                                                  "Make your bed",
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
                                              padding: const EdgeInsets.only(
                                                  bottom: 12.0, right: 5),
                                              child: SvgPicture.asset(
                                                "assets/ImagesY/RoutineScreen/AddhabbitIcons/Others/Make_your_Bed_Icon.svg",
                                                width: 24,
                                                height: 24,
                                              ),
                                            )
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 13.0),
                                          child: Container(
                                            width: 123,
                                            height: 15,
                                            decoration: const ShapeDecoration(
                                              color: Color(0xFFD03C91),
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(0),
                                                  topRight: Radius.circular(0),
                                                  bottomLeft:
                                                      Radius.circular(15),
                                                  bottomRight:
                                                      Radius.circular(15),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ]),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            GestureDetector(
                              onTap: () {
                                selectedHabit = "Study";
                                SelectedCatagory = "Others";
                                target = "30";
                                SelectedHabitIcon = Habbits[
                                    SelectedCatagory]![selectedHabit]!['Icon'];
                                SelectedColorIndex = 4;
                                List<String> p=[];
                                Habbits[SelectedCatagory]![
                                selectedHabit]!['properties'].forEach((element) {
                                  p.add(element.toString());
                                });
                                Properties = p;
                                Navigator.of(context2).pushNamed(
                                  "/HabitAddisionScree",
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
                                  decoration: ShapeDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment(-1.00, 0.00),
                                      end: Alignment(1, 0),
                                      colors: [
                                        Color(0x00D03C91),
                                        Color(0x33D03C91)
                                      ],
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 7.0, left: 5),
                                              child: SizedBox(
                                                width: 81,
                                                height: 45,
                                                child: Text(
                                                  "Study",
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
                                              padding: const EdgeInsets.only(
                                                  bottom: 12.0, right: 5),
                                              child: SvgPicture.asset(
                                                "assets/ImagesY/RoutineScreen/AddhabbitIcons/Others/Make_your_Bed_Icon.svg",
                                                width: 24,
                                                height: 24,
                                              ),
                                            )
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 13.0),
                                          child: Container(
                                            width: 123,
                                            height: 15,
                                            decoration: const ShapeDecoration(
                                              color: Color(0xFFD03C91),
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(0),
                                                  topRight: Radius.circular(0),
                                                  bottomLeft:
                                                      Radius.circular(15),
                                                  bottomRight:
                                                      Radius.circular(15),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ]),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            GestureDetector(
                              onTap: () {
                                selectedHabit = "Brush 2 times a day";
                                SelectedCatagory = "Others";
                                target = "30";
                                SelectedHabitIcon = Habbits[
                                    SelectedCatagory]![selectedHabit]!['Icon'];
                                SelectedColorIndex = 4;
                                List<String> p=[];
                                Habbits[SelectedCatagory]![
                                selectedHabit]!['properties'].forEach((element) {
                                  p.add(element.toString());
                                });
                                Properties = p;
                                Navigator.of(context2).pushNamed(
                                  "/HabitAddisionScree",
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
                                  decoration: ShapeDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment(-1.00, 0.00),
                                      end: Alignment(1, 0),
                                      colors: [
                                        Color(0x00D03C91),
                                        Color(0x33D03C91)
                                      ],
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 7.0, left: 5),
                                              child: SizedBox(
                                                width: 81,
                                                height: 45,
                                                child: Text(
                                                  "Brush 2 times a day",
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
                                              padding: const EdgeInsets.only(
                                                  bottom: 12.0, right: 5),
                                              child: SvgPicture.asset(
                                                "assets/ImagesY/RoutineScreen/AddhabbitIcons/Others/Brush_2_times_Icon.svg",
                                                width: 24,
                                                height: 24,
                                              ),
                                            )
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 13.0),
                                          child: Container(
                                            width: 123,
                                            height: 15,
                                            decoration: const ShapeDecoration(
                                              color: Color(0xFFD03C91),
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(0),
                                                  topRight: Radius.circular(0),
                                                  bottomLeft:
                                                      Radius.circular(15),
                                                  bottomRight:
                                                      Radius.circular(15),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ]),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),

                  Visibility(
                    visible: CustomHabitNames.length != 0,
                    child: Padding(
                      padding: EdgeInsets.only(top: 25, left: 19),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 197,
                            height: 23,
                            child: Text(
                              'CustomHabits',
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
                  ),
                  Visibility(
                    visible: CustomHabitNames.length != 0,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 11.0,
                      ),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: 81,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                                itemCount: CustomHabitNames.length,
                                itemBuilder: (BuildContext context,int index){
                                  print(Habbits['Custom']);
                                  return   Padding(
                                    padding: const EdgeInsets.only(left: 15.0),
                                    child: GestureDetector(
                                      onTap: () {

                                        selectedHabit = CustomHabitNames[index];

                                        SelectedCatagory = "Custom";
                                        List<String> p=[];
                                        Habbits[SelectedCatagory]![
                                        selectedHabit]!['properties'].forEach((element) {
                                          p.add(element.toString());
                                        });
                                        target = "30";
                                        SelectedHabitIcon = Habbits[
                                        SelectedCatagory]![selectedHabit]!['Icon'];
                                        SelectedColorIndex = Habbits[
                                        SelectedCatagory]![selectedHabit]!['color']??0;
                                        Properties =p;
                                        Navigator.of(context2).pushNamed(
                                          "/HabitAddisionScree",
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
                                          decoration: ShapeDecoration(
                                            gradient: LinearGradient(
                                              begin: Alignment(-1.00, 0.00),
                                              end: Alignment(1, 0),
                                              colors: [
                                                Color(0x0001BBF6),
                                                Color(0x3301BBF6)
                                              ],
                                            ),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(15),
                                            ),
                                          ),
                                          child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets.only(
                                                          top: 7.0, left: 5),
                                                      child: SizedBox(
                                                        width: 81,
                                                        height: 45,
                                                        child: Text(
                                                          CustomHabitNames[index],
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
                                                      padding: const EdgeInsets.only(
                                                          bottom: 12.0, right: 5),
                                                      child: SvgPicture.asset(
                                                        CustomHabitIcons[index],
                                                        width: 24,
                                                        height: 24,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                Padding(
                                                  padding:
                                                  const EdgeInsets.only(top: 13.0),
                                                  child: Container(
                                                    width: 123,
                                                    height: 15,
                                                    decoration: const ShapeDecoration(
                                                      color: Color(0xFF01BBF6),
                                                      shape: RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.only(
                                                          topLeft: Radius.circular(0),
                                                          topRight: Radius.circular(0),
                                                          bottomLeft:
                                                          Radius.circular(15),
                                                          bottomRight:
                                                          Radius.circular(15),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ]),
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                          )
                        ),
                      ),
                    ),
                  ),


                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 22, left: 20),
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
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: 15.0,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    BlocProvider.of<AddHabitBloc>(context).add(
                                        StayingFitClickedEvent(
                                            StayingFirOpened: !stayingFit));
                                  },
                                  child: Container(
                                    width: 400,
                                    height: 51,
                                    decoration: ShapeDecoration(
                                      color: Theme.of(context)
                                          .inputDecorationTheme
                                          .fillColor,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                    ),
                                    child: Container(
                                      width: 400,
                                      height: 51,
                                      decoration: ShapeDecoration(
                                        gradient: LinearGradient(
                                          begin: Alignment(-1.00, 0.00),
                                          end: Alignment(1, 0),
                                          colors: [
                                            Color(0x00DB6100),
                                            Color(0x33DB6100)
                                          ],
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(15),
                                        ),
                                      ),
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 10.0),
                                            child: SvgPicture.asset(
                                              "assets/ImagesY/RoutineScreen/AddhabbitIcons/StayingFitIcons/Hit_Gym_Icon.svg",
                                              width: 20,
                                              height: 20,
                                              color: Theme.of(context)
                                                  .textTheme
                                                  .titleMedium
                                                  ?.color,
                                            ),
                                          ),
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
                                                left: 222.0, bottom: 1),
                                            child: IconButton(
                                                splashColor: Colors.transparent,
                                                onPressed: () {
                                                  BlocProvider.of<AddHabitBloc>(
                                                          context)
                                                      .add(StayingFitClickedEvent(
                                                          StayingFirOpened:
                                                              !stayingFit));
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
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Visibility(
                        visible: stayingFit,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 11.0,
                          ),
                          child: SingleChildScrollView(
                            physics: NeverScrollableScrollPhysics(),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  height: 81,
                                  child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: Habitnames.length,
                                      itemBuilder:
                                          (BuildContext context2, int index) {
                                        return Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 15.0),
                                          child: GestureDetector(
                                            onTap: () {
                                              selectedHabit = Habitnames[index];
                                              SelectedCatagory = "Staying fit";
                                              SelectedColorIndex = 1;
                                              target = "30";
                                              List<String> p=[];
                                              Habbits[SelectedCatagory]![
                                              selectedHabit]!['properties'].forEach((element) {
                                                p.add(element.toString());
                                              });
                                              SelectedHabitIcon =
                                                  Habbits[
                                                          SelectedCatagory]![
                                                      selectedHabit]!['Icon'];
                                              Properties = p;
                                              print(Properties);
                                              Navigator.of(context2).pushNamed(
                                                "/HabitAddisionScree",
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
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                ),
                                              ),
                                              child: Container(
                                                width: 123,
                                                height: 80,
                                                decoration: ShapeDecoration(
                                                  gradient: LinearGradient(
                                                    begin:
                                                        Alignment(-1.00, 0.00),
                                                    end: Alignment(1, 0),
                                                    colors: [
                                                      Color(0x00DB6100),
                                                      Color(0x33DB6100)
                                                    ],
                                                  ),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                  ),
                                                ),
                                                child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .only(
                                                                    top: 7.0,
                                                                    left: 5),
                                                            child: SizedBox(
                                                              width: 81,
                                                              height: 45,
                                                              child: Text(
                                                                Habitnames[
                                                                    index],
                                                                style:
                                                                    TextStyle(
                                                                  color: Theme.of(
                                                                          context)
                                                                      .textTheme
                                                                      .titleMedium
                                                                      ?.color,
                                                                  fontSize: 16,
                                                                  fontFamily:
                                                                      'DM Sans',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  height: 0,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .only(
                                                                    bottom:
                                                                        12.0,
                                                                    right: 5),
                                                            child: SvgPicture
                                                                .asset(
                                                              HabitIcons[index],
                                                              width: 24,
                                                              height: 24,
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                                top: 13.0),
                                                        child: Container(
                                                          width: 123,
                                                          height: 15,
                                                          decoration:
                                                              const ShapeDecoration(
                                                            color: Color(
                                                                0xffF36C00),
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        0),
                                                                topRight: Radius
                                                                    .circular(
                                                                        0),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        15),
                                                                bottomRight:
                                                                    Radius
                                                                        .circular(
                                                                            15),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ]),
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
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: 15.0,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                GestureDetector(
                                  onTap: () {
                                    BlocProvider.of<AddHabitBloc>(context).add(
                                        StressReliefClickedEvent(
                                            StressReliefOpend: !stressRelief));
                                  },
                                  child: Container(
                                    width: 400,
                                    height: 51,
                                    decoration: ShapeDecoration(
                                      color: Theme.of(context)
                                          .inputDecorationTheme
                                          .fillColor,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                    ),
                                    child: Container(
                                      width: 400,
                                      height: 51,
                                      decoration: ShapeDecoration(
                                        gradient: LinearGradient(
                                          begin: Alignment(-1.00, 0.00),
                                          end: Alignment(1, 0),
                                          colors: [
                                            Color(0x009D6BCE),
                                            Color(0x339D6BCE)
                                          ],
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(15),
                                        ),
                                      ),
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding:
                                            const EdgeInsets.only(left: 10.0),
                                            child: SvgPicture.asset(
                                              "assets/ImagesY/RoutineScreen/AddhabbitIcons/StressRelief/Meditate.svg",
                                              width: 20,
                                              height: 20,
                                              color: Theme.of(context)
                                                  .textTheme
                                                  .titleMedium
                                                  ?.color,
                                            ),
                                          ),
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
                                                left: 198.0, bottom: 1),
                                            child: IconButton(
                                                onPressed: () {
                                                  BlocProvider.of<AddHabitBloc>(
                                                          context)
                                                      .add(
                                                          StressReliefClickedEvent(
                                                              StressReliefOpend:
                                                                  !stressRelief));
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
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Visibility(
                        visible: stressRelief,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 11.0,
                          ),
                          child: SingleChildScrollView(
                            physics: NeverScrollableScrollPhysics(),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  height: 81,
                                  child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: Habitnames.length,
                                      itemBuilder:
                                          (BuildContext context2, int index) {
                                        return Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 15.0),
                                          child: GestureDetector(
                                            onTap: () {
                                              selectedHabit = Habitnames[index];
                                              SelectedCatagory =
                                                  "Stress Relief";
                                              SelectedColorIndex = 0;
                                              target = "30";
                                              List<String> p=[];
                                              Habbits[SelectedCatagory]![
                                              selectedHabit]!['properties'].forEach((element) {
                                                p.add(element.toString());
                                              });
                                              SelectedHabitIcon =
                                                  Habbits[
                                                          SelectedCatagory]![
                                                      selectedHabit]!['Icon'];
                                              Properties = p;
                                              print(Properties);
                                              Navigator.of(context2).pushNamed(
                                                "/HabitAddisionScree",
                                              );
                                            },
                                            child: Container(
                                              width: 130,
                                              height: 80,
                                              clipBehavior: Clip.antiAlias,
                                              decoration: ShapeDecoration(
                                                color: Theme.of(context)
                                                    .inputDecorationTheme
                                                    .fillColor,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                ),
                                              ),
                                              child: Container(
                                                width: 123,
                                                height: 80,
                                                decoration: ShapeDecoration(
                                                  gradient: LinearGradient(
                                                    begin:
                                                        Alignment(-1.00, 0.00),
                                                    end: Alignment(1, 0),
                                                    colors: [
                                                      Color(0x009D6BCE),
                                                      Color(0x339D6BCE)
                                                    ],
                                                  ),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                  ),
                                                ),
                                                child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .only(
                                                                    top: 7.0,
                                                                    left: 5),
                                                            child: SizedBox(
                                                              width: 81,
                                                              height: 45,
                                                              child: Text(
                                                                Habitnames[
                                                                    index],
                                                                style:
                                                                    TextStyle(
                                                                  color: Theme.of(
                                                                          context)
                                                                      .textTheme
                                                                      .titleMedium
                                                                      ?.color,
                                                                  fontSize: 16,
                                                                  fontFamily:
                                                                      'DM Sans',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  height: 0,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .only(
                                                                    bottom:
                                                                        12.0,
                                                                    right: 5),
                                                            child: SvgPicture
                                                                .asset(
                                                              HabitIcons[index],
                                                              width: 24,
                                                              height: 24,
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                                top: 13.0),
                                                        child: Container(
                                                          width: 130,
                                                          height: 15,
                                                          decoration:
                                                              const ShapeDecoration(
                                                            color: Color(
                                                                0xFF9D6BCE),
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        0),
                                                                topRight: Radius
                                                                    .circular(
                                                                        0),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        15),
                                                                bottomRight:
                                                                    Radius
                                                                        .circular(
                                                                            15),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ]),
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
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: 15.0,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    BlocProvider.of<AddHabitBloc>(context).add(
                                        HealthyLifeStyleClickedEvent(
                                            HealthyLifeStyleOpend:
                                                !healthyLifeStyle));
                                  },
                                  child: Container(
                                    width: 400,
                                    height: 51,
                                    decoration: ShapeDecoration(
                                      color: Theme.of(context)
                                          .inputDecorationTheme
                                          .fillColor,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                    ),
                                    child: Container(
                                      width: 400,
                                      height: 51,
                                      decoration: ShapeDecoration(
                                        gradient: LinearGradient(
                                          begin: Alignment(-1.00, 0.00),
                                          end: Alignment(1, 0),
                                          colors: [
                                            Color(0x0001BBF6),
                                            Color(0x3301BBF6)
                                          ],
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(15),
                                        ),
                                      ),
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding:
                                            const EdgeInsets.only(left: 18.0),
                                            child: SvgPicture.asset(
                                              "assets/ImagesY/RoutineScreen/AddhabbitIcons/HealthyLifeStyle/Eat_Fruit_Icon.svg",
                                              width: 22,
                                              height: 22,
                                              color: Theme.of(context)
                                                  .textTheme
                                                  .titleMedium
                                                  ?.color,
                                            ),
                                          ),
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
                                                left: 172.0, bottom: 1),
                                            child: IconButton(
                                                onPressed: () {
                                                  BlocProvider.of<AddHabitBloc>(
                                                          context)
                                                      .add(HealthyLifeStyleClickedEvent(
                                                          HealthyLifeStyleOpend:
                                                              !healthyLifeStyle));
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
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Visibility(
                        visible: healthyLifeStyle,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 11.0,
                          ),
                          child: SingleChildScrollView(
                            physics: NeverScrollableScrollPhysics(),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  height: 81,
                                  child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: Habitnames.length,
                                      itemBuilder:
                                          (BuildContext context2, int index) {
                                        return Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10.0),
                                          child: GestureDetector(
                                            onTap: () {
                                              selectedHabit = Habitnames[index];

                                              SelectedCatagory =
                                                  "Healthy LifeStyle";
                                              target = "30";
                                              List<String> p=[];
                                              Habbits[SelectedCatagory]![
                                              selectedHabit]!['properties'].forEach((element) {
                                                p.add(element.toString());
                                              });
                                              SelectedHabitIcon =
                                                  Habbits[
                                                          SelectedCatagory]![
                                                      selectedHabit]!['Icon'];
                                              SelectedColorIndex = 3;
                                              Properties = p;
                                              Navigator.of(context2).pushNamed(
                                                "/HabitAddisionScree",
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
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                ),
                                              ),
                                              child: Container(
                                                width: 123,
                                                height: 80,
                                                decoration: ShapeDecoration(
                                                  gradient: LinearGradient(
                                                    begin:
                                                        Alignment(-1.00, 0.00),
                                                    end: Alignment(1, 0),
                                                    colors: [
                                                      Color(0x0001BBF6),
                                                      Color(0x3301BBF6)
                                                    ],
                                                  ),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                  ),
                                                ),
                                                child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .only(
                                                                    top: 7.0,
                                                                    left: 5),
                                                            child: SizedBox(
                                                              width: 81,
                                                              height: 45,
                                                              child: Text(
                                                                Habitnames[
                                                                    index],
                                                                style:
                                                                    TextStyle(
                                                                  color: Theme.of(
                                                                          context)
                                                                      .textTheme
                                                                      .titleMedium
                                                                      ?.color,
                                                                  fontSize: 16,
                                                                  fontFamily:
                                                                      'DM Sans',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  height: 0,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .only(
                                                                    bottom:
                                                                        12.0,
                                                                    right: 5),
                                                            child: SvgPicture
                                                                .asset(
                                                              HabitIcons[index],
                                                              width: 24,
                                                              height: 24,
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                                top: 13.0),
                                                        child: Container(
                                                          width: 123,
                                                          height: 15,
                                                          decoration:
                                                              const ShapeDecoration(
                                                            color: Color(
                                                                0xFF01BBF6),
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        0),
                                                                topRight: Radius
                                                                    .circular(
                                                                        0),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        15),
                                                                bottomRight:
                                                                    Radius
                                                                        .circular(
                                                                            15),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ]),
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
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: 15.0,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    BlocProvider.of<AddHabitBloc>(context).add(
                                        LovedOnesClickedEvent(
                                            LovedOnesOpend: !lovedOnes));
                                  },
                                  child: Container(
                                    width: 400,
                                    height: 51,
                                    decoration: ShapeDecoration(
                                      color: Theme.of(context)
                                          .inputDecorationTheme
                                          .fillColor,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                    ),
                                    child: Container(
                                      width: 400,
                                      height: 51,
                                      decoration: ShapeDecoration(
                                        gradient: LinearGradient(
                                          begin: Alignment(-1.00, 0.00),
                                          end: Alignment(1, 0),
                                          colors: [
                                            Color(0x00FE8596),
                                            Color(0x33FE8596)
                                          ],
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(15),
                                        ),
                                      ),
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding:
                                            const EdgeInsets.only(left: 10.0),
                                            child: SvgPicture.asset(
                                              "assets/ImagesY/RoutineScreen/AddhabbitIcons/LovedOnes/Family_time_icon.svg",
                                              width: 20,
                                              height: 20,
                                              color: Theme.of(context)
                                                  .textTheme
                                                  .titleMedium
                                                  ?.color,
                                            ),
                                          ),

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
                                                left: 210.0, bottom: 1),
                                            child: IconButton(
                                                onPressed: () {
                                                  BlocProvider.of<AddHabitBloc>(
                                                          context)
                                                      .add(LovedOnesClickedEvent(
                                                          LovedOnesOpend:
                                                              !lovedOnes));
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
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Visibility(
                        visible: lovedOnes,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 11.0,
                          ),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  height: 81,
                                  child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: Habitnames.length,
                                      itemBuilder:
                                          (BuildContext context2, int index) {
                                        return Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 15.0),
                                          child: GestureDetector(
                                            onTap: () {
                                              selectedHabit = Habitnames[index];

                                              SelectedCatagory = "Loved Ones";
                                              target = "30";
                                              List<String> p=[];
                                              Habbits[SelectedCatagory]![
                                              selectedHabit]!['properties'].forEach((element) {
                                                p.add(element.toString());
                                              });
                                              SelectedHabitIcon =
                                                  Habbits[
                                                          SelectedCatagory]![
                                                      selectedHabit]!['Icon'];
                                              SelectedColorIndex = 6;
                                              Properties = p;
                                              Navigator.of(context2).pushNamed(
                                                "/HabitAddisionScree",
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
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                ),
                                              ),
                                              child: Container(
                                                width: 123,
                                                height: 80,
                                                decoration: ShapeDecoration(
                                                  gradient: LinearGradient(
                                                    begin:
                                                        Alignment(-1.00, 0.00),
                                                    end: Alignment(1, 0),
                                                    colors: [
                                                      Color(0x00FE8596),
                                                      Color(0x33FE8596)
                                                    ],
                                                  ),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                  ),
                                                ),
                                                child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .only(
                                                                    top: 7.0,
                                                                    left: 5),
                                                            child: SizedBox(
                                                              width: 81,
                                                              height: 45,
                                                              child: Text(
                                                                Habitnames[
                                                                    index],
                                                                style:
                                                                    TextStyle(
                                                                  color: Theme.of(
                                                                          context)
                                                                      .textTheme
                                                                      .titleMedium
                                                                      ?.color,
                                                                  fontSize: 16,
                                                                  fontFamily:
                                                                      'DM Sans',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  height: 0,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .only(
                                                                    bottom:
                                                                        12.0,
                                                                    right: 5),
                                                            child: SvgPicture
                                                                .asset(
                                                              HabitIcons[index],
                                                              width: 24,
                                                              height: 24,
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                                top: 13.0),
                                                        child: Container(
                                                          width: 123,
                                                          height: 15,
                                                          decoration:
                                                              const ShapeDecoration(
                                                            color: Color(
                                                                0xFFFE8596),
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        0),
                                                                topRight: Radius
                                                                    .circular(
                                                                        0),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        15),
                                                                bottomRight:
                                                                    Radius
                                                                        .circular(
                                                                            15),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ]),
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
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: 15.0,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    BlocProvider.of<AddHabitBloc>(context).add(
                                        PersonalFinanceEvent(
                                            PersonalFinanceOpened:
                                                !personalFinance));
                                  },
                                  child: Container(
                                    width: 400,
                                    height: 51,
                                    decoration: ShapeDecoration(
                                      color: Theme.of(context)
                                          .inputDecorationTheme
                                          .fillColor,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                    ),
                                    child: Container(
                                      width: 400,
                                      height: 51,
                                      decoration: ShapeDecoration(
                                        gradient: LinearGradient(
                                          begin: Alignment(-1.00, 0.00),
                                          end: Alignment(1, 0),
                                          colors: [
                                            Color(0x00A9E32C),
                                            Color(0x33A9E32C)
                                          ],
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(15),
                                        ),
                                      ),
                                      child: Row(
                                        children: [

                                          Padding(
                                            padding:
                                            const EdgeInsets.only(left: 10.0),
                                            child: SvgPicture.asset(
                                              "assets/ImagesY/RoutineScreen/AddhabbitIcons/PersonalFinance/Save_10%_Of_Incone_Icon.svg",
                                              width: 20,
                                              height: 20,
                                              color: Theme.of(context)
                                                  .textTheme
                                                  .titleMedium
                                                  ?.color,
                                            ),
                                          ),

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
                                                left: 180.0, bottom: 1),
                                            child: IconButton(
                                                onPressed: () {
                                                  BlocProvider.of<AddHabitBloc>(
                                                          context)
                                                      .add(PersonalFinanceEvent(
                                                          PersonalFinanceOpened:
                                                              !personalFinance));
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
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Visibility(
                        visible: personalFinance,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 11.0,
                          ),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  height: 81,
                                  child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: Habitnames.length,
                                      itemBuilder:
                                          (BuildContext context2, int index) {
                                        return Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 15.0),
                                          child: GestureDetector(
                                            onTap: () {
                                              selectedHabit = Habitnames[index];

                                              SelectedCatagory =
                                                  "Personal Finance";
                                              target = "30";
                                              SelectedHabitIcon =
                                                  Habbits[
                                                          SelectedCatagory]![
                                                      selectedHabit]!['Icon'];
                                              SelectedColorIndex = 2;
                                              List<String> p=[];
                                              Habbits[SelectedCatagory]![
                                              selectedHabit]!['properties'].forEach((element) {
                                                p.add(element.toString());
                                              });
                                              Properties = p;
                                              Navigator.of(context2).pushNamed(
                                                "/HabitAddisionScree",
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
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                ),
                                              ),
                                              child: Container(
                                                width: 123,
                                                height: 80,
                                                decoration: ShapeDecoration(
                                                  gradient: LinearGradient(
                                                    begin:
                                                        Alignment(-1.00, 0.00),
                                                    end: Alignment(1, 0),
                                                    colors: [
                                                      Color(0x00A9E32C),
                                                      Color(0x33A9E32C)
                                                    ],
                                                  ),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                  ),
                                                ),
                                                child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .only(
                                                                    top: 7.0,
                                                                    left: 5),
                                                            child: SizedBox(
                                                              width: 81,
                                                              height: 45,
                                                              child: Text(
                                                                Habitnames[
                                                                    index],
                                                                style:
                                                                    TextStyle(
                                                                  color: Theme.of(
                                                                          context)
                                                                      .textTheme
                                                                      .titleMedium
                                                                      ?.color,
                                                                  fontSize: 16,
                                                                  fontFamily:
                                                                      'DM Sans',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  height: 0,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .only(
                                                                    bottom:
                                                                        12.0,
                                                                    right: 5),
                                                            child: SvgPicture
                                                                .asset(
                                                              HabitIcons[index],
                                                              width: 24,
                                                              height: 24,
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                                top: 13.0),
                                                        child: Container(
                                                          width: 123,
                                                          height: 15,
                                                          decoration:
                                                              const ShapeDecoration(
                                                            color: Color(
                                                                0xFFA8E32C),
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        0),
                                                                topRight: Radius
                                                                    .circular(
                                                                        0),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        15),
                                                                bottomRight:
                                                                    Radius
                                                                        .circular(
                                                                            15),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ]),
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
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: 15.0,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    BlocProvider.of<AddHabitBloc>(context)
                                        .add(OthersEvent(OthersOpened: !Other));
                                  },
                                  child: Container(
                                    width: 400,
                                    height: 51,
                                    decoration: ShapeDecoration(
                                      color: Theme.of(context)
                                          .inputDecorationTheme
                                          .fillColor,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                    ),
                                    child: Container(
                                      width: 400,
                                      height: 51,
                                      decoration: ShapeDecoration(
                                        gradient: const LinearGradient(
                                          begin: Alignment(-1.00, 0.00),
                                          end: Alignment(1, 0),
                                          colors: [
                                            Color(0x00D03C91),
                                            Color(0x33D03C91)
                                          ],
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(15),
                                        ),
                                      ),
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding:
                                            const EdgeInsets.only(left: 10.0),
                                            child: SvgPicture.asset(
                                              "assets/ImagesY/RoutineScreen/AddhabbitIcons/Others/OthersIcon.svg",
                                              width: 20,
                                              height: 20,
                                              color: Theme.of(context)
                                                  .textTheme
                                                  .titleMedium
                                                  ?.color,
                                            ),
                                          ),
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
                                                left: 240.0, bottom: 1),
                                            child: IconButton(
                                                onPressed: () {
                                                  BlocProvider.of<AddHabitBloc>(
                                                          context)
                                                      .add(OthersEvent(
                                                          OthersOpened: !Other));
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
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Visibility(
                        visible: Other,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 11.0, left: 0, right: 10),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  height: 81,
                                  child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: Habitnames.length,
                                      itemBuilder:
                                          (BuildContext context2, int index) {
                                        return Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 15.0),
                                          child: GestureDetector(
                                            onTap: () {
                                              selectedHabit = Habitnames[index];
                                              SelectedCatagory = "Others";
                                              target = "30";
                                              SelectedHabitIcon =
                                                  Habbits[
                                                          SelectedCatagory]![
                                                      selectedHabit]!['Icon'];
                                              List<String> p=[];
                                              Habbits[SelectedCatagory]![
                                              selectedHabit]!['properties'].forEach((element) {
                                                p.add(element.toString());
                                              });
                                              SelectedColorIndex = 4;
                                              Properties = p;
                                              Navigator.of(context2).pushNamed(
                                                "/HabitAddisionScree",
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
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                ),
                                              ),
                                              child: Container(
                                                width: 123,
                                                height: 80,
                                                decoration: ShapeDecoration(
                                                  gradient: LinearGradient(
                                                    begin:
                                                        Alignment(-1.00, 0.00),
                                                    end: Alignment(1, 0),
                                                    colors: [
                                                      Color(0x00D03C91),
                                                      Color(0x33D03C91)
                                                    ],
                                                  ),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                  ),
                                                ),
                                                child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .only(
                                                                    top: 7.0,
                                                                    left: 5),
                                                            child: SizedBox(
                                                              width: 75,
                                                              height: 45,
                                                              child: Text(
                                                                Habitnames[
                                                                    index],
                                                                style:
                                                                    TextStyle(
                                                                  color: Theme.of(
                                                                          context)
                                                                      .textTheme
                                                                      .titleMedium
                                                                      ?.color,
                                                                  fontSize: 16,
                                                                  fontFamily:
                                                                      'DM Sans',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  height: 0,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .only(
                                                                    bottom:
                                                                        12.0,
                                                                    right: 5),
                                                            child: SvgPicture
                                                                .asset(
                                                              HabitIcons[index],
                                                              width: 24,
                                                              height: 24,
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                                top: 13.0),
                                                        child: Container(
                                                          width: 123,
                                                          height: 15,
                                                          decoration:
                                                              const ShapeDecoration(
                                                            color: Color(
                                                                0xFFD03C91),
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        0),
                                                                topRight: Radius
                                                                    .circular(
                                                                        0),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        15),
                                                                bottomRight:
                                                                    Radius
                                                                        .circular(
                                                                            15),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ]),
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
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Center(
                          child: Padding(
                              padding: const EdgeInsets.only(top: 12.0),
                              child: GestureDetector(
                                onTap: (){

                                  Navigator.of(context2).pushNamed(
                                    "/CustomHabitAdission",
                                  );
                                },
                                child: Container(
                                  width: 400,
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
                                      const SizedBox(width: 55),
                                      Container(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              width: 17,
                                              height: 14,
                                              padding: const EdgeInsets.all(0.88),
                                              clipBehavior: Clip.antiAlias,
                                              decoration: const BoxDecoration(),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    width: 12.25,
                                                    height: 12.25,
                                                    child: SvgPicture.asset(
                                                        "assets/ImagesY/RoutineScreen/AddhabbitIcons/CreateNewHabitAdd.svg"),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )),
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

Map<String , dynamic> SearchedResult(Map<String, Map<String, Map<String, dynamic>>> habits,String habitname){

  Map<String,dynamic> searchedhabit={};
  habits.forEach((key, value) {
    value.forEach((key, value) {
      value.forEach((key, value) {
        if(key.contains(habitname)){
          searchedhabit[key]=value;
        }
      });
    });
  });
  print("----------> searchedhabit");
  return searchedhabit;
}
