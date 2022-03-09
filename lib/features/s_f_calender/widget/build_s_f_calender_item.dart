import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hti_library_admin/core/util/cubit/cubit.dart';
import 'package:hti_library_admin/core/util/cubit/state.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class BuildSFCalendarItem extends StatelessWidget {
  const BuildSFCalendarItem({Key? key, required this.dateTime})
      : super(key: key);
  final DateTime dateTime;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, MainState>(
      builder: (context, state) => GestureDetector(
        onTap: () {
          MainCubit.get(context).setSelectedDay(dateTime.day);
        },
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: MainCubit.get(context).currentDay == dateTime.day
                ? Colors.deepPurple
                : null,
          ),
          child: Column(
            children: [
              Text(
                '${dateTime.day}',
                style: TextStyle(
                  color: MainCubit.get(context).currentDay == dateTime.day
                      ? Colors.white
                      : Colors.black,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                dateTime.day.toString(),
                style: TextStyle(
                  color: MainCubit.get(context).currentDay == dateTime.day
                      ? Colors.white
                      : Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
