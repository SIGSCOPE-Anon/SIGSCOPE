import javascript

class ChainIdProperty extends Property {
  ChainIdProperty() {
    exists(
        Property id |
          id.getAChildExpr().mayHaveStringValue("chainId") and
          this = id
      )
  }
}

from ChainIdProperty access
select access




