enum WinningInfo {
  RANK1(6, 0, 2000000000),
  RANK2(5, 1, 30000000),
  RANK3(5, 0, 1500000),
  RANK4(4, 0, 50000),
  RANK5(3, 0, 5000),
  FALSE(0, 0, 0);

  final int winningNumber;
  final int bonusNumber;
  final int winningMoney;

  const WinningInfo(this.winningNumber, this.bonusNumber, this.winningMoney);

  static WinningInfo getRank(int count, int bonus) {
    if (count == 6) return WinningInfo.RANK1;
    if (count == 5 && bonus == 1) return WinningInfo.RANK2;
    if (count == 5) return WinningInfo.RANK3;
    if (count == 4) return WinningInfo.RANK4;
    if (count == 3) return WinningInfo.RANK5;
    return WinningInfo.FALSE;
  }
}
