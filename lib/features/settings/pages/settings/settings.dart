import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hti_library_admin/core/util/constants.dart';
import 'package:hti_library_admin/core/util/cubit/cubit.dart';
import 'package:hti_library_admin/core/util/cubit/state.dart';
import 'package:hti_library_admin/features/libraries/presentation/pages/libraries_page.dart';
import 'package:hti_library_admin/features/s_f_calender/widget/meeting.dart';
import 'package:hti_library_admin/features/types/presentation/pages/types_page.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../widget/btn_my_account.dart';
import '../info/info.dart';
import '../setting/presntation/setting.dart';

class Settings extends StatelessWidget {
  Settings({Key? key}) : super(key: key);

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
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
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
        return Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  child: Image.asset('assets/images/hti_logo.png'),
                  radius: 55,
                ),
                space20Vertical,
                Text(
                  'Htian Here',
                  style: Theme.of(context).textTheme.headline6!,
                ),
                space10Vertical,
                MyBtnAccount(
                  voidCallback: () {
                    navigateTo(context, const LibrariesPage());
                  },
                  text: appTranslation(context).libraries,
                  // text: appTranslation(context).setting,
                  imagePath: '',
                ),
                space10Vertical,
                MyBtnAccount(
                  voidCallback: () {
                    navigateTo(context, SettingPages());
                  },
                  text: appTranslation(context).setting,
                  imagePath: 'settings',
                ),
                space10Vertical,
                MyBtnAccount(
                  voidCallback: () {
                    navigateTo(context, InfoPage());
                  },
                  text: appTranslation(context).info,
                  imagePath: 'info',
                ),
                space10Vertical,
                MyBtnAccount(
                  voidCallback: () {
                    // navigateTo(context, SFCalenderPage());
                    showModalBottomSheet<void>(
                        context: context,
                        isScrollControlled: true,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        backgroundColor:
                            Theme.of(context).scaffoldBackgroundColor,
                        builder: (context) {
                          return SizedBox(
                            height: MediaQuery.of(context).size.height / 2,
                            child: SfCalendar(
                              view: CalendarView.month,
                              showDatePickerButton: true,
                              showCurrentTimeIndicator: false,
                              showNavigationArrow: true,

                              viewNavigationMode: ViewNavigationMode.snap,
                              appointmentBuilder: appointmentBuilder,
                              initialDisplayDate: DateTime(
                                  DateTime.now().year,
                                  DateTime.now().month,
                                  DateTime.now().day,
                                  00,
                                  45,
                                  0),
                              monthViewSettings:
                                  const MonthViewSettings(showAgenda: true),
                              // monthViewSettings: const MonthViewSettings(
                              //     appointmentDisplayMode: MonthAppointmentDisplayMode.indicator),
                            ),
                          );
                        });
                  },
                  text: appTranslation(context).calender,
                  imagePath: 'calendar',
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
