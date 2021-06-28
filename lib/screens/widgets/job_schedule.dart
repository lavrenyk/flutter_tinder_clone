import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class JobSchedule extends StatelessWidget {
  const JobSchedule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 100,
      child: SfCalendar(
        view: CalendarView.month,
        firstDayOfWeek: 1,
        showNavigationArrow: true,
        monthViewSettings: MonthViewSettings(
            // showTrailingAndLeadingDates: false,
            // numberOfWeeksInView: 5,
            ),
        // monthCellBuilder: monthCellBuilder,
        dataSource: WorkdaysDataSource(getWorkdays()),
      ),
    );
  }
}

List<Appointment> getWorkdays() {
  List<Appointment> workdays = <Appointment>[];
  final DateTime today = DateTime.now();
  final DateTime startTime =
      DateTime(today.year, today.month, today.day + 1, 8, 0, 0);
  final DateTime endTime = startTime.add(const Duration(hours: 12));

  workdays.add(
    Appointment(
      startTime: startTime,
      endTime: endTime,
      subject: 'open',
      color: Colors.green,
      recurrenceRule: "FREQ=DAILY;COUNT=22",
      // isAllDay: true,
    ),
  );

  return workdays;
}

class WorkdaysDataSource extends CalendarDataSource {
  WorkdaysDataSource(List<Appointment> source) {
    appointments = source;
  }
}

Widget monthCellBuilder(BuildContext context, MonthCellDetails details) {
  var mid = details.visibleDates.length ~/ 2.toInt();
  var midDate = details.visibleDates[0].add(Duration(days: mid));

  if (details.date.month != midDate.month) {
    return Container(
      color: Colors.pinkAccent,
      child: Text(
        details.date.day.toString(),
      ),
    );
  } else {
    return Container(
      color: Colors.green,
      child: Text(
        details.date.day.toString(),
      ),
    );
  }
}

// Widget monthCellBuilder(BuildContext context, MonthCellDetails details) {
//   if (details.appointments.isNotEmpty) {
//     Appointment appointment = details.appointments[0] as Appointment;
//     return Container(
//       decoration: BoxDecoration(
//         border: Border.all(
//           color: Colors.black12,
//           width: 0.5,
//         ),
//         color: appointment.color,
//       ),
//       child: Center(child: Text(details.date.day.toString())),
//     );
//   }
//   return Container(
//     decoration: BoxDecoration(
//       border: Border.all(
//         color: Colors.black12,
//         width: 0.5,
//       ),
//       color: Colors.white,
//     ),
//     child: Center(child: Text(details.date.day.toString())),
//   );
// }

// _AppointmentDataSource _getCalendarDataSource() {
//   List<Appointment> appointments = <Appointment>[];
//   appointments.add(Appointment(
//     startTime: DateTime.now(),
//     endTime: DateTime.now().add(Duration(hours: 1)),
//     subject: 'Meeting',
//     color: Colors.blue,
//   ));
//   appointments.add(Appointment(
//     startTime: DateTime.now().add(Duration(days: -5)),
//     endTime: DateTime.now().add(Duration(days: -5)),
//     subject: 'Planning',
//     color: Colors.deepOrangeAccent,
//   ));
//   appointments.add(Appointment(
//     startTime: DateTime.now().add(Duration(days: -9)),
//     endTime: DateTime.now().add(Duration(days: -9)),
//     subject: 'Consulting',
//     color: Colors.pink,
//   ));
//   appointments.add(Appointment(
//     startTime: DateTime.now().add(Duration(days: -15)),
//     endTime: DateTime.now().add(Duration(days: -15)),
//     subject: 'Retrospective',
//     color: Colors.purpleAccent,
//   ));
//   appointments.add(Appointment(
//     startTime: DateTime.now().add(Duration(days: 15)),
//     endTime: DateTime.now().add(Duration(days: 15)),
//     subject: 'Customer Meeting',
//     color: Colors.amber,
//   ));
//   appointments.add(Appointment(
//     startTime: DateTime.now().add(Duration(days: 5)),
//     endTime: DateTime.now().add(Duration(days: 5)),
//     subject: 'Sprint Plan',
//     color: Colors.lightGreenAccent,
//   ));
//   appointments.add(Appointment(
//     startTime: DateTime.now().add(Duration(days: 9)),
//     endTime: DateTime.now().add(Duration(days: 9)),
//     subject: 'Weekly Report',
//     color: Colors.lime,
//   ));
//   appointments.add(Appointment(
//     startTime: DateTime.now().add(Duration(days: 3)),
//     endTime: DateTime.now().add(Duration(days: 3)),
//     subject: 'Meeting',
//     color: Colors.cyan,
//   ));

//   return _AppointmentDataSource(appointments);
// }

// class _AppointmentDataSource extends CalendarDataSource {
//   _AppointmentDataSource(List<Appointment> source) {
//     appointments = source;
//   }
// }
