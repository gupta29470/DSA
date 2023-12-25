void main() {
  List<int> nums = [1, 2, -3, -1, -2, 3];

  rearrange(nums);

  print(nums);
}

void rearrange(List<int> nums) {
  return rearrange_2(nums);
}

// TIme: O(n)    Space: O(n)
void rearrange_1(List<int> nums) {
  List<int> positiveList = [];
  List<int> negativeList = [];

  for (int number in nums) {
    if (number < 0) {
      negativeList.add(number);
    } else {
      positiveList.add(number);
    }
  }

  print(positiveList);
  print(negativeList);

  int index1 = 0, index2 = 0, index3 = 0;

  while (index1 < positiveList.length && index2 < negativeList.length) {
    if (index3 % 2 == 0) {
      nums[index3] = positiveList[index1];
      index1++;
      index3++;
    } else {
      nums[index3] = negativeList[index2];
      index2++;
      index3++;
    }
  }

  while (index1 < positiveList.length) {
    nums[index3] = positiveList[index1];
    index1++;
    index3++;
  }

  while (index2 < negativeList.length) {
    nums[index3] = negativeList[index2];
    index2++;
    index3++;
  }
}

// Time: O(n)
void rearrange_2(List<int> nums) {
  int positiveIndex = 0, negativeIndex = 1;
  List<int> result = List.filled(nums.length, 0);

  for (int number in nums) {
    if (number < 0 && negativeIndex < nums.length) {
      result[negativeIndex] = number;
      negativeIndex += 2;
    } else if (number >= 0 && positiveIndex < nums.length) {
      result[positiveIndex] = number;
      positiveIndex += 2;
    }
  }

  for (int index = 0; index < nums.length; index++) {
    nums[index] = result[index];
  }
}
