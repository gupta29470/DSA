void main() {
  List<int> nums = [9, 6, 4, 2, 3, 5, 7, 0, 1];

  print(missingNumber(nums));
}

int missingNumber(List<int> nums) {
  return missingNumber_3(nums);
}

// Time: O(nlogn)
int missingNumber_1(List<int> nums) {
  nums.sort();

  for (int index = 0; index < nums.length; index++) {
    if (index != nums[index]) {
      return index;
    }
  }

  return nums.length;
}

// Time: O(n)    Space: O(n)
int missingNumber_2(List<int> nums) {
  Map<int, int> numMap = {};

  for (int number in nums) {
    numMap[number] = (numMap[number] ?? 0) + 1;
  }

  for (int index = 0; index < nums.length; index++) {
    if (!numMap.containsKey(index)) {
      return index;
    }
  }

  return nums.length;
}

// Time: O(n)
int missingNumber_3(List<int> nums) {
  int xor1 = nums[0], xor2 = 0;

  for (int number in nums) {
    xor1 ^= number;
  }

  for (int index = 0; index < nums.length; index++) {
    xor2 ^= index;
  }

  return xor1 ^ xor2;
}
