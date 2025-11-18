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
    tempList.add(Random().nextInt(45) + 1);
  }

  List<int> lotto = tempList.toList();
  lotto.sort();

  return lotto;
}

//당첨등수 판별 로직 구현
String getWinner(List<int> winningLotto, int bonusNumber, List<int> myLotto) {
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

List<List<int>> buyLotto(int money) {
  List<List<int>> myLottoList = [];

  int round = (money / 1000).toInt();

  for (var i = 0; i < round; i++) {
    myLottoList.add(createLotto());
  }

  return myLottoList;
}

int getPrizeAmount(String rank) {
  switch (rank) {
    case "1등":
      return 2000000000; // 20억
    case "2등":
      return 30000000; // 3000만
    case "3등":
      return 1500000; // 150만
    case "4등":
      return 50000; // 5만
    case "5등":
      return 5000; // 5천
    default:
      return 0; // 꽝
  }
}
