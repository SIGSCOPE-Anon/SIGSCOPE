import javascript

// Define a predicate to find the function by name
Function gatherPermitSignature() {
  result.getName() = "gatherPermitSignature"
}


// Define a predicate to find variable accesses within a specific function
predicate isVariableUsedInGatherPermitSignature(VarAccess va) {
  exists(Function gatherFunction |
    gatherFunction = gatherPermitSignature() and
    va.getEnclosingFunction() = gatherFunction
  )
}

// Select all the function calls and variable accesses within 'gatherPermitSignature'
from VarAccess va
where
  isVariableUsedInGatherPermitSignature(va)
select va, va.getName(), va.getAPredecessor(), va.getAToken(), va.getContainer(), va.getExceptionTarget()

