
import Ledger.Costing


-- Ledger computations.
namespace Ledger


open Ledger.Costing (feeForBytes minimumAda)


#eval feeForBytes 0

#eval minimumAda false 1 1 1


end Ledger
