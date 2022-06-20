effect ctl raise(msg : string) : a

fun safe-divide( x : int, y : int ) : raise int
  if y==0 then raise("div-by-zero") else x / y

fun raise-const() : int
  with ctl raise(msg) 0
  // `8+` will get ignored, because `ctl` changes the linear control-flow
  8 + safe-divide(1,0)

fun catch( hnd : (string) -> e a, action : () -> <raise|e> a ) : e a
  with ctl raise(msg) hnd(msg)
  action()

fun catch-example()
  with catch( fn(msg){ println("error: " ++ msg) } )
  safe-divide(1,0)
  ()

fun main() : console ()
  println(raise-const())
  catch-example()
