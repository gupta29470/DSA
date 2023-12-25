void main() {
  List<int> nums = [2, 0, 1, 1, 0, 2, 1, 2, 0, 1, 2, 0];
  sort(nums);
  print(nums);
}

void sort(List<int> nums) {
  sort_4(nums);
}

// Time: O(nlogn)
void sort_1(List<int> nums) {
  nums.sort();
}

// Time: O(2n)    Space: O(n)
void sort_2(List<int> nums) {
  List<int> zeros = [];
  List<int> ones = [];
  List<int> twos = [];

  for (int number in nums) {
    switch (number) {
      case 0:
        zeros.add(0);
        break;
      case 1:
        ones.add(1);
        break;
      case 2:
        twos.add(2);
    }
  }

  nums.clear();
  nums.addAll(zeros);
  nums.addAll(ones);
  nums.addAll(twos);
}

// Time: O(2n)
void sort_3(List<int> nums) {
  int zerosCount = 0;
  int onesCount = 0;
  int twosCount = 0;

  for (int number in nums) {
    switch (number) {
      case 0:
        zerosCount++;
        break;
      case 1:
        onesCount++;
        break;
      case 2:
        twosCount++;
        break;
    }
  }

  int index = 0;
  int length = zerosCount;

  while (index < length) {
    nums[index] = 0;
    index++;
  }

  length += onesCount;

  while (index < length) {
    nums[index] = 1;
    index++;
  }

  length += twosCount;

  while (index < length) {
    nums[index] = 2;
    index++;
  }
}

// Time: O(n)
void sort_4(List<int> nums) {
  int low = 0, high = nums.length - 1, index = 0;

  while (index <= high) {
    switch (nums[index]) {
      case 0:
        swap(nums, low, index);
        low++;
        index++;
        break;
      case 1:
        index++;
        break;
      case 2:
        swap(nums, index, high);
        high--;
        break;
    }
  }
}

void swap(List<int> nums, int index1, int index2) {
  int temp = nums[index1];
  nums[index1] = nums[index2];
  nums[index2] = temp;
  ;
}
