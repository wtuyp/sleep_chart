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
    SleepStage.awake: Color(0xFFFF6B6B),  // 清醒 -红色
    SleepStage.rem: Color(0xFFFFC870),    // 快速眼动 - 黄色
    SleepStage.light: Color(0xFFB570FF),  // 浅睡眠 - 紫色
    SleepStage.deep: Color(0xFF8480FF),   // 深睡眠 - 蓝色

    // SleepStage.awake: Color(0xFFFF9A76),  // 清醒
    // SleepStage.rem: Color(0xFF6EC5E9),    // 快速眼动
    // SleepStage.light: Color(0xFFA3D8C6),  // 浅睡眠
    // SleepStage.deep: Color(0xFF5E4FA2),   // 深睡眠

    // SleepStage.awake: Color(0xFFE8B4B8),  // 清醒
    // SleepStage.rem: Color(0xFF8FCACA),    // 快速眼动
    // SleepStage.light: Color(0xFFD4C99E),  // 浅睡眠
    // SleepStage.deep: Color(0xFF6D6875),   // 深睡眠
  };
  DateTime startTime = DateTime.now();
  late DateTime endTime = startTime.add(Duration(minutes: 340));

  List<SleepDetailChart> details = [];

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        details = [
          SleepDetailChart(
            stage: SleepStage.light,
            startTime: startTime,
            duration: 5,
          ),
          SleepDetailChart(
            stage: SleepStage.deep,
            startTime: startTime.add(Duration(minutes: 5)),
            duration: 5,
          ),
          SleepDetailChart(
            stage: SleepStage.rem,
            startTime: startTime.add(Duration(minutes: 10)),
            duration: 40,
          ),
          SleepDetailChart(
            stage: SleepStage.light,
            startTime: startTime.add(Duration(minutes: 50)),
            duration: 68,
          ),
          SleepDetailChart(
            stage: SleepStage.deep,
            startTime: startTime.add(Duration(minutes: 118)),
            duration: 42,
          ),
          SleepDetailChart(
            stage: SleepStage.rem,
            startTime: startTime.add(Duration(minutes: 160)),
            duration: 35,
          ),
          SleepDetailChart(
            stage: SleepStage.light,
            startTime: startTime.add(Duration(minutes: 195)),
            duration: 32,
          ),
          SleepDetailChart(
            stage: SleepStage.deep,
            startTime: startTime.add(Duration(minutes: 227)),
            duration: 33,
          ),
          SleepDetailChart(
            stage: SleepStage.light,
            startTime: startTime.add(Duration(minutes: 260)),
            duration: 32,
          ),
          SleepDetailChart(
            stage: SleepStage.rem,
            startTime: startTime.add(Duration(minutes: 292)),
            duration: 43,
          ),
          SleepDetailChart(
            stage: SleepStage.awake,
            startTime: startTime.add(Duration(minutes: 335)),
            duration: 5,
          ),
        ];

        // SleepDetail 转 SleepDetailChart
        /*
        details = createSleepDurationData(
          totalDuration: 340,
          details: [
            SleepDetail(
              stage: SleepStage.light,
              time: startTime,
            ),
            SleepDetail(
              stage: SleepStage.deep,
              time: startTime.add(Duration(minutes: 5)),
            ),
            SleepDetail(
              stage: SleepStage.rem,
              time: startTime.add(Duration(minutes: 10)),
            ),
            SleepDetail(
              stage: SleepStage.light,
              time: startTime.add(Duration(minutes: 50)),
            ),
            SleepDetail(
              stage: SleepStage.deep,
              time: startTime.add(Duration(minutes: 118)),
            ),
            SleepDetail(
              stage: SleepStage.rem,
              time: startTime.add(Duration(minutes: 160)),
            ),
            SleepDetail(
              stage: SleepStage.light,
              time: startTime.add(Duration(minutes: 195)),
            ),
            SleepDetail(
              stage: SleepStage.deep,
              time: startTime.add(Duration(minutes: 227)),
            ),
            SleepDetail(
              stage: SleepStage.light,
              time: startTime.add(Duration(minutes: 260)),
            ),
            SleepDetail(
              stage: SleepStage.rem,
              time: startTime.add(Duration(minutes: 292)),
            ),
            SleepDetail(
              stage: SleepStage.awake,
              time: startTime.add(Duration(minutes: 335)),
            ),
          ],
        );
        // */
      });
    });
  }

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
            heightUnit: 1 / 7.0,
            titleHeight: 45.0,
            titleGap: 10.0,
            xAxisTitleOffset: 8.0,
            xAxisTitleHeight: 15.0,
            horizontalLineCount: 7,
            bgColor: Color(0xFFF5F6F7),
            stageColors: stageColors,
            startTime: startTime,
            endTime: endTime,
            dateFormatter: (DateTime date) {
              if (date == startTime) {
                return '${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}入睡\n${date.month.toString().padLeft(2, '0')}/${date.day.toString().padLeft(2, '0')}';
              } else if (date == endTime) {
                return '${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}醒来\n${date.month.toString().padLeft(2, '0')}/${date.day.toString().padLeft(2, '0')}';
              }
              return '';
            },
            details: details,
          ),
        ),
      ),
    );
  }
}
