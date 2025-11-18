import 'dart:collection';
import 'dart:math';

void main() {
  print(createLotto());
  List<int> winningLotto = [1, 2, 3, 4, 5, 6];
  int bonusNumber = 17;
  List<int> myLotto = [1, 2, 3, 4, 5, 17];
  print(getWinner(winningLotto, bonusNumber, myLotto));
}

//로또 발금 메서드
List<int> createLotto() {
  Set<int> tempList = HashSet<int>();

  while (tempList.length < 6) {
    tempList.add(new Random().nextInt(45) + 1);
  }

  List<int> lotto = tempList.toList();
  lotto.sort();

  return lotto;
}

//당첨등수 판별 로직 구현
String getWinner(List<int> winningLotto, int bonusNumber, List<int> myLotto) {
  HashMap<String, int> result = new HashMap<String, int>();
  int count = 0;
  int bonus = 0;
  for (var lotto in myLotto) {
    if (winningLotto.contains(lotto)) {
      count++;
    }
  }

  if (myLotto.contains(bonusNumber)) {
    bonus++;
  }
  result['count'] = count;
  result['bonus'] = bonus;

  return getWinnerGrade(count, bonus);
}

String getWinnerGrade(int count, int bonus) {
  if (count == 6) {
    return "1등";
  }
  if (count == 5 && bonus == 1) {
    return "2등";
  }
  if (count == 5 && bonus == 0) {
    return "3등";
  }
  if (count == 4) {
    return "4등";
  }
  if (count == 3) {
    return "5등";
  }
  return "꽝";
}
