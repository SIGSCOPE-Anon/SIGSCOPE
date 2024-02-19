// Query to check if the function "gatherPermitSignature" is potentially dead code

import javascript

// Define a function named "gatherPermitSignature"
predicate hasGatherPermitSignature(Function f) {
  f.getName() = "useERC20PermitFromTrade"
}

// Find functions that are defined but not called
from Function f
where hasGatherPermitSignature(f) and
      not exists(CallExpr ce | ce.getCallee().(Function) = f)
select f
