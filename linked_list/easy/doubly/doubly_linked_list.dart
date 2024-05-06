import '../../node.dart';

void main() {
  Node? node = Node(1);

  node.next = Node(2);
  node.next?.previous = node;

  node.next?.next = Node(3);
  node.next?.next?.previous = node.next;

  node.next?.next?.next = Node(4);
  node.next?.next?.next?.previous = node.next?.next;

  while (node != null) {
    print(
        "Data: ${node.data} Previous: ${node.previous?.data} Next: ${node.next?.data}");
    node = node.next;
  }
}
