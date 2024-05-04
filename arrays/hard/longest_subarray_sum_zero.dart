void main() {
  List<int> nums = [1, -1, 2, -2, 3, -3, 4, -4, 5, -5, 6];
  subarrayZero(nums);
}

void subarrayZero(List<int> nums) {
  subarrayZero_1(nums);
}

void subarrayZero_1(List<int> nums) {
  int length = 0;

  for (int index1 = 0; index1 < nums.length; index1++) {
    int currentLength = 0;
    int sum = 0;
    for (int index2 = index1; index2 < nums.length; index2++) {
      sum += nums[index2];
      if (sum == 0) {
        int difference = ((index2 - index1) + 1);
        currentLength = difference > currentLength ? difference : currentLength;
      }
    }
    length = currentLength > length ? currentLength : length;
  }
  print(length);
}

void subarrayZero_2(List<int> nums) {
  int sum = 0;
  int length = 0;
  Map<int, int> sumMap = {};

  for (int index = 0; index < nums.length; index++) {
    sum += nums[index];

    if (sum == 0) {
      length = index + 1;
    } else {
      if (sumMap.containsKey(sum)) {
        int difference = index - (sumMap[sum] ?? 0);
        length = length > difference ? length : difference;
      }
    }
    sumMap[sum] = index;
  }

  print(length);
}
