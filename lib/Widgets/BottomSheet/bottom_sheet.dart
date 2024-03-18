import 'package:flutter/material.dart';

class BottomSheetCustom extends StatefulWidget {
  const BottomSheetCustom({Key? key}) : super(key: key);

  @override
  _BottomSheetCustomState createState() => _BottomSheetCustomState();
}

class _BottomSheetCustomState extends State<BottomSheetCustom> {
  // State variable to keep track of the selected date
  int? selectedDate;

  @override
  Widget build(BuildContext context) {
    // Get the current month
    final currentMonth = DateTime.now().month;
    PageController _pageController =
        PageController(initialPage: DateTime.now().month - 1);

    // Calculate the number of days in the current month
    final daysInMonth = DateTime(DateTime.now().year, currentMonth + 1, 0).day;

    // List of days of the week
    final List<String> daysOfWeek = [
      'Mon',
      'Tue',
      'Wed',
      'Thu',
      'Fri',
      'Sat',
      'Sun'
    ];

    // Get the day of the week for the first day of the month
    final int firstDayIndex =
        DateTime(DateTime.now().year, currentMonth, 1).weekday - 1;

    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: ShapeDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40.0),
            topRight: Radius.circular(40.0),
          ),
        ),
      ),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: Container(
              width: 76,
              height: 4,
              decoration: ShapeDecoration(
                color: Theme.of(context).inputDecorationTheme.fillColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.arrow_back_ios_rounded,
                    color: Theme.of(context).textTheme.headline1?.color),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    'March, 2024',
                    style: TextStyle(
                      color: Theme.of(context).textTheme.headline1?.color,
                      fontSize: 16,
                      fontFamily: 'DM Sans',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                ),
                Icon(Icons.arrow_forward_ios_rounded,
                    color: Theme.of(context).textTheme.headline1?.color),
              ],
            ),
          ),
          SizedBox(height: 20),
          // Row for the days of the week
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: daysOfWeek
                  .map((day) => Text(
                        day,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ))
                  .toList(),
            ),
          ),
          SizedBox(height: 5),
          // Calendar View
          Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 200,
              child: PageView.builder(
                  controller: _pageController,
                  itemCount: 12,
                  itemBuilder: (context, index) {
                    return MonthlyGridView( monthIndex: index,);
                  }),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 40.0),
            child: TextButton(
              onPressed: () {},
              child:  Text(
                'Repeats every day',
                style: TextStyle(
                  color: Theme.of(context).textTheme.headline1?.color,
                  fontSize: 16,
                  fontFamily: 'DM Sans',
                  fontWeight: FontWeight.w500,
                  decoration: TextDecoration.underline,
                  height: 0,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class MonthlyGridView extends StatefulWidget{
  final int monthIndex;

  MonthlyGridView({required this.monthIndex});

  @override
  State<MonthlyGridView> createState() => _MonthlyGridViewState();
}

class _MonthlyGridViewState extends State<MonthlyGridView> {
  int? selectedDate;

  @override
  Widget build(BuildContext context) {
    final currentMonth = DateTime.now().month + widget.monthIndex;
    final daysInMonth = DateTime(DateTime.now().year, int.parse((currentMonth + 1).toString()), 0).day;
    final int firstDayIndex = DateTime(DateTime.now().year, int.parse((currentMonth + 1).toString()), 1).weekday -1;

    return CustomPaint(
      painter: DatePainter(firstDayIndex, daysInMonth, selectedDate),
      child: GridView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 7, // 7 columns for 7 days
            mainAxisExtent: 40),
        itemCount: daysInMonth + firstDayIndex,
        itemBuilder: (context, index) {
          if (index < firstDayIndex) {
            // Empty cell before the start of the month
            return Container();
          } else {
            // Calculate the day of the month
            final dayOfMonth = index - firstDayIndex + 1;
            return GestureDetector(
              onTap: () {
                // Update selected date and trigger repaint
                setState(() {
                  selectedDate = dayOfMonth;
                });
              },
              child: Padding(
                padding: const EdgeInsets.only(bottom: 4.0),
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    '$dayOfMonth',
                    style: TextStyle(
                      color: Theme.of(context)
                          .textTheme
                          .headline1
                          ?.color,
                      // Example text color
                      fontSize: 12,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}

class DatePainter extends CustomPainter {
  final int firstDayIndex;
  final int daysInMonth;
  final int? selectedDate;

  DatePainter(this.firstDayIndex, this.daysInMonth, this.selectedDate);

  @override
  void paint(Canvas canvas, Size size) {
    final cellWidth = size.width / 7;
    final cellHeight = size.height / ((daysInMonth + firstDayIndex) / 7);

    // Draw circular shape for selected date
    if (selectedDate != null) {
      final Paint paint = Paint()..color = Color(0xFF9D6BCE); // Example color
      final int row = ((selectedDate! + firstDayIndex - 1) / 7).toInt();
      final int col = ((selectedDate! + firstDayIndex - 1) % 7).toInt();
      final centerX = (col + 0.5) * cellWidth;
      final centerY = (row + 0.5) * cellHeight;
      final double radius = cellWidth * 0.2;
      canvas.drawCircle(Offset(centerX, centerY), radius, paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
