void main() {
  List<int> nums = [1, 2, 3, 4, 5, 6, 7, 8, 10, 10, 11, 12, 13, 14, 15];

  repeatMissing(nums);
}

void repeatMissing(List<int> nums) {
  repeatMissing_3(nums);
}

void repeatMissing_1(List<int> nums) {
  nums.sort();
  int missingNumber = -1;
  int repeatNumber = -1;

  for (int index = 1; index < nums.length; index++) {
    if (nums[index - 1] == nums[index]) {
      repeatNumber = nums[index];
      break;
    }
  }

  int expectedSum =
      (nums.length * (nums.length + 1)) ~/ 2; // Sum of first n natutal numbers
  int actualSum = 0;

  for (int number in nums) {
    actualSum += number;
  }

  actualSum = actualSum - repeatNumber;

  missingNumber = expectedSum - actualSum;

  print(repeatNumber);
  print(missingNumber);
}

void repeatMissing_2(List<int> nums) {
  Map<int, int> occurenceMap = {};
  int missingNumber = -1;
  int repeatNumber = -1;

  for (int number in nums) {
    if (occurenceMap.containsKey(number)) {
      repeatNumber = number;
      break;
    }
    occurenceMap[number] = (occurenceMap[number] ?? 0) + 1;
  }

  int expectedSum =
      (nums.length * (nums.length + 1)) ~/ 2; // Sum of first n natutal numbers
  int actualSum = 0;

  for (int number in nums) {
    actualSum += number;
  }

  actualSum = actualSum - repeatNumber;

  missingNumber = expectedSum - actualSum;

  print(repeatNumber);
  print(missingNumber);
}

void repeatMissing_3(List<int> nums) {
  int sumOfAllElements = 0, squareSumOfAllElements = 0;
  int sumOfNaturalNumber = 0, squareSumOfNaturalNumber = 0;

  for (int number in nums) {
    sumOfAllElements += number;
    squareSumOfAllElements += number * number;
  }

  sumOfNaturalNumber = (nums.length * (nums.length + 1)) ~/ 2;
  squareSumOfNaturalNumber =
      (nums.length * (nums.length + 1) * (2 * nums.length + 1)) ~/ 6;

  // x is repeatNumber and y is missingNumber
  int value1 = sumOfAllElements - sumOfNaturalNumber; // x - y
  // x^2 - y^2 = (x - y) (x + y)
  int value2 = squareSumOfAllElements - squareSumOfNaturalNumber;
  value2 = value2 ~/ value1; // x + y

  // finding x
  int repeatNumber = (value1 + value2) ~/ 2;
  // extracting y
  int missingNumber = repeatNumber - value1;

  print(repeatNumber);
  print(missingNumber);
}
