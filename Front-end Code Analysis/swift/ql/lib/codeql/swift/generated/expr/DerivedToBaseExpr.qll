// generated by codegen/codegen.py
/**
 * This module provides the generated definition of `DerivedToBaseExpr`.
 * INTERNAL: Do not import directly.
 */

private import codeql.swift.generated.Synth
private import codeql.swift.generated.Raw
import codeql.swift.elements.expr.ImplicitConversionExpr

/**
 * INTERNAL: This module contains the fully generated definition of `DerivedToBaseExpr` and should not
 * be referenced directly.
 */
module Generated {
  /**
   * INTERNAL: Do not reference the `Generated::DerivedToBaseExpr` class directly.
   * Use the subclass `DerivedToBaseExpr`, where the following predicates are available.
   */
  class DerivedToBaseExpr extends Synth::TDerivedToBaseExpr, ImplicitConversionExpr {
    override string getAPrimaryQlClass() { result = "DerivedToBaseExpr" }
  }
}
