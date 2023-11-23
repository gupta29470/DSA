void main() {
  List<int> nums = [2, 3, 4, 2, 3, 1, 4];

  print(singleElement(nums));
}

int singleElement(List<int> nums) {
  return singleElement_3(nums);
}

// Time: O(nlogn)
int singleElement_1(List<int> nums) {
  nums.sort();

  for (int index = 0; index < nums.length; index += 2) {
    if (index == nums.length - 1) {
      return nums[index];
    }
    if (nums[index] != nums[index + 1]) {
      return nums[index];
    }
  }

  return -1;
}

// Time: O(n)    Space: O(n)
int singleElement_2(List<int> nums) {
  Map<int, int> numMap = {};

  for (int number in nums) {
    numMap[number] = (numMap[number] ?? 0) + 1;
  }

  for (MapEntry<int, int> entry in numMap.entries) {
    if (entry.value == 1) {
      return entry.key;
    }
  }
  return -1;
}

// Time: O(n)
int singleElement_3(List<int> nums) {
  int xor = nums[0];

  for (int index = 1; index < nums.length; index++) {
    xor ^= nums[index];
  }

  return xor;
}
