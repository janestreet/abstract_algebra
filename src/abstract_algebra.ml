
open Base

module Commutative_group = struct
  (** An implementation of this interface should have the following properties:

      + associativity: [(a + b) + c = a + (b + c)]
      + identity: [zero + a = a + zero = a]
      + inverses: given any [a] there exists a (unique) elt [b] such that [a + b = b + a =
      zero]
      + commutativity: [a + b = b + a]
  *)

  module type S = sig
    type t [@@deriving sexp]

    val zero : t
    val (+)  : t -> t -> t
    val (-)  : t -> t -> t
  end
end

module Vector_space = struct
  module type S = sig
    type t
    include Commutative_group.S with type t := t
    val scale : t -> float -> t
  end
end

