import '../../node.dart';

void main() {
  Node? node = Node(1);

  node.next = Node(2);
  node.next?.previous = node;

  node.next?.next = Node(3);
  node.next?.next?.previous = node.next;

  node.next?.next?.next = Node(4);
  node.next?.next?.next?.previous = node.next?.next;

  Node? head = reverseDLL(node);

  while (head != null) {
    print(
        "Data: ${head.data} Previous: ${head.previous?.data} Next: ${head.next?.data}");
    head = head.next;
  }
}

Node? reverseDLL(Node? node) {
  if (node == null) {
    return node;
  }

  Node? current = node;
  Node? previous = null;

  while (current != null) {
    Node? next = current.next;
    current.next = previous;
    current.previous = next;
    current = current.next;
  }

  return current?.previous;
}
