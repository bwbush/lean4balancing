
import Ledger.Costing


-- Ledger computations.
namespace Ledger


open Ledger.Costing (feeForBytes minimumAda)
open Ledger.Sizing  (TokenBundle)


#eval feeForBytes default 0

#eval minimumAda default false {numPolicies := 1, numAssets := 1, sumAssetNameLengths := 1}


end Ledger
