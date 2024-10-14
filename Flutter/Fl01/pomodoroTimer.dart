import 'dart:async'; // 비동기 작업 또는 타이머 기능을 사용할 때 필요한 다트 라이브러리

void main() {
  int workTime = 25 * 60; // 25분 작업 시간
  int shortBreakTime = 5 * 60; // 5분 휴식 시간
  int longBreakTime = 15 * 60; // 15분 휴식 시간
  int cycleCount = 0; // 사이클 반복 횟수 저장

  Timer.periodic(Duration(seconds: 1), (timer) {
    // 1초마다 호출되는 타이머 설정
    if (cycleCount < 4) {
      // 첫 4번의 사이클 동안 실행
      if (workTime > 0) {
        print(
            '작업 시간: ${workTime ~/ 60}:${(workTime % 60).toString().padLeft(2, '0')}'); // 현재 남은 작업 시간을 '분:초' 형식으로 출력
        workTime--; // 작업 시간 1초 감소
      } else if (shortBreakTime > 0) {
        print(
            '휴식 시간: ${shortBreakTime ~/ 60}:${(shortBreakTime % 60).toString().padLeft(2, '0')}');
        shortBreakTime--; // 휴식 시간 1초 감소
      } else {
        // 작업과 휴식이 끝나면 새 사이클로 전환
        cycleCount++; // 사이클 카운트 증가
        workTime = 25 * 60; // 작업 시간 25분 초기화
        shortBreakTime = 5 * 60; // 휴식 시간 5분 초기화
        print('새 작업 사이클 시작');
      }
    } else {
      if (longBreakTime > 0) {
        print(
            '긴 휴식 시간: ${longBreakTime ~/ 60}:${(longBreakTime % 60).toString().padLeft(2, '0')}');
        longBreakTime--;
      } else {
        print('Pomodoro 타이머 종료');
        timer.cancel();
      }
    }
  });
}
