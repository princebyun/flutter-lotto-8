import 'dart:collection';
import 'dart:math';

void main() {
  print(createLotto());
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
