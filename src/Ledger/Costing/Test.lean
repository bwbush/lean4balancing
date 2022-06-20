
import Ledger.Costing


namespace Ledger.Costing.Test


-- | Compare to output of `cardano-cli` during Epoch 330.
example : minimumAda default false {numPolicies :=  0, numAssets :=   0, sumAssetNameLengths :=        0} =   999978 := rfl
example : minimumAda default false {numPolicies :=  1, numAssets :=   1, sumAssetNameLengths :=        1} =  1344798 := rfl
example : minimumAda default false {numPolicies :=  1, numAssets :=   1, sumAssetNameLengths :=       32} =  1448244 := rfl
example : minimumAda default false {numPolicies :=  1, numAssets := 110, sumAssetNameLengths := 110 * 32} = 22137444 := rfl
example : minimumAda default false {numPolicies := 60, numAssets :=  60, sumAssetNameLengths :=  60 * 32} = 19758186 := rfl
example : minimumAda default true  {numPolicies :=  0, numAssets :=   0, sumAssetNameLengths :=        0} =  1344798 := rfl
example : minimumAda default true  {numPolicies :=  1, numAssets :=   1, sumAssetNameLengths :=        1} =  1689618 := rfl
example : minimumAda default true  {numPolicies :=  2, numAssets :=   2, sumAssetNameLengths :=        4} =  1862028 := rfl


example : feeForBytes default    0 = 155381         := rfl
example : feeForBytes default 1000 = 155381 + 44000 := rfl


end Ledger.Costing.Test
