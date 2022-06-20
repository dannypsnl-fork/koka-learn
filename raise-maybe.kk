effect ctl raise(msg : string) : a

fun raise-maybe( action : () -> <raise|e> a ) : e maybe<a>
  with handler
    return(x)      Just(x)
    ctl raise(msg) Nothing
  action()

fun raise-from() : raise int
  raise("what ever")
  0

fun default-value()
  (raise-maybe{
    raise-from()
  }).default(1)

fun main() : console ()
  println(default-value())
