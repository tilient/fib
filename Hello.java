/*
  Source code is in UTF-8 encoding. The following symbols may appear, among others:
  α β γ δ ε ζ η θ ι κ λ μ ν ξ ο π ρ ς σ τ υ φ χ ψ ω « • ¦ » ∀ ∃ ∷ … → ← ﬁ ﬂ ƒ
  If you can't read this, you're out of luck. This code was generated with the frege compiler version 3.24.40
  from Fibber.fr Do not edit this file! Instead, edit the source file and recompile.
*/

import frege.run8.Func;
import frege.run8.Lazy;
import frege.run8.Thunk;
import frege.run.Kind;
import frege.run.RunTM;
import frege.runtime.Meta;
import frege.runtime.Phantom.RealWorld;
import frege.Prelude;
import frege.control.Category;
import frege.control.Semigroupoid;
import frege.java.IO;
import frege.java.Lang;
import frege.java.Util;
import frege.java.util.Regex;
import frege.prelude.Maybe;
import frege.prelude.PreludeArrays;
import frege.prelude.PreludeBase;
import frege.prelude.PreludeIO;
import frege.prelude.PreludeList;
import frege.prelude.PreludeMonad;
import frege.prelude.PreludeText;

@SuppressWarnings("unused")
@Meta.FregePackage(
  source="Fibber.fr", time=1460061192656L, jmajor=9, jminor=-1,
  imps={
    "frege.Prelude", "frege.prelude.PreludeArrays", "frege.prelude.PreludeBase", "frege.prelude.PreludeIO",
    "frege.prelude.PreludeList", "frege.prelude.PreludeMonad", "frege.prelude.PreludeText", "frege.java.util.Regex"
  },
  nmss={"Prelude", "PreludeArrays", "PreludeBase", "PreludeIO", "PreludeList", "PreludeMonad", "PreludeText", "Regexp"},
  symas={}, symcs={}, symis={}, symts={},
  symvs={
    @Meta.SymV(offset=66, name=@Meta.QName(pack="Hello", base="main"), stri="s(u)", sig=1, depth=1, rkind=49),
    @Meta.SymV(offset=20, name=@Meta.QName(pack="Hello", base="greeting"), stri="s(s)", sig=3, depth=1, rkind=49)
  },
  symls={},
  taus={
    @Meta.Tau(kind=2, suba=0, tcon={@Meta.QName(kind=0, pack="frege.prelude.PreludeBase", base="[]")}),
    @Meta.Tau(kind=2, suba=0, tcon={@Meta.QName(kind=0, pack="frege.prelude.PreludeBase", base="StringJ")}),
    @Meta.Tau(kind=2, suba=0, tcon={@Meta.QName(kind=0, pack="frege.prelude.PreludeBase", base="Char")}),
    @Meta.Tau(kind=0, suba=1, subb=2), @Meta.Tau(kind=0, suba=0, subb=3),
    @Meta.Tau(kind=2, suba=0, tcon={@Meta.QName(kind=0, pack="frege.prelude.PreludeBase", base="ST")}),
    @Meta.Tau(kind=2, suba=0, tcon={@Meta.QName(kind=0, pack="frege.prelude.PreludeBase", base="RealWorld")}),
    @Meta.Tau(kind=0, suba=5, subb=6),
    @Meta.Tau(kind=2, suba=0, tcon={@Meta.QName(kind=0, pack="frege.prelude.PreludeBase", base="()")}),
    @Meta.Tau(kind=0, suba=7, subb=8)
  },
  rhos={
    @Meta.Rho(rhofun=false, rhotau=4), @Meta.Rho(rhofun=false, rhotau=9), @Meta.Rho(sigma=0, rhotau=1),
    @Meta.Rho(rhofun=false, rhotau=3), @Meta.Rho(sigma=2, rhotau=3)
  },
  sigmas={@Meta.Sigma(rho=0), @Meta.Sigma(rho=2), @Meta.Sigma(rho=3), @Meta.Sigma(rho=4)}, exprs={@Meta.Expr()},
  kinds={@Meta.Kind(kind=0)}
)
final public class Hello  {
  




final public static String/*<Character>*/ greeting(final String/*<Character>*/ arg$1) {
  return "Hello, " + (arg$1 + "!");
}
final public static Func.U<RealWorld, Short> $main(final Lazy<PreludeBase.TList<String/*<Character>*/>> arg$1) {
  final Func.U<RealWorld, Short> v4647$7609 = Prelude.<Integer>println(PreludeText.IShow_Int.it, 123456789);
  return (Func.U<RealWorld, Short>)((final Lazy<RealWorld> arg$7626) -> {
            final short v4650$7611 = (short)v4647$7609.apply(arg$7626).call();
            final Func.U<RealWorld, Short> v4651$7612 = Thunk.<Func.U<RealWorld, Short>>shared(
                  (Lazy<Func.U<RealWorld, Short>>)(() -> Prelude.<String/*<Character>*/>println(
                            PreludeText.IShow_String.it, Hello.greeting("World")
                          ))
                ).call();
            return Thunk.<Short>nested((Lazy<Lazy<Short>>)(() -> v4651$7612.apply(arg$7626)));
          });
}

  public static void main(final java.lang.String[] argv) {
    try {
      frege.run.RunTM.argv = argv;
      
        PreludeBase.TST.<Short>performUnsafe($main
               (Thunk.lazy(PreludeArrays.IListSource_JArray.<String/*<Character>*/>toList(argv)))
          ).call();

    } finally { frege.run.Concurrent.shutDownIfExists(); }
  }
}
