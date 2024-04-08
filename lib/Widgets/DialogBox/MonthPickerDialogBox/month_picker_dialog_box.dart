import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class MonthDialogPicker extends StatefulWidget {
  String month;
  final Function(String) callback;
   MonthDialogPicker({super.key, required this.callback,required this.month});

  @override
  State<MonthDialogPicker> createState() => _MonthDialogPickerState();
}

class _MonthDialogPickerState extends State<MonthDialogPicker> {
  String month = "Jan";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    month=widget.month;
  }
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      elevation: 2,
      child: Container(
        width: 277,
        height: 300,
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: Theme.of(context).textTheme.bodyText2?.color == Colors.black
              ? Colors.white
              : const Color(0xFF1F1F1F),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
        ),
        child: Column(
          children: [
            Container(
              width: 300,
              height: 63,
              decoration: const BoxDecoration(color: Color(0xFFA8E32C)),
              child: Center(
                  child: Text("Select Month",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.dmSerifDisplay(
                        textStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 26,
                          fontFamily: 'DM Serif Display',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ))),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        month = "Jan";
                      });
                      widget.callback("January");
                      Navigator.pop(context);
                      print("hello");
                    },
                    child: Container(
                      width: 39,
                      height: 25,
                      padding: const EdgeInsets.all(5),
                      decoration: month == "Jan"
                          ? ShapeDecoration(
                              color: const Color(0xFFA8E32C),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(11),
                              ),
                            )
                          : ShapeDecoration(
                              color: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0),
                              ),
                            ),
                      child: Center(
                        child: Text(
                          "Jan",
                          style: TextStyle(
                            color: month == "Jan"
                                ? Colors.white
                                : Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.color,
                            fontSize: 16,
                            fontFamily: 'DM Sans',
                            fontWeight: FontWeight.w400,
                            height: 0.06,
                            letterSpacing: 0.16,
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        month = "Feb";
                      });
                      widget.callback("February");
                      Navigator.pop(context);

                      print("hello");
                    },
                    child: Container(
                      width: 39,
                      height: 25,
                      padding: const EdgeInsets.all(5),
                      decoration: month == "Feb"
                          ? ShapeDecoration(
                              color: const Color(0xFFA8E32C),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(11),
                              ),
                            )
                          : ShapeDecoration(
                              color: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0),
                              ),
                            ),
                      child: Center(
                        child: Text(
                          "Feb",
                          style: TextStyle(
                            color: month == "Feb"
                                ? Colors.white
                                : Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.color,
                            fontSize: 16,
                            fontFamily: 'DM Sans',
                            fontWeight: FontWeight.w400,
                            height: 0.06,
                            letterSpacing: 0.16,
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        month = "Mar";
                      });
                      widget.callback("March");
                      Navigator.pop(context);

                      print("hello");
                    },
                    child: Container(
                      width: 39,
                      height: 25,
                      padding: const EdgeInsets.all(5),
                      decoration: month == "Mar"
                          ? ShapeDecoration(
                              color: const Color(0xFFA8E32C),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(11),
                              ),
                            )
                          : ShapeDecoration(
                              color: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0),
                              ),
                            ),
                      child: Center(
                        child: Text(
                          "Mar",
                          style: TextStyle(
                            color: month == "Mar"
                                ? Colors.white
                                : Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.color,
                            fontSize: 16,
                            fontFamily: 'DM Sans',
                            fontWeight: FontWeight.w400,
                            height: 0.06,
                            letterSpacing: 0.16,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0, left: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        month = "Apr";
                      });
                      widget.callback("April");
                      Navigator.pop(context);

                      print("hello");
                    },
                    child: Container(
                      width: 39,
                      height: 25,
                      padding: const EdgeInsets.all(5),
                      decoration: month == "Apr"
                          ? ShapeDecoration(
                              color: const Color(0xFFA8E32C),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(11),
                              ),
                            )
                          : ShapeDecoration(
                              color: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0),
                              ),
                            ),
                      child: Center(
                        child: Text(
                          "Apr",
                          style: TextStyle(
                            color: month == "Apr"
                                ? Colors.white
                                : Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.color,
                            fontSize: 16,
                            fontFamily: 'DM Sans',
                            fontWeight: FontWeight.w400,
                            height: 0.06,
                            letterSpacing: 0.16,
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        month = "May";
                      });
                      widget.callback("May");
                      Navigator.pop(context);

                      print("hello");
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 35.0),
                      child: Container(
                        width: 45,
                        height: 25,
                        padding: const EdgeInsets.all(5),
                        decoration: month == "May"
                            ? ShapeDecoration(
                                color: const Color(0xFFA8E32C),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(11),
                                ),
                              )
                            : ShapeDecoration(
                                color: Colors.transparent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(0),
                                ),
                              ),
                        child: Center(
                          child: Text(
                            "May",
                            style: TextStyle(
                              color: month == "May"
                                  ? Colors.white
                                  : Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.color,
                              fontSize: 16,
                              fontFamily: 'DM Sans',
                              fontWeight: FontWeight.w400,
                              height: 0.06,
                              letterSpacing: 0.16,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        month = "June";
                      });
                      widget.callback("June");
                      Navigator.pop(context);

                      print("hello");
                    },
                    child: Container(
                      width: 50,
                      height: 25,
                      padding: const EdgeInsets.all(5),
                      decoration: month == "June"
                          ? ShapeDecoration(
                              color: const Color(0xFFA8E32C),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(11),
                              ),
                            )
                          : ShapeDecoration(
                              color: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0),
                              ),
                            ),
                      child: Center(
                        child: Text(
                          "June",
                          style: TextStyle(
                            color: month == "June"
                                ? Colors.white
                                : Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.color,
                            fontSize: 16,
                            fontFamily: 'DM Sans',
                            fontWeight: FontWeight.w400,
                            height: 0.06,
                            letterSpacing: 0.16,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0, left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        month = "July";
                      });
                      widget.callback("July");
                      Navigator.pop(context);

                      print("hello");
                    },
                    child: Container(
                      width: 45,
                      height: 25,
                      padding: const EdgeInsets.all(5),
                      decoration: month == "July"
                          ? ShapeDecoration(
                              color: const Color(0xFFA8E32C),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(11),
                              ),
                            )
                          : ShapeDecoration(
                              color: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0),
                              ),
                            ),
                      child: Center(
                        child: Text(
                          "July",
                          style: TextStyle(
                            color: month == "July"
                                ? Colors.white
                                : Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.color,
                            fontSize: 16,
                            fontFamily: 'DM Sans',
                            fontWeight: FontWeight.w400,
                            height: 0.06,
                            letterSpacing: 0.16,
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          month = "Aug";
                        });
                        widget.callback("August");
                        Navigator.pop(context);

                        print("hello");
                      },
                      child: Container(
                        width: 45,
                        height: 25,
                        padding: const EdgeInsets.all(5),
                        decoration: month == "Aug"
                            ? ShapeDecoration(
                                color: const Color(0xFFA8E32C),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(11),
                                ),
                              )
                            : ShapeDecoration(
                                color: Colors.transparent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(0),
                                ),
                              ),
                        child: Center(
                          child: Text(
                            "Aug",
                            style: TextStyle(
                              color: month == "Aug"
                                  ? Colors.white
                                  : Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.color,
                              fontSize: 16,
                              fontFamily: 'DM Sans',
                              fontWeight: FontWeight.w400,
                              height: 0.06,
                              letterSpacing: 0.16,
                            ),
                          ),
                        ),
                      )),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          month = "Sep";
                        });
                        widget.callback("September");
                        Navigator.pop(context);

                        print("hello");
                      },
                      child: Container(
                        width: 45,
                        height: 25,
                        padding: const EdgeInsets.all(5),
                        decoration: month == "Sep"
                            ? ShapeDecoration(
                                color: const Color(0xFFA8E32C),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(11),
                                ),
                              )
                            : ShapeDecoration(
                                color: Colors.transparent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(0),
                                ),
                              ),
                        child: Center(
                          child: Text(
                            "Sep",
                            style: TextStyle(
                              color: month == "Sep"
                                  ? Colors.white
                                  : Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.color,
                              fontSize: 16,
                              fontFamily: 'DM Sans',
                              fontWeight: FontWeight.w400,
                              height: 0.06,
                              letterSpacing: 0.16,
                            ),
                          ),
                        ),
                      ))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 20.0,
                left: 20
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        month = "Oct";
                      });
                      widget.callback("October");
                      Navigator.pop(context);

                      print("hello");
                    },
                    child: Container(
                      width: 45,
                      height: 25,
                      padding: const EdgeInsets.all(5),
                      decoration: month == "Oct"
                          ? ShapeDecoration(
                              color: const Color(0xFFA8E32C),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(11),
                              ),
                            )
                          : ShapeDecoration(
                              color: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0),
                              ),
                            ),
                      child: Center(
                        child: Text(
                          "Oct",
                          style: TextStyle(
                            color: month == "Oct"
                                ? Colors.white
                                : Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.color,
                            fontSize: 16,
                            fontFamily: 'DM Sans',
                            fontWeight: FontWeight.w400,
                            height: 0.06,
                            letterSpacing: 0.16,
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          month = "Nov";
                        });
                        widget.callback("November");
                        Navigator.pop(context);

                        print("hello");
                      },
                      child: Container(
                        width: 45,
                        height: 25,
                        padding: const EdgeInsets.all(5),
                        decoration: month == "Nov"
                            ? ShapeDecoration(
                                color: const Color(0xFFA8E32C),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(11),
                                ),
                              )
                            : ShapeDecoration(
                                color: Colors.transparent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(0),
                                ),
                              ),
                        child: Center(
                          child: Text(
                            "Nov",
                            style: TextStyle(
                              color: month == "Nov"
                                  ? Colors.white
                                  : Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.color,
                              fontSize: 16,
                              fontFamily: 'DM Sans',
                              fontWeight: FontWeight.w400,
                              height: 0.06,
                              letterSpacing: 0.16,
                            ),
                          ),
                        ),
                      )),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          month = "Dec";
                        });
                        widget.callback("December");
                        Navigator.pop(context);

                        print("hello");
                      },
                      child: Container(
                        width: 45,
                        height: 25,
                        padding: const EdgeInsets.all(5),
                        decoration: month == "Dec"
                            ? ShapeDecoration(
                                color: const Color(0xFFA8E32C),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(11),
                                ),
                              )
                            : ShapeDecoration(
                                color: Colors.transparent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(0),
                                ),
                              ),
                        child: Center(
                          child: Text(
                            "Dec",
                            style: TextStyle(
                              color: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.color,
                              fontSize: 16,
                              fontFamily: 'DM Sans',
                              fontWeight: FontWeight.w400,
                              height: 0.06,
                              letterSpacing: 0.16,
                            ),
                          ),
                        ),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
    ;
  }
}
