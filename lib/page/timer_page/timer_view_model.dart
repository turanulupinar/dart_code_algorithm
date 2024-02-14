import 'package:dart_code_algorithms/page/timer_page/timer_model.dart';

import '../data/shared_data.dart';

class TimerViewModel {
  SharedPreferancesTimedata? timedata = SharedPreferancesTimedata();
  Future<TimerModel> getTimeShared() async {
    final second = await timedata?.getData("second") ?? 0;
    final minute = await timedata?.getData("minute") ?? 0;
    final hour = await timedata?.getData("hour") ?? 0;
    return TimerModel(
        millisecond: 0, second: second, minute: minute, hour: hour);
  }
}
