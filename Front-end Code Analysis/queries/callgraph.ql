// Query to find the call graph of the function "gatherPermitSignature"

import javascript

// Define a function named "gatherPermitSignature"
predicate isGatherPermitSignature(Function f) {
  f.getName() = "gatherPermitSignature"
}

// Find the call graph of "gatherPermitSignature"
from Function caller, CallExpr call, Function callee
where isGatherPermitSignature(callee) and
      call.getCallee() = callee and
      call.getEnclosingFunction() = caller
select caller, callee, call.getLocation()
