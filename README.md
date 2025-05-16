# Sleep Chart

A Flutter chart library for visualizing sleep duration and stages with interactive indicators and animated transitions.

![](https://raw.githubusercontent.com/Azad-Zhang/my_image/refs/heads/main/sleep_chart.gif)



## Features

- Visualize sleep stages (Light, Deep, REM) with colored bars
- Interactive draggable time indicator with time range display
- Smooth transitions between different sleep stages
- Customizable grid lines and background styling
- Responsive design with automatic layout adjustment
- Multiple connection styles for stage transitions
- Flexible date/time formatting
- Built-in touch interaction support

## Getting started

Add to your `pubspec.yaml`:

```yaml
dependencies:
  sleep_chart: ^<latest_version>
```

Import the package:

```dart
import 'package:sleep_chart/sleep_chart.dart';
```

## Usage

### Basic Implementation

```dart
SleepDurationChartWidget(
  heightUnit: 1/8,
  titleHeight: 45,
  titleGap: 10,
  bgColor: Color.fromRGBO(72, 112, 243, 0.04),
  details: sleepData,
  startTime: startTime,
  endTime: endTime,
)
```

### Advanced Usage with Custom Styling

```dart
SleepDurationChartWidget(
  heightUnit: 1/8.0,
  titleHeight: 45.0,
  titleGap: 10.0,
  bgColor: Colors.white,
  details: generateSleepData(),
  startTime: DateTime.now().subtract(Duration(hours: 8)),
  endTime: DateTime.now(),
  horizontalLineStyle: LineStyle(width: 3, space: 2),
  verticalLineStyle: LineStyle(width: 2, space: 4),
  stageColors: {
    SleepStage.light: Colors.blue[300]!,
    SleepStage.deep: Colors.green[300]!,
    SleepStage.rem: Colors.orange[300]!,
  },
  sleepStageStyles: [
    SleepStageStyle(
      gradientColor: [Colors.blue, Colors.green],
      value: SleepStageStyleValue.deepAndLight
    ),
  ],
  dateFormatter: (date) => DateFormat('HH:mm').format(date),
)
```

## Parameters

| Parameter             | Description                       | Default              | Required |
| :-------------------- | :-------------------------------- | :------------------- | :------- |
| `heightUnit`          | Height ratio per sleep stage unit | -                    | Yes      |
| `titleHeight`         | Top title section height          | 45.0                 | No       |
| `titleGap`            | Spacing between title and chart   | 10.0                 | No       |
| `bgColor`             | Chart background color            | Color(0xFFF5F8FF)    | No       |
| `details`             | List of sleep stage data          | -                    | Yes      |
| `startTime`           | Start time of sleep session       | -                    | Yes      |
| `endTime`             | End time of sleep session         | -                    | Yes      |
| `horizontalLineCount` | Number of horizontal grid lines   | 8                    | No       |
| `horizontalLineStyle` | Horizontal grid line style        | width:5.0, space:3.0 | No       |
| `verticalLineStyle`   | Vertical grid line style          | width:5.0, space:3.0 | No       |
| `stageColors`         | Color mapping for sleep stages    | Built-in defaults    | No       |
| `sleepStageStyles`    | Transition styles between stages  | 3 default gradients  | No       |
| `dateFormatter`       | Custom date/time formatter        | MM-dd HH:mm          | No       |

## Data Structure

### SleepDetailChart

```dart
class SleepDetailChart {
  final SleepStage model;   // Sleep stage type
  final double width;      // Visual width in chart
  final DateTime startTime;// Stage start time
  final DateTime endTime;  // Stage end time
  final int duration;      // Duration in minutes
}
```

### Generate Sample Data

```dart
List<SleepDetailChart> generateSleepData() {
  return [
    SleepDetailChart(
      model: SleepStage.light,
      width: 60,
      startTime: DateTime.now().subtract(Duration(hours: 8)),
      endTime: DateTime.now().subtract(Duration(hours: 7, minutes: 30)),
      duration: 30,
    ),
    // Add more stages...
  ];
}
```

## Important Notes

1. **Width Calculation**: The `width` values should sum to the total chart width
2. **Stage Colors**: Must provide colors for all SleepStage enum values
3. **Time Formatting**: Use 24-hour format for best results
4. **Touch Interaction**: Indicator position updates automatically during dragging
5. **Performance**: Optimized for up to 50 sleep stage segments
6. **Transitions**: Default gradients work best with recommended color scheme

## Example App

```dart
import 'package:flutter/material.dart';
import 'package:sleep_chart/sleep_chart.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Container(
            width: 300,
            height: 278,
            child: SleepDurationChartWidget(
              heightUnit: 1/8.0,
              titleHeight: 45.0,
              titleGap: 10.0,
              bgColor: Color.fromRGBO(72, 112, 243, 0.04),
              details: generateSleepData(),
              startTime: DateTime.now().subtract(Duration(hours: 8)),
              endTime: DateTime.now(),
              stageColors: {
                SleepStage.light: Color(0xFF4870F3),
                SleepStage.deep: Color(0xFF21B2A1),
                SleepStage.rem: Color(0xFFFCD166),
              },
              sleepStageStyles: [
                SleepStageStyle(
                  gradientColor: [Color(0xFF4870F3), Color(0xFF21B2A1)],
                  value: SleepStageStyleValue.deepAndLight
                ),
                // Add more transition styles...
              ],
            ),
          ),
        ),
      ),
    );
  }
}
```

## Customization Tips

- **Color Schemes**: Use complementary colors for different sleep stages
- **Grid Lines**: Adjust spacing for different density preferences
- **Animations**: Coming soon - custom animation curves support
- **Responsive Design**: Works best in containers with fixed dimensions
- **Accessibility**: Ensure sufficient color contrast between stages
- **Localization**: Implement custom date formatting for regional preferences

## Requirements

- Flutter 3.0+
- Dart 2.17+
- Material Design components

## License

MIT License
