effect yield
  ctl yield(i : int) : bool

fun traverse(xs : list<int>) : yield ()
  match xs
    Cons(x, xx) -> if yield(x) then traverse(xx) else ()
    Nil -> ()

fun print-elements(xs : list<int>) : console ()
  with ctl yield(x)
    println("e: " ++ x.show)
    resume(True)
  println("traverse")
  traverse(xs)
  println("map")
  map(xs, println)
  ()

fun main() : console ()
  [1,2,3,4,5].map(println)
  print-elements([0, 3, 3, 4, 5])
