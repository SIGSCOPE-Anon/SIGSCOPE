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


// Find all instances of the 'eth_signTypedData_v4' expression.
from JavaScriptExpression id
select id, id.getEnclosingFunction(), id.getEnclosingFunction().getName()



