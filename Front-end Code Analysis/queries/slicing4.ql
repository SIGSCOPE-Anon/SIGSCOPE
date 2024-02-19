import javascript

/**
 * @name Use of global variables by gatherPermitSignature
 * @description Finds global variables that are used by the function named gatherPermitSignature.
 * @kind path-problem
 */

class UseOfGlobalVariables extends DataFlow::Configuration {
  UseOfGlobalVariables() { this = "Use of global variables by gatherPermitSignature" }

  override predicate isSource(DataFlow::Node source) {
    exists(CallExpr call |
      call.getCallee().(VarRef).getVariable().getName() = "gatherPermitSignature" and
      source.asExpr() = call.getAnArgument()
    )
  }

  override predicate isSink(DataFlow::Node sink) {
    exists(VarAccess va |
      va = sink.asExpr() and
      va.getVariable().getScope() instanceof GlobalScope
    )
  }
}

from UseOfGlobalVariables config, DataFlow::Node source, DataFlow::Node sink, VarAccess va
where config.hasFlow(source, sink) and
      va = sink.asExpr() and
      va.getVariable().getScope() instanceof GlobalScope
select va, va.getVariable().getName(), source, sink, va.getVariable()
