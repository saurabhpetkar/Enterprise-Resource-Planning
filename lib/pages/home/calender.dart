import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart' show CalendarCarousel;


class Calender extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CalenderState();
  }
}

class CalenderState extends State<Calender>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 3, vertical: 10),
      color: Colors.white,
      margin: EdgeInsets.symmetric(horizontal: 7.0),
      child: CalendarCarousel(
        prevDaysTextStyle: TextStyle(color: Colors.grey),
        onDayPressed: (DateTime day, _){
          print(day.day);
        },
        height: 420.0,
        daysHaveCircularBorder: true,
        onCalendarChanged: (DateTime day){
          print('month changed');
        },

        customDayBuilder: (   /// you can provide your own build function to make custom day containers
            bool isSelectable,
            int index,
            bool isSelectedDay,
            bool isToday,
            bool isPrevMonthDay,
            TextStyle textStyle,
            bool isNextMonthDay,
            bool isThisMonthDay,
            DateTime day,
            ) {
          /// If you return null, [CalendarCarousel] will build container for current [day] with default function.
          /// This way you can build custom containers for specific days only, leaving rest as default.

          // Example: every 15th of month, we have a flight, we can place an icon in the container like that:
          if (day.day == 15) {
            print('day checked ' + day.toString()); //gets checked when the month is on.
            return Center(
              child: Icon(Icons.local_airport),
            );
          } else {
            return null;
          }
        },

        /// null for not rendering any border, true for circular border, false for rectangular border
//          weekendStyle: TextStyle(
//            color: Colors.red,
//          ),
//          weekDays: null, /// for pass null when you do not want to render weekDays
//          headerText: Container( /// Example for rendering custom header
//            child: Text('Custom Header'),
//          ),
      ),
    );
  }
}