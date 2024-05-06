import '../../node.dart';

void main() {
  Node? node = Node(1);

  node.next = Node(2);
  node.next?.previous = node;

  node.next?.next = Node(3);
  node.next?.next?.previous = node.next;

  node.next?.next?.next = Node(4);
  node.next?.next?.next?.previous = node.next?.next;

  Node? head = insertEnd(node, 5);

  while (head != null) {
    print(
        "Data: ${head.data} Previous: ${head.previous?.data} Next: ${head.next?.data}");
    head = head.next;
  }
}

Node? insertEnd(Node? node, int data) {
  Node newNode = Node(data);

  if (node == null) {
    return newNode;
  }

  Node? current = node;

  while (current?.next != null) {
    current = current?.next;
  }

  current?.next = newNode;
  newNode.previous = current;

  return node;
}
