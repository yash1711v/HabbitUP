import 'package:bloc/bloc.dart';
import 'package:habitup/CommonMethods/Variable.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

part 'bottom_sheet_event.dart';
part 'bottom_sheet_state.dart';

class BottomSheetBloc extends Bloc<BottomSheetEvent, BottomSheetState> {
  BottomSheetBloc() : super(BottomSheetInitial()) {
    on<BottomSheetEvent>((event, emit) {
      // TODO: implement event handler
      if (event is MothChangeEvent) {
        emit(MonthChangeState(
            monthIndex: event.monthIndex, Datesare: event.Datesare));
      }
      if (event is RepeatCycleEvent) {
        emit(RepeatCycleState(
            repeat: event.repeat,
            whichOption: event.whichOption,
            Frequency: event.Frequency,
            numberPickervalue: event.numberPickervalue,
            setEndDate: event.setEndDate,
            monthIndex: event.monthIndex,
            onWhichDayif: event.onWhichDaysIfweeklu, DatesForMonth: event.DatesForMonth,endDate: event.endDate));
      }
    });
  }
}

void addDates({required int frequency, required String endDate}) {
  DateTime currentDate = DateTime.now();
  DateTime endDateTime = DateFormat('dd-MM-yyyy').parse(endDate);

  // If frequency is zero, don't skip any dates
  if (frequency == 0) {
    // Add dates until the end date is reached
    while (currentDate.isBefore(endDateTime) || currentDate.isAtSameMomentAs(endDateTime)) {
      String month = DateFormat('MMMM').format(currentDate);
      int dayOfMonth = currentDate.day;

      // Add the date to the set for the current month
      datesOnwhichTheHabbitsAreSet[month]?.add(dayOfMonth);

      // Move to the next day
      currentDate = currentDate.add(Duration(days: 1));
    }
  } else {
    // Add dates with the specified frequency
    while (currentDate.isBefore(endDateTime) || currentDate.isAtSameMomentAs(endDateTime)) {
      String month = DateFormat('MMMM').format(currentDate);
      int dayOfMonth = currentDate.day;

      // Add the date to the set for the current month
      datesOnwhichTheHabbitsAreSet[month]?.add(dayOfMonth);

      // Increment the current date by the specified frequency
      currentDate = currentDate.add(Duration(days: frequency));
    }
  }
}


void addDatesforweek({
  required int frequency,
  required String endDate,
  required Set<int> daysOfWeek,
}) {
  DateTime currentDate = DateTime.now();
  DateTime endDateTime = DateFormat('dd-MM-yyyy').parse(endDate);

  // Calculate the start date of the current week
  DateTime startOfWeek = currentDate.subtract(Duration(days: currentDate.weekday - 1));

  // Calculate the start date of the first frequency week
  DateTime startDateOfWeek = currentDate.add(Duration(days: 8 - currentDate.weekday));
  if (frequency != 0) {
    int daysUntilNextDate = (frequency - (startDateOfWeek.difference(currentDate).inDays % (frequency * 7))) % (frequency * 7);
    startDateOfWeek = startDateOfWeek.add(Duration(days: daysUntilNextDate));
  }

  // Add dates for the current week
  for (int i = 0; i < 7; i++) {
    if (daysOfWeek.contains(startDateOfWeek.weekday % 7) && startDateOfWeek.isAfter(currentDate)) {
      String month = DateFormat('MMMM').format(startDateOfWeek);
      int dayOfMonth = startDateOfWeek.day + 1;
      int maxDays = DateTime(startDateOfWeek.year, startDateOfWeek.month + 1, 0).day; // Get maximum days in the month
      if (dayOfMonth > maxDays) {
        startDateOfWeek = DateTime(startDateOfWeek.year, startDateOfWeek.month + 1, 1); // Move to the first day of the next month
        month = DateFormat('MMMM').format(startDateOfWeek);
        dayOfMonth = startDateOfWeek.day;
      }
      datesOnwhichTheHabbitsAreSet[month]?.add(dayOfMonth);
    }
    startDateOfWeek = startDateOfWeek.add(Duration(days: 1));
  }

  // Add dates for subsequent weeks until the end date
  while (startDateOfWeek.isBefore(endDateTime) || startDateOfWeek.isAtSameMomentAs(endDateTime)) {
    for (int i = 0; i < 7; i++) {
      if (daysOfWeek.contains(startDateOfWeek.weekday % 7)) {
        String month = DateFormat('MMMM').format(startDateOfWeek);
        int dayOfMonth = startDateOfWeek.day + 1;
        int maxDays = DateTime(startDateOfWeek.year, startDateOfWeek.month + 1, 0).day; // Get maximum days in the month
        if (dayOfMonth > maxDays) {
          startDateOfWeek = DateTime(startDateOfWeek.year, startDateOfWeek.month + 1, 1); // Move to the first day of the next month
          month = DateFormat('MMMM').format(startDateOfWeek);
          dayOfMonth = startDateOfWeek.day;
        }
        datesOnwhichTheHabbitsAreSet[month]?.add(dayOfMonth);
      }
      startDateOfWeek = startDateOfWeek.add(Duration(days: 1));
    }

    // Move to the next week
    startDateOfWeek = startDateOfWeek.add(Duration(days: 7));
  }
}

