import 'dart:collection';
import 'dart:math';

import 'WinningInfo.dart';

void main() {
  print(createLotto());
  List<int> winningLotto = [1, 2, 3, 4, 5, 6];
  int bonusNumber = 17;
  List<int> myLotto = [1, 2, 3, 4, 5, 17];
  print(getWinner(winningLotto, bonusNumber, myLotto));
}

List<int> createLotto() {
  Set<int> tempList = HashSet<int>();

  while (tempList.length < 6) {
    tempList.add(Random().nextInt(45) + 1);
  }

  List<int> lotto = tempList.toList();
  lotto.sort();

  return lotto;
}

WinningInfo getWinner(
  List<int> winningLotto,
  int bonusNumber,
  List<int> myLotto,
) {
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

  return WinningInfo.getRank(count, bonus);
}

List<List<int>> buyLotto(int money) {
  List<List<int>> myLottoList = [];

  int round = (money / 1000).toInt();

  for (var i = 0; i < round; i++) {
    myLottoList.add(createLotto());
  }

  return myLottoList;
}
