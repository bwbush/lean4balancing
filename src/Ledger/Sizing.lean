
-- Computations for sizes on the ledger..
namespace Ledger.Sizing


-- Compute the size in words needed to hold a given number of bytes.
def roundupBytesToWords (bytes : Nat) : Nat :=
  (bytes + 7) / 8

example : roundupBytesToWords  1 = 1 := rfl
example : roundupBytesToWords  8 = 1 := rfl
example : roundupBytesToWords  9 = 2 := rfl
example : roundupBytesToWords 16 = 2 := rfl
example : roundupBytesToWords 17 = 3 := rfl


-- The policy ID size in bytes.
def pidSize : Nat := 28


-- The bytes needed to store a quantity of coins.
def coinSize : Nat := 2


-- The size of a UTxO if it had no value in it.
def utxoEntrySizeWithoutVal : Nat := 27


-- The size of a UTxO if it only has ADA.
def adaOnlyUTxOSize : Nat := utxoEntrySizeWithoutVal + coinSize

example : adaOnlyUTxOSize = 29 := rfl


-- The size in words of a token bundle.
def tokenBundleSize (numPolicies numAssets sumAssetNameLengths : Nat) : Nat :=
  6 + roundupBytesToWords (
    numPolicies * pidSize + 12 * numAssets + sumAssetNameLengths
  )

example : tokenBundleSize  0   0  0         =   6 := rfl
example : tokenBundleSize  1   1  1         =  12 := rfl
example : tokenBundleSize  1   1 32         =  15 := rfl
example : tokenBundleSize  1 110 (110 * 32) = 615 := rfl
example : tokenBundleSize 60  60 ( 60 * 32) = 546 := rfl


-- The size in words of a datum hash.
def dataHashSize (hasDatum : Bool) : Nat :=
  if hasDatum
    then 10
    else  0


-- | The size in words of a UTxO entry.
def utxoEntrySize (hasDatum : Bool) (numPolicies numAssets sumAssetNameLengths : Nat) :=
  let valueSize :=
    match sumAssetNameLengths with
    | 0 => adaOnlyUTxOSize
    | _ => utxoEntrySizeWithoutVal + tokenBundleSize numPolicies numAssets sumAssetNameLengths
  valueSize + dataHashSize hasDatum


end Ledger.Sizing