//Below Counts From the current week
// void addDatesforweek({
//   required int frequency,
//   required String endDate,
//   required Set<int> daysOfWeek,
// }) {
//   DateTime currentDate = DateTime.now();
//   DateTime endDateTime = DateFormat('dd-MM-yyyy').parse(endDate);
//
//   // Calculate the start date of the current week
//   DateTime startOfWeek = currentDate.subtract(Duration(days: currentDate.weekday - 1));
//
//   // Calculate the start date of the first frequency week
//   DateTime startDateOfWeek = startOfWeek;
//   if (frequency != 0) {
//     int daysUntilNextDate = (frequency - (startOfWeek.difference(currentDate).inDays % (frequency * 7))) % (frequency * 7);
//     startDateOfWeek = startOfWeek.add(Duration(days: daysUntilNextDate));
//   }
//
//   // Add dates for the current week
//   for (int i = 0; i < 7; i++) {
//     if (daysOfWeek.contains(startDateOfWeek.weekday % 7) && startDateOfWeek.isAfter(currentDate)) {
//       String month = DateFormat('MMMM').format(startDateOfWeek);
//       int dayOfMonth = startDateOfWeek.day + 1;
//       int maxDays = DateTime(startDateOfWeek.year, startDateOfWeek.month + 1, 0).day; // Get maximum days in the month
//       if (dayOfMonth > maxDays) {
//         startDateOfWeek = DateTime(startDateOfWeek.year, startDateOfWeek.month + 1, 1); // Move to the first day of the next month
//         month = DateFormat('MMMM').format(startDateOfWeek);
//         dayOfMonth = startDateOfWeek.day;
//       }
//       datesOnwhichTheHabbitsAreSet[month]?.add(dayOfMonth);
//     }
//     startDateOfWeek = startDateOfWeek.add(Duration(days: 1));
//   }
//
//   // Add dates for subsequent weeks until the end date
//   while (startDateOfWeek.isBefore(endDateTime) || startDateOfWeek.isAtSameMomentAs(endDateTime)) {
//     for (int i = 0; i < 7; i++) {
//       if (daysOfWeek.contains(startDateOfWeek.weekday % 7)) {
//         String month = DateFormat('MMMM').format(startDateOfWeek);
//         int dayOfMonth = startDateOfWeek.day + 1;
//         int maxDays = DateTime(startDateOfWeek.year, startDateOfWeek.month + 1, 0).day; // Get maximum days in the month
//         if (dayOfMonth > maxDays) {
//           startDateOfWeek = DateTime(startDateOfWeek.year, startDateOfWeek.month + 1, 1); // Move to the first day of the next month
//           month = DateFormat('MMMM').format(startDateOfWeek);
//           dayOfMonth = startDateOfWeek.day;
//         }
//         datesOnwhichTheHabbitsAreSet[month]?.add(dayOfMonth);
//       }
//       startDateOfWeek = startDateOfWeek.add(Duration(days: 1));
//     }
//
//     if (frequency != 0) {
//       // Move to the next frequency week
//       startDateOfWeek = startDateOfWeek.add(Duration(days: frequency * 7));
//     } else {
//       // Move to the next week
//       startDateOfWeek = startDateOfWeek.add(Duration(days: 7));
//     }
//   }
// }



void addDatesForMonthFrequency({
  required int frequency,
  required String endDate,
  required Set<int> daysOfMonth,
}) {
  DateTime currentDate = DateTime.now();
  DateTime endDateTime = DateFormat('dd-MM-yyyy').parse(endDate);

  // Calculate the start month
  DateTime startMonth = currentDate;

  // Add dates for the current month
  for (int dayOfMonth in daysOfMonth) {
    if (dayOfMonth >= currentDate.day) {
      String month = DateFormat('MMMM').format(startMonth);
      datesOnwhichTheHabbitsAreSet[month]?.add(dayOfMonth);
    }
  }

  // Move to the next month based on frequency
  startMonth = DateTime(startMonth.year, startMonth.month + frequency, 1);

  // Add dates for each subsequent month until the end date
  while (startMonth.isBefore(endDateTime) || startMonth.isAtSameMomentAs(endDateTime)) {
    for (int dayOfMonth in daysOfMonth) {
      String month = DateFormat('MMMM').format(startMonth);
      datesOnwhichTheHabbitsAreSet[month]?.add(dayOfMonth);
    }

    // Move to the next month based on frequency
    startMonth = DateTime(startMonth.year, startMonth.month + frequency, 1);
  }
}






