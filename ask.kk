import std/num/random

effect ask<a>
  ctl ask() : a

fun add-twice() : ask<int> int
  ask() + ask()

fun ask-const() : int
  with ctl ask() resume(21)
  add-twice()

fun main() : console ()
  println(ask-const())
