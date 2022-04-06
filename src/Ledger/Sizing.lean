
-- Computations for sizes on the ledger..
namespace Ledger.Sizing


-- A bundle of tokens.
structure TokenBundle :=
  numPolicies         : Nat
  numAssets           : Nat
  sumAssetNameLengths : Nat


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
def tokenBundleSize (tb : TokenBundle) : Nat :=
  6 + roundupBytesToWords (
    tb.numPolicies * pidSize + 12 * tb.numAssets + tb.sumAssetNameLengths
  )

example : tokenBundleSize {numPolicies :=  0, numAssets :=   0, sumAssetNameLengths :=        0} =   6 := rfl
example : tokenBundleSize {numPolicies :=  1, numAssets :=   1, sumAssetNameLengths :=        1} =  12 := rfl
example : tokenBundleSize {numPolicies :=  1, numAssets :=   1, sumAssetNameLengths :=       32} =  15 := rfl
example : tokenBundleSize {numPolicies :=  1, numAssets := 110, sumAssetNameLengths := 110 * 32} = 615 := rfl
example : tokenBundleSize {numPolicies := 60, numAssets :=  60, sumAssetNameLengths :=  60 * 32} = 546 := rfl


-- The size in words of a datum hash.
def dataHashSize (hasDatum : Bool) : Nat :=
  if hasDatum
    then 10
    else  0


-- | The size in words of a UTxO entry.
def utxoEntrySize (hasDatum : Bool) (tb : TokenBundle) : Nat :=
  let valueSize :=
    match tb.sumAssetNameLengths with
    | 0 => adaOnlyUTxOSize
    | _ => utxoEntrySizeWithoutVal + tokenBundleSize tb
  valueSize + dataHashSize hasDatum


-- | The size in words of a transaction input.
def txinEntrySize : Nat := 36 / 8  -- FIXME: Not verified!


end Ledger.Sizing
