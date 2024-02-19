import javascript

// Define a class that represents a JavaScript expression.
class JavaScriptExpression extends Expr {
  JavaScriptExpression() {
    exists(
      Expr id |
        id.mayHaveStringValue("eth_signTypedData_v4") and
        this = id
    )
  }
}

// Find all instances of the 'eth_signTypedData_v3' expression.
from JavaScriptExpression eth_signTypedData_v3
select eth_signTypedData_v3, eth_signTypedData_v3.getEnclosingFunction(), eth_signTypedData_v3.getParent().getParent().getChild(1).getChild(1).getChild(1).getChild(0)



