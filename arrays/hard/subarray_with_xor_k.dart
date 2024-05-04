void main() {
  List<int> nums = [1, 2, 3, 4, 5, 6, 1, 2, 3, 4, 5, 6, 1, 2, 3];
  int target = 6;
  subarrayXOR(nums, target);
}

void subarrayXOR(List<int> nums, int target) {
  subarrayXOR_1(nums, target);
}

void subarrayXOR_1(List<int> nums, int target) {
  int count = 0;

  for (int index1 = 0; index1 < nums.length; index1++) {
    int xorSum = 0;
    for (int index2 = index1; index2 < nums.length; index2++) {
      xorSum ^= nums[index2];
      if (xorSum == target) {
        count++;
      }
    }
  }
  print(count);
}

void subarrayXOR_2(List<int> nums, int target) {
  int xorSum = 0;
  int count = 0;
  Map<int, int> sumMap = {0: 1};

  for (int index = 0; index < nums.length; index++) {
    xorSum ^= nums[index];
    count += sumMap[xorSum ^ target] ?? 0;

    if (xorSum == target) {
      count++;
    }
    sumMap[xorSum] = (sumMap[xorSum] ?? 0) + 1;
  }

  print(count);
}
