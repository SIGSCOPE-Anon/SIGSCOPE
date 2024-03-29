// generated by codegen/codegen.py
/**
 * This module provides the generated definition of `ErrorExpr`.
 * INTERNAL: Do not import directly.
 */

private import codeql.swift.generated.Synth
private import codeql.swift.generated.Raw
import codeql.swift.elements.ErrorElement
import codeql.swift.elements.expr.Expr

/**
 * INTERNAL: This module contains the fully generated definition of `ErrorExpr` and should not
 * be referenced directly.
 */
module Generated {
  /**
   * INTERNAL: Do not reference the `Generated::ErrorExpr` class directly.
   * Use the subclass `ErrorExpr`, where the following predicates are available.
   */
  class ErrorExpr extends Synth::TErrorExpr, Expr, ErrorElement {
    override string getAPrimaryQlClass() { result = "ErrorExpr" }
  }
}
