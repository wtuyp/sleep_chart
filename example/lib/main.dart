import 'package:flutter/material.dart';

import 'package:sleep_chart/sleep_chart.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // 根据睡眠阶段定义固定颜色
  final Map<SleepStage, Color> stageColors = {
    SleepStage.awake: Color(0xFFFFC870),
    SleepStage.rem: Color(0xFFFFC870),
    SleepStage.light: Color(0xFFB570FF),
    SleepStage.deep: Color(0xFF8480FF),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 12),
          height: 230,
          child: SleepDurationChartWidget(
            heightUnit: 1 / 8.0,
            titleHeight: 45.0,
            titleGap: 10.0,
            xAxisTitleOffset: 8.0,
            xAxisTitleHeight: 15.0,
            horizontalLineCount: 8,
            bgColor: Color(0xFFF5F6F7),
            stageColors: stageColors,
            startTime: DateTime.now(),
            endTime: DateTime.now().add(Duration(minutes: 340)),
            details: [
              SleepDetailChart(
                stage: SleepStage.light,
                startTime: DateTime.now(),
                duration: 5,
              ),
              SleepDetailChart(
                stage: SleepStage.deep,
                startTime: DateTime.now().add(Duration(minutes: 5)),
                duration: 5,
              ),
              SleepDetailChart(
                stage: SleepStage.rem,
                // width: perWidth * 40,
                startTime: DateTime.now().add(Duration(minutes: 10)),
                duration: 40,
              ),
              SleepDetailChart(
                stage: SleepStage.light,
                startTime: DateTime.now().add(Duration(minutes: 50)),
                duration: 68,
              ),
              SleepDetailChart(
                stage: SleepStage.deep,
                startTime: DateTime.now().add(Duration(minutes: 118)),
                duration: 42,
              ),
              SleepDetailChart(
                stage: SleepStage.rem,
                startTime: DateTime.now().add(Duration(minutes: 160)),
                duration: 35,
              ),
              SleepDetailChart(
                stage: SleepStage.light,
                startTime: DateTime.now().add(Duration(minutes: 195)),
                duration: 32,
              ),
              SleepDetailChart(
                stage: SleepStage.deep,
                startTime: DateTime.now().add(Duration(minutes: 227)),
                duration: 33,
              ),
              SleepDetailChart(
                stage: SleepStage.light,
                startTime: DateTime.now().add(Duration(minutes: 260)),
                duration: 33,
              ),
              SleepDetailChart(
                stage: SleepStage.rem,
                startTime: DateTime.now().add(Duration(minutes: 292)),
                duration: 43,
              ),
              SleepDetailChart(
                stage: SleepStage.awake,
                startTime: DateTime.now().add(Duration(minutes: 290)),
                duration: 4,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
