import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:tinder_clone/data/data.dart';
import 'package:tinder_clone/screens/widgets/job_schedule.dart';
import 'package:tinder_clone/screens/widgets/work_info.dart';

class Body extends StatelessWidget {
  final List<bool> _selected = List.generate(3, (index) => false);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(
              top: 10.0,
              bottom: 5.0,
            ),
            child: Center(
              child: Text(
                'Рабочий склада',
                style: TextStyle(
                    fontFamily: 'ProximaNova',
                    fontWeight: FontWeight.bold,
                    fontSize: 28),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "подработка".toUpperCase(),
                style: const TextStyle(fontSize: 12.0),
              ),
              const SizedBox(width: 10.0),
              const Text(
                "•",
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(width: 10.0),
              Text(
                "на территории".toUpperCase(),
                style: TextStyle(fontSize: 12.0),
              ),
            ],
          ),
          const SizedBox(height: 3.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const Text(
                "1 000",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                  color: Colors.green,
                ),
              ),
              const Text(
                " ₽",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14.0,
                  color: Colors.black38,
                ),
              ),
              const Text(" / смена"),
            ],
          ),
          const SizedBox(height: 15.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      // width: 40.0,
                      height: 150.0,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black12),
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.grey.withOpacity(0.1),
                        image: const DecorationImage(
                          image: AssetImage('assets/images/demo_map.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 15,
                      child: Container(
                        padding: const EdgeInsets.only(
                          right: 10.0,
                          top: 3.0,
                          bottom: 3.0,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.5),
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(5),
                            bottomRight: Radius.circular(5),
                          ),
                        ),
                        child: Row(
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              child: Icon(
                                Icons.location_pin,
                                color: Colors.white,
                                size: 15.0,
                              ),
                            ),
                            const Text(
                              "Большая Черкизовская 5, стр.1",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15.0),
                JobInfoSelector(selected: _selected),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CompanyDesc extends StatelessWidget {
  const CompanyDesc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Text(
            comapnies_json[0]['title'],
            style: const TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Text(comapnies_json[0]['desc']),
      ],
    );
  }
}

class CompanyReviews extends StatelessWidget {
  const CompanyReviews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 15.0),
          child: Text(
            "Все обзоры (2)",
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Card(
            child: ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Лавренюк Дмитрий'),
                  RatingBarIndicator(
                    rating: 5,
                    itemBuilder: (context, index) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    itemCount: 5,
                    itemSize: 15.0,
                    direction: Axis.horizontal,
                  ),
                ],
              ),
              subtitle: const Padding(
                padding: EdgeInsets.symmetric(vertical: 5.0),
                child: Text(
                    'Хорошая компания, с отличным менеждментом. Дружный и отзывчивый коллектив! Работать у них только в радость.'),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Card(
            child: ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Серней Иванов'),
                  RatingBarIndicator(
                    rating: 4,
                    itemBuilder: (context, index) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    itemCount: 5,
                    itemSize: 15.0,
                    direction: Axis.horizontal,
                  ),
                ],
              ),
              subtitle: const Padding(
                padding: EdgeInsets.symmetric(vertical: 5.0),
                child: Text(
                    'Вполне комфортные условия работы, люди адекватные. Работа конечно не сахар, но деньги хорошие.'),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class JobDesc extends StatelessWidget {
  const JobDesc({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Meeting> _getDataSource() {
      final List<Meeting> meetings = <Meeting>[];
      final DateTime today = DateTime.now();
      final DateTime startTime =
          DateTime(today.year, today.month, today.day, 9, 0, 0);
      final DateTime endTime = startTime.add(const Duration(hours: 2));
      meetings.add(Meeting(
          'Conference', startTime, endTime, const Color(0xFF0F8644), false));
      return meetings;
    }

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const WorkInfo(
                title: 'Смена',
                amount: 12,
                subTitle: 'часов',
              ),
              // ignore: sized_box_for_whitespace
              Container(
                height: 50,
                child: const VerticalDivider(
                  thickness: 1,
                  width: 20,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const WorkInfo(
                    title: 'Доступно',
                    amount: 22,
                    subTitle: 'смены',
                  ),
                  TextButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                          contentPadding: EdgeInsets.all(15),
                          title: Text("Доступные смены"),
                          content: Container(
                            width: 350,
                            height: 400,
                            // child: TableCalendar(
                            //   firstDay: DateTime.utc(2010, 10, 16),
                            //   lastDay: DateTime.utc(2030, 3, 14),
                            //   focusedDay: DateTime.now(),
                            // ),
                            child: JobSchedule(),
                          ),
                        ),
                      );
                    },
                    child: Icon(Icons.calendar_today_outlined),
                  ),
                ],
              )
            ],
          ),
          const Divider(thickness: 0.8),
          SizedBox(height: 5.0),
          Text(
            'Обязанности:',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 5.0),
          Text('- Погрузочно-разгрузочные работы;'),
          Text('- Прием товара;'),
          Text('- Сортировка товара по группам;'),
          Text('- Участие в инвентаризациях;'),
          SizedBox(height: 10.0),
          const Text(
            'Требования:',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 5.0),
          Text('- Опыт работы на складе от 6 месяцев;'),
          Text('- Знание технологий складского хозяйства;'),
          Text('- Уверенное пользование ПК;'),
          Text(
              '- Умение организовать, контролировать и обеспечивать полноту и своевременность исполнения работ;'),
          Text(
              '- Ответственность, активность, обучаемость, коммуникабельность;'),
        ],
      ),
    );
  }
}

