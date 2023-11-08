void main() {
  List<int> nums = [64, 25, 12, 22, 11];
  quickSort(nums);
  print(nums);
}

void quickSort(List<int> nums) {
  divide(nums, 0, nums.length - 1);
}

void divide(List<int> nums, int left, int right) {
  if (left < right) {
    int partitionIndex = partition(nums, left, right);

    divide(nums, left, partitionIndex - 1);
    divide(nums, partitionIndex + 1, right);
  }
}

int partition(List<int> nums, int left, int right) {
  int index1 = left, index2 = right, pivot = nums[left];

  while (index1 < index2) {
    while (index1 < index2 && nums[index1] <= pivot) {
      index1++;
    }

    while (index2 > left && pivot <= nums[index2]) {
      index2--;
    }

    if (index1 < index2) {
      swap(nums, index1, index2);
    }
  }

  swap(nums, left, index2);

  return index2;
}

void swap(List<int> nums, int index1, int index2) {
  int temp = nums[index1];
  nums[index1] = nums[index2];
  nums[index2] = temp;
}
