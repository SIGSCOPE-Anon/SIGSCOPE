import javascript
import semmle.javascript.explore.CallGraph
import DataFlow

from InvokeNode invoke, FunctionNode function
where callEdge*(invoke, function)
  and isStartOfCallPath(invoke)
  and function.getName() = "gatherPermitSignature"
select invoke, function, "Call path to 'targetFunction'"