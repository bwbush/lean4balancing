
import Ledger.Costing


-- Ledger computations.
namespace Ledger


open Ledger.Costing (feeForBytes feeForWords minimumAda)
open Ledger.Sizing  (TokenBundle tokenBundleSize txinEntrySize)


#eval feeForBytes default 0

#eval minimumAda default false {numPolicies := 1, numAssets := 1, sumAssetNameLengths := 1}


#eval feeForWords default (tokenBundleSize {numPolicies := 1, numAssets := 1, sumAssetNameLengths := 6} - txinEntrySize) - feeForWords default 0


end Ledger
