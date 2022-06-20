
import Ledger


namespace Ledger.Sizing.Test


example : roundupBytesToWords  1 = 1 := rfl
example : roundupBytesToWords  8 = 1 := rfl
example : roundupBytesToWords  9 = 2 := rfl
example : roundupBytesToWords 16 = 2 := rfl
example : roundupBytesToWords 17 = 3 := rfl


example : adaOnlyUTxOSize = 29 := rfl


example : tokenBundleSize {numPolicies :=  0, numAssets :=   0, sumAssetNameLengths :=        0} =   6 := rfl
example : tokenBundleSize {numPolicies :=  1, numAssets :=   1, sumAssetNameLengths :=        1} =  12 := rfl
example : tokenBundleSize {numPolicies :=  1, numAssets :=   1, sumAssetNameLengths :=       32} =  15 := rfl
example : tokenBundleSize {numPolicies :=  1, numAssets := 110, sumAssetNameLengths := 110 * 32} = 615 := rfl
example : tokenBundleSize {numPolicies := 60, numAssets :=  60, sumAssetNameLengths :=  60 * 32} = 546 := rfl


end Ledger.Sizing.Test
