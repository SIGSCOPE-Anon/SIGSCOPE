// generated by codegen/codegen.py
/**
 * This module provides the generated definition of `ObjectLiteralExpr`.
 * INTERNAL: Do not import directly.
 */

private import codeql.swift.generated.Synth
private import codeql.swift.generated.Raw
import codeql.swift.elements.expr.Argument
import codeql.swift.elements.expr.LiteralExpr

/**
 * INTERNAL: This module contains the fully generated definition of `ObjectLiteralExpr` and should not
 * be referenced directly.
 */
module Generated {
  /**
   * An instance of `#fileLiteral`, `#imageLiteral` or `#colorLiteral` expressions, which are used in playgrounds.
   * INTERNAL: Do not reference the `Generated::ObjectLiteralExpr` class directly.
   * Use the subclass `ObjectLiteralExpr`, where the following predicates are available.
   */
  class ObjectLiteralExpr extends Synth::TObjectLiteralExpr, LiteralExpr {
    override string getAPrimaryQlClass() { result = "ObjectLiteralExpr" }

    /**
     * Gets the kind of this object literal expression.
     *
     * This is 0 for `#fileLiteral`, 1 for `#imageLiteral` and 2 for `#colorLiteral`.
     */
    int getKind() {
      result = Synth::convertObjectLiteralExprToRaw(this).(Raw::ObjectLiteralExpr).getKind()
    }

    /**
     * Gets the `index`th argument of this object literal expression (0-based).
     */
    Argument getArgument(int index) {
      result =
        Synth::convertArgumentFromRaw(Synth::convertObjectLiteralExprToRaw(this)
              .(Raw::ObjectLiteralExpr)
              .getArgument(index))
    }

    /**
     * Gets any of the arguments of this object literal expression.
     */
    final Argument getAnArgument() { result = this.getArgument(_) }

    /**
     * Gets the number of arguments of this object literal expression.
     */
    final int getNumberOfArguments() { result = count(int i | exists(this.getArgument(i))) }
  }
}