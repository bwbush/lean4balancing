
import Ledger.ProtocolParameters
import Ledger.Sizing


-- Computations for costs on the ledger..
namespace Ledger.Costing


open Ledger.ProtocolParameters (txFeeFixed txFeePerByte utxoCostPerWord)
open Ledger.Sizing             (utxoEntrySize)


-- Compute the minimum Ada for a UTxO.
def minimumAda (hasDatum : Bool) (numPolicies numAssets sumAssetNameLengths : Nat) : Nat :=
  utxoCostPerWord
    * utxoEntrySize hasDatum numPolicies numAssets sumAssetNameLengths


-- | Compare to output of `cardano-cli` during Epoch 330.
example : minimumAda false  0   0          0 =   999978 := rfl
example : minimumAda false  1   1          1 =  1344798 := rfl
example : minimumAda false  1   1         32 =  1448244 := rfl
example : minimumAda false  1 110 (110 * 32) = 22137444 := rfl
example : minimumAda false 60  60 ( 60 * 32) = 19758186 := rfl
example : minimumAda true   0   0          0 =  1344798 := rfl
example : minimumAda true   1   1          1 =  1689618 := rfl
example : minimumAda true   2   2          4 =  1862028 := rfl


-- Fee in Lovelace for a transaction of a specified size.
def feeForBytes (bytes : Nat) : Nat :=  txFeeFixed + bytes * txFeePerByte

example : feeForBytes    0 = 155381         := rfl
example : feeForBytes 1000 = 155381 + 44000 := rfl


end Ledger.Costing
