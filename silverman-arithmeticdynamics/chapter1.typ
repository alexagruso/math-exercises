#import "conf.typ": *;

#show: conf.with(title: "Introduction", chapter: 0)

#let gcd = "gcd"
#let Per = "Per"
#let PrePer = "PrePer"

#let done = [#h(1fr) $square.filled$]

#exercise[
  Let $S$ be a set and $phi.alt : S -> S$ be a self mapping of $S$.
  #enum(
    numbering: "a)",
    [
      If $S$ is finite, then $phi.alt$ is bijective if and only if $Per(phi.alt, S) = S$
    ],
    [
      In general, if $Per(phi.alt, S) = S$, then $phi.alt$ is bijective
    ],
    [
      Provide an example of an infinite set $S$ and a self map $phi.alt$ of $S$ such that
      $phi.alt$ is bijective but $Per(phi.alt, S) != S$.
    ],
    [
      If $phi.alt$ is injective, then $PrePer(phi.alt, S) = Per(phi.alt, S)$
    ],
  )
]

#solution[
  #enum(
    numbering: "a)",
    [
      A bijection $phi.alt$ on a finite set $S$ is a permutation of the elements of $S$,
      hence can be written as a product of cycles of elements in $S$.
      Any element $alpha in S$ is contained in one of these cycles, and thus is
      $phi.alt$-periodic with period equal to the length of the cycle that contains it.

      Conversely, suppose that $Per(phi.alt, S) = S$ so that for any $alpha in S$ there
      exists some $m in NN$ such that $phi.alt^m (alpha) = alpha$.
      We can see that
      $
        alpha = phi.alt^m (alpha) = phi.alt (phi.alt^(m - 1)(alpha)),
      $
      hence $phi.alt$ maps $beta = phi.alt^(m - 1)(alpha)$ to $alpha$, proving that
      $phi.alt$ is surjective.

      Next, fix $alpha, beta in S$ such that $phi.alt(alpha) = phi.alt(beta)$, and
      choose integers $m, n in NN$ such that $alpha = phi.alt^m (alpha)$ and
      $beta = phi.alt^n (beta)$.
      Fixing $k in NN$, we have
      $
        phi.alt^k (alpha)
        = phi.alt^(k - 1) (phi.alt(alpha))
        = phi.alt^(k - 1) (phi.alt(beta))
        = phi.alt^k (beta),
      $
      hence $phi.alt^k (alpha) = phi.alt^k (beta)$ for all $k$.
      Using this fact, we find that
      $
        alpha & = phi.alt^m (alpha) = phi.alt^m (beta) = phi.alt^m (phi.alt^n (beta))
                = phi.alt^n (phi.alt^m (beta)) \
              & = phi.alt^n (phi.alt^m (alpha)) = phi.alt^n (alpha) = phi.alt^n (beta)
                = beta,
      $
      showing that $phi.alt$ is injective, and thus bijective. #done
    ],
    [
      Since the second part of the previous doesn't rely on the finiteness of $S$, we
      are finished. #done
    ],
    [
      Let $S = ZZ$ and define $phi.alt(n) = n + 1$.
      Obviously $phi.alt$ is bijective, but for any $n in ZZ$, the orbit
      $cal(O)_phi.alt (n) = {k in ZZ : k >= n}$ is an infinite set, hence
      $Per(phi.alt, ZZ) = emptyset != ZZ$.
    ],
    [
      Assume $phi.alt$ is injective and let $alpha in PrePer(phi.alt, S)$.
      Also choose $m, n in NN$ such that $m < n$ and
      $phi.alt^m (alpha) = phi.alt^n (alpha)$.
      We have that
      $
        phi.alt^m (alpha)
        = phi.alt(phi.alt^(m - 1) (alpha))
        = phi.alt^n (alpha)
        = phi.alt(phi.alt^(n - 1) (alpha)),
      $
      thus $phi.alt^(m - 1) (alpha) = phi.alt^(n - 1) (alpha)$ since $phi.alt$ is
      injective.
      Performing induction on $n$ gives us $alpha = phi.alt^(n - m) (alpha)$, proving that
      $alpha in Per(phi.alt, S)$.
      Since periodic points are trivially preperiodic, we have shown that
      $PrePer(phi.alt, S) = Per(phi.alt, S)$. #done
    ],
  )
]

#exercise[
  Let $S$ be a set, and let $phi.alt$ and $psi$ be self maps of $S$.
  Further suppose that $phi.alt$ and $psi$ commute, i.e.
  $phi.alt compose psi = psi compose phi.alt$.
  #enum(
    numbering: "a)",
    [
      We have $psi(PrePer(phi.alt)) subset.eq PrePer(phi.alt)$
    ],
    [
      If $psi$ is surjective and finite-to-one (i.e. if the preimage of any point in
      $S$ under $psi$ is a finite set), then $psi(PrePer(phi.alt)) = PrePer(phi.alt)$
    ],
    [
      A point $alpha in S$ is called an _*isolated preperiodic point*_ if there exist
      $m, n in NN$ such that $m < n$, $phi.alt^m (alpha) = phi.alt^n (alpha)$, and
      the set $ {beta in S : phi.alt^m (beta) = phi.alt^n (beta)} $ is finite.

      If every preperiodic point of $phi.alt$ is isolated, then
      $PrePer(phi.alt) subset.eq PrePer(psi)$.
    ],
  )
]

#solution[
  a
]

#exercise[
  Let $phi.alt in ZZ[X]$ with $phi.alt(X) = X^d + a$, and let $p$ be a prime.
  We have that $Per(phi.alt, FF_p) = FF_p$ if and only if $gcd(d, p - 1) = 1$
]

#solution[

]

#exercise[
  Let $G$ be a group and $phi.alt : G -> G$ a group homomorphism.
  #enum(
    numbering: "a)",
    [
      $Per(phi.alt, G)$ is a subgroup of $G$.
    ],
    [
      $PrePer(phi.alt, G)$ is not necessarily a subgroup of $G$.
    ],
  )
]

#solution[
  #enum(
    numbering: "a)",
    [
      Let $alpha, beta in Per(phi.alt, G)$ with periods $m$ and $n$, respectively.
      Induction on $k$ easily shows that
      $phi.alt^k (alpha beta) = phi.alt^k (alpha) phi.alt^k (beta)$, hence
      $
        phi.alt^(m n)(alpha beta) = phi.alt^(m n) (alpha) phi.alt^(m n) (beta).
      $
      Since iterating a periodic point by a multiple of its period fixes the point,
      we conclude that $phi.alt^(m n) (alpha) phi.alt^(m n) (beta) = alpha beta$ and that
      $alpha beta in Per(phi.alt, G)$.
      Additionally,
      $
        phi.alt^m (alpha^(-1)) = (phi.alt^m (alpha))^(-1) = alpha^(-1),
      $
      hence $alpha^(-1) in Per(phi.alt, G)$, proving that $Per(phi.alt, G)$ is a subgroup
      of $G$. #done
    ],
    [
      a
    ],
  )
]

#exercise[
  Let $G$ be a topological group and $phi.alt : G -> G$ a continuous homomorphism on
  $G$.
  Compute the following topological closures:
]
