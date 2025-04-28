open Base

module Commutative_group = struct
  (** An implementation of this interface should have the following properties:

      + associativity: [(a + b) + c = a + (b + c)]
      + identity: [zero + a = a + zero = a]
      + inverses: given any [a] there exists a (unique) elt [b] such that
        [a + b = b + a = zero]
      + commutativity: [a + b = b + a]

      Note that subtraction must be equivalent to addition of the inverse:

      + [a - b = a + b'], where [b + b' = 0] *)

  module type Without_sexp = sig
    type t

    val zero : t
    val ( + ) : t -> t -> t
    val ( - ) : t -> t -> t
  end

  module type S = sig
    type t [@@deriving sexp]

    include Without_sexp with type t := t
  end
end

module Vector_space = struct
  module type S = sig
    type t

    include Commutative_group.S with type t := t

    val scale : t -> float -> t
  end
end
