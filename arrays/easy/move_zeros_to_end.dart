void main() {
  List<int> nums = [64, 0, 42, 70, 0, 0, 0, 0, 56, 11, 1, 0, 37, 70, 0, 0];

  moveZeros(nums);

  print(nums);
}

void moveZeros(List<int> nums) {
  moveZeros_2(nums);
}

// Time: O(n)   Space: O(n)
void moveZeros_1(List<int> nums) {
  List<int> nonZeros = [];

  for (int number in nums) {
    if (number != 0) {
      nonZeros.add(number);
    }
  }

  int index = 0;

  while (index < nonZeros.length) {
    nums[index] = nonZeros[index];
    index++;
  }

  while (index < nums.length) {
    nums[index] = 0;
    index++;
  }
}

// Time: O(n)
void moveZeros_2(List<int> nums) {
  int index1 = 0, index2 = -1;

  while (index1 < nums.length) {
    if (index2 < 0 && nums[index1] == 0) {
      index2 = index1;
    } else if (index2 >= 0 && nums[index1] != 0) {
      swap(nums, index1, index2);
      index2++;
    }
    index1++;
  }
}

void swap(List<int> nums, int index1, int index2) {
  int temp = nums[index1];
  nums[index1] = nums[index2];
  nums[index2] = temp;
}
