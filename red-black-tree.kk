type color
  Red
  Black

type tree<k, a>
  Leaf
  Node(color : color, left : tree<k, a>, key: k, value: a, right : tree<k, a>)

fun fold(t : tree<k, a>, acc : b, f : (k, a, b) -> b) : b
  match t
    Leaf -> acc
    Node(_, left, key, value, right) -> right.fold(f(key, value, left.fold(acc, f)), f)

fun main() : console ()
  val left = Node(Red, Leaf, 0, 0, Leaf)
  val right = Node(Red, Leaf, 0, 1, Leaf)
  val t = Node(Red, left, 0, 0, right)
  val count = t.fold(0, fn(k, v, acc) if k==v then acc+1 else acc)
  println(count)
