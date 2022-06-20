
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


-- The policy ID size in bytes.
def pidSize : Nat := 28


-- The bytes needed to store a quantity of coins.
def coinSize : Nat := 2


-- The size of a UTxO if it had no value in it.
def utxoEntrySizeWithoutVal : Nat := 27


-- The size of a UTxO if it only has ADA.
def adaOnlyUTxOSize : Nat := utxoEntrySizeWithoutVal + coinSize


-- The size in words of a token bundle.
def tokenBundleSize (tb : TokenBundle) : Nat :=
  6 + roundupBytesToWords (
    tb.numPolicies * pidSize + 12 * tb.numAssets + tb.sumAssetNameLengths
  )


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
