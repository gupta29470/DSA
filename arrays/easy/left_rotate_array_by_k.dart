void main() {
  List<int> nums = [89, 92, 99, 28, 30, 22, 86, 26, 82, 31, 65, 76, 59, 78, 69];
  int k = 3;

  leftRotate(nums, k);

  print(nums);
}

void leftRotate(List<int> nums, int k) {
  leftRotate_3(nums, k);
}

// Time: O(n)   Space: O(n)
void leftRotate_1(List<int> nums, int k) {
  List<int> tempNums = [];
  int index = nums.length - k;

  for (; index < nums.length; index++) {
    tempNums.add(nums[index]);
  }

  index = 0;

  for (; index < nums.length - k; index++) {
    tempNums.add(nums[index]);
  }

  nums.clear();
  nums.addAll(tempNums);
}

// Time: O(n)   Space: O(k)
void leftRotate_2(List<int> nums, int k) {
  List<int> tempNums = [];
  int index = nums.length - k;

  while (index < nums.length) {
    tempNums.add(nums[index]);
    index++;
  }

  index = nums.length - 1;

  while (index >= k) {
    nums[index] = nums[index - k];
    index--;
  }

  for (int tempIndex = tempNums.length - 1; tempIndex >= 0; tempIndex--) {
    nums[index] = tempNums[tempIndex];
    index--;
  }
}

// Time: O(n)
void leftRotate_3(List<int> nums, int k) {
  int index1 = nums.length - k, index2 = nums.length - 1;

  while (index1 < index2) {
    swap(nums, index1, index2);
    index1++;
    index2--;
  }

  index1 = 0;
  index2 = nums.length - k - 1;

  while (index1 < index2) {
    swap(nums, index1, index2);
    index1++;
    index2--;
  }

  index1 = 0;
  index2 = nums.length - 1;

  while (index1 < index2) {
    swap(nums, index1, index2);
    index1++;
    index2--;
  }
}

void swap(List<int> nums, int index1, int index2) {
  int temp = nums[index1];
  nums[index1] = nums[index2];
  nums[index2] = temp;
}
