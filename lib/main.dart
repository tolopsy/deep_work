import 'package:flutter/material.dart';
import 'package:deep_work/widgets.dart';
import 'package:percent_indicator/percent_indicator.dart';

void main() {
  runApp(MyApp());
}

const double defaultPadding = 4.0;
const Color primaryColor = Colors.deepPurple;

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
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
                          onPressed: emptyCallBack,
                          size: 64.0,
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.symmetric(horizontal: defaultPadding),
                      ),
                      Expanded(
                        child: DeepWorkButton(
                          color: primaryColor,
                          text: 'Short Break',
                          onPressed: emptyCallBack,
                          size: 64.0,
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.symmetric(horizontal: defaultPadding),
                      ),
                      Expanded(
                        child: DeepWorkButton(
                          color: primaryColor,
                          text: 'Long Break',
                          onPressed: emptyCallBack,
                          size: 64.0,
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: CircularPercentIndicator(
                      radius: availableWidth / 2,
                      lineWidth: 10,
                      percent: 1,
                      center: Text(
                        "30.00",
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      progressColor: Colors.deepPurpleAccent,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: DeepWorkButton(
                          color: primaryColor,
                          text: 'Stop',
                          onPressed: emptyCallBack,
                          size: 64.0,
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.symmetric(horizontal: defaultPadding),
                      ),
                      Expanded(
                        child: DeepWorkButton(
                          color: primaryColor,
                          text: 'Restart',
                          onPressed: emptyCallBack,
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
