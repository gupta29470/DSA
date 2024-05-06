import '../../node.dart';

void main() {
  Node? node = Node(1);

  node.next = Node(2);
  node.next?.previous = node;

  node.next?.next = Node(3);
  node.next?.next?.previous = node.next;

  node.next?.next?.next = Node(4);
  node.next?.next?.next?.previous = node.next?.next;

  Node? head = deleteNode(node, 1);

  while (head != null) {
    print(
        "Data: ${head.data} Previous: ${head.previous?.data} Next: ${head.next?.data}");
    head = head.next;
  }
}

Node? deleteNode(Node? node, int data) {
  if (node == null) {
    return null;
  }

  if (node.data == data) {
    node.next?.previous = null;
    return node.next;
  }

  Node? current = node;

  while (current?.next != null) {
    if (current?.next?.data == data) {
      current?.next = current.next?.next;
      current?.next?.previous = current;

      return node;
    }

    current = current?.next;
  }

  return node;
}
