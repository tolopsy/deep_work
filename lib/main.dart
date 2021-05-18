import 'package:deep_work/timer_model.dart';
import 'package:flutter/material.dart';
import 'package:deep_work/widgets.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:deep_work/timer.dart';

void main() {
  runApp(MyApp());
}

const double defaultPadding = 4.0;
const Color primaryColor = Colors.deepPurple;

final CountdownTimer timer = CountdownTimer();

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    timer.startWork();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Deep Work',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: TimerScreen(),
    );
  }
}

void emptyCallBack() {}

class TimerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Focus'),
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              final double availableWidth = constraints.maxWidth;
              return Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: DeepWorkButton(
                          color: primaryColor,
                          text: 'Work',
                          onPressed: () => timer.startWork(),
                          size: 64.0,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: defaultPadding),
                      ),
                      Expanded(
                        child: DeepWorkButton(
                          color: primaryColor,
                          text: 'Short Break',
                          onPressed: () => timer.startBreak(true),
                          size: 64.0,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: defaultPadding),
                      ),
                      Expanded(
                        child: DeepWorkButton(
                          color: primaryColor,
                          text: 'Long Break',
                          onPressed: () => timer.startBreak(false),
                          size: 64.0,
                        ),
                      ),
                    ],
                  ),
                  StreamBuilder(
                    initialData: "00:00",
                    stream: timer.stream(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      TimerModel stopWatch = (snapshot.data == "00:00")
                          ? TimerModel("00:00", 1)
                          : snapshot.data;
                      return Expanded(
                        child: CircularPercentIndicator(
                          radius: availableWidth / 2,
                          lineWidth: 10,
                          percent: stopWatch.percent,
                          center: Text(
                            stopWatch.time,
                            style: Theme.of(context).textTheme.headline4,
                          ),
                          progressColor: Colors.deepPurpleAccent,
                        ),
                      );
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: DeepWorkButton(
                          color: primaryColor,
                          text: 'Pause',
                          onPressed: () => timer.pauseTime(),
                          size: 64.0,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: defaultPadding),
                      ),
                      Expanded(
                        child: DeepWorkButton(
                          color: primaryColor,
                          text: 'Continue',
                          onPressed: () => timer.continueTime(),
                          size: 64.0,
                        ),
                      ),
                    ],
                  )
                ],
              );
            },
          )),
    );
  }
}
