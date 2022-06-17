fun caesar(s : string, shift : int) : string
  fun encode-char(c) 
    if c < 'a' || c > 'z' then return c
    val base = (c - 'a').int
    val rot  = (base + shift) % 26
    (rot.char + 'a')
  s.map(encode-char)

fun main() : console ()
  println("abc".caesar(3))
