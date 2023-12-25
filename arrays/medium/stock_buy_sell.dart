void main() {
  List<int> stockPrices = [
    87,
    510,
    52,
    460,
    496,
    423,
    395,
    618,
    333,
    659,
    166,
    499,
    653,
    71,
    117
  ];

  print(stockBuyAndSell(stockPrices));
}

int stockBuyAndSell(List<int> nums) {
  return stockBuyAndSell_3(nums);
}

// Time: O(n^2)
int stockBuyAndSell_1(List<int> nums) {
  int maxProfit = 0;

  for (int index1 = 0; index1 < nums.length; index1++) {
    int buyPrice = nums[index1];
    for (int index2 = index1 + 1; index2 < nums.length; index2++) {
      int sellPrice = nums[index2];

      if (maxProfit < sellPrice - buyPrice) {
        maxProfit = sellPrice - buyPrice;
      }
    }
  }

  return maxProfit;
}

// Time: O(n)
int stockBuyAndSell_2(List<int> nums) {
  int maxProfit = 0;
  int buyPrice = nums[0];

  for (int index = 1; index < nums.length; index++) {
    if (nums[index] < buyPrice) {
      buyPrice = nums[index];
    }

    if (maxProfit < nums[index] - buyPrice) {
      maxProfit = nums[index] - buyPrice;
    }
  }
  return maxProfit;
}

// Multiple transactions
// Time: O(n)
int stockBuyAndSell_3(List<int> nums) {
  int maxProfit = 0;

  for (int index = 1; index < nums.length; index++) {
    if (nums[index - 1] < nums[index]) {
      maxProfit += nums[index] - nums[index - 1];
    }
  }

  return maxProfit;
}