class Meeting {
  /// Creates a meeting class with required details.
  Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay);

  /// Event name which is equivalent to subject property of [Appointment].
  String eventName;

  /// From which is equivalent to start time property of [Appointment].
  DateTime from;

  /// To which is equivalent to end time property of [Appointment].
  DateTime to;

  /// Background which is equivalent to color property of [Appointment].
  Color background;

  /// IsAllDay which is equivalent to isAllDay property of [Appointment].
  bool isAllDay;
}

class JobInfoSelector extends StatefulWidget {
  const JobInfoSelector({
    Key? key,
    required List<bool> selected,
  }) : super(key: key);

  @override
  State<JobInfoSelector> createState() => _JobInfoSelectorState();
}

class _JobInfoSelectorState extends State<JobInfoSelector> {
  int _activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.topCenter,
          child: Container(
            height: 35,
            padding: const EdgeInsets.all(1.5),
            // width: MediaQuery.of(context).size.width * 0.9,
            decoration: const BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        _activeIndex = 0;
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: _activeIndex == 0
                            ? Colors.white
                            : Colors.transparent,
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(8.0),
                          topLeft: Radius.circular(8.0),
                        ),
                      ),
                      child: Text(
                        "Описание",
                        style: TextStyle(
                          color:
                              _activeIndex == 0 ? Colors.black54 : Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Container(
                    color:
                        _activeIndex == 2 ? Colors.white : Colors.transparent,
                    width: 1,
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        _activeIndex = 1;
                      });
                    },
                    child: Container(
                      color:
                          _activeIndex == 1 ? Colors.white : Colors.transparent,
                      alignment: Alignment.center,
                      child: Text(
                        "О компании",
                        style: TextStyle(
                            color: _activeIndex == 1
                                ? Colors.black54
                                : Colors.white,
                            fontSize: 16),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Container(
                    color:
                        _activeIndex == 0 ? Colors.white : Colors.transparent,
                    width: 1,
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        _activeIndex = 2;
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: _activeIndex == 2
                            ? Colors.white
                            : Colors.transparent,
                        borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(8.0),
                          topRight: Radius.circular(8.0),
                        ),
                      ),
                      // color: _activeIndex == 2 ? Colors.white : Colors.transparent,
                      child: Text(
                        "Отзывы",
                        style: TextStyle(
                          color:
                              _activeIndex == 2 ? Colors.black54 : Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        IndexedStack(
          index: _activeIndex,
          children: [
            const JobDesc(),
            const CompanyDesc(),
            const CompanyReviews(),
          ],
        ),
      ],
    );
  }
}

/// An object to set the appointment collection data source to calendar, which
/// used to map the custom appointment data to the calendar appointment, and
/// allows to add, remove or reset the appointment collection.
class MeetingDataSource extends CalendarDataSource {
  /// Creates a meeting data source, which used to set the appointment
  /// collection to the calendar
  MeetingDataSource(List<Meeting> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return _getMeetingData(index).from;
  }

  @override
  DateTime getEndTime(int index) {
    return _getMeetingData(index).to;
  }

  @override
  String getSubject(int index) {
    return _getMeetingData(index).eventName;
  }

  @override
  Color getColor(int index) {
    return _getMeetingData(index).background;
  }

  @override
  bool isAllDay(int index) {
    return _getMeetingData(index).isAllDay;
  }

  Meeting _getMeetingData(int index) {
    final dynamic meeting = appointments![index];
    late final Meeting meetingData;
    if (meeting is Meeting) {
      meetingData = meeting;
    }

    return meetingData;
  }
}
