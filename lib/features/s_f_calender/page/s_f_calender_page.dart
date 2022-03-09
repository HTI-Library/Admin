import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hti_library_admin/core/util/cubit/cubit.dart';
import 'package:hti_library_admin/core/util/cubit/state.dart';
import 'package:hti_library_admin/features/s_f_calender/widget/meeting.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class SFCalenderPage extends StatefulWidget {
  const SFCalenderPage({Key? key}) : super(key: key);

  @override
  State<SFCalenderPage> createState() => _SFCalenderPageState();
}

class _SFCalenderPageState extends State<SFCalenderPage> {
  CalendarController calendarController = CalendarController();

  Widget appointmentBuilder(BuildContext context,
      CalendarAppointmentDetails calendarAppointmentDetails) {
    final Meeting appointment = calendarAppointmentDetails.appointments.first;
    return Container(
      width: calendarAppointmentDetails.bounds.width,
      height: calendarAppointmentDetails.bounds.height,
      // color: appointment.background,
      decoration: BoxDecoration(
        color: appointment.background,
        border: Border.all(
          color: Colors.grey,
          width: 0.5,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(2.0, 0, 0, 5.0),
            child: Text(
              appointment.eventName,
              // textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(2.0, 0, 0, 0),
            child: Text(
              "Phòng",
              style: TextStyle(fontSize: 10, fontStyle: FontStyle.italic),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, MainState>(
      builder: (context, state) {
        return Scaffold(
          body: SfCalendar(
            view: CalendarView.month,
            showDatePickerButton: true,
            showCurrentTimeIndicator: false,
            showNavigationArrow: true,

            viewNavigationMode: ViewNavigationMode.snap,
            // dataSource: BuildSFCalendarItem(dateTime: calendarController.displayDate,),
            // allowedViews: const <CalendarView>
            // [
            //   CalendarView.day,
            //   CalendarView.week,
            //   CalendarView.workWeek,
            //   CalendarView.month,
            //   CalendarView.schedule
            // ],
            //
            appointmentBuilder: appointmentBuilder,
            initialDisplayDate: DateTime(DateTime.now().year,
                DateTime.now().month, DateTime.now().day, 00, 45, 0),
            monthViewSettings: const MonthViewSettings(showAgenda: true),
            // monthViewSettings: const MonthViewSettings(
            //     appointmentDisplayMode: MonthAppointmentDisplayMode.indicator),
          ),
        );
      },
    );
  }
}
