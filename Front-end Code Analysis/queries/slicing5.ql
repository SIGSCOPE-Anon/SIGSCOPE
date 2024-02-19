import javascript
import semmle.javascript.explore.CallGraph
import DataFlow

from FunctionNode startFunction, FunctionNode endFunction
where startFunction.getName() = "gatherPermitSignature"
  and callEdge*(startFunction, endFunction) // '*' for transitive closure
  and startFunction != endFunction // Exclude self-calls
select startFunction, endFunction, "Transitive call path from 'gatherPermitSignature'"
