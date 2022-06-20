
import Ledger.Protocol
import Ledger.Sizing


-- Computations for costs on the ledger.
namespace Ledger.Costing


open Ledger.Protocol (ProtocolParameters)
open Ledger.Sizing   (TokenBundle utxoEntrySize)


-- Compute the minimum Ada for a UTxO.
def minimumAda (pp : ProtocolParameters) (hasDatum : Bool) (tb : TokenBundle) : Nat :=
  pp.utxoCostPerWord * utxoEntrySize hasDatum tb


-- Fee in Lovelace for a transaction of a specified size.
def feeForBytes (pp : ProtocolParameters) (bytes : Nat) : Nat :=
  pp.txFeeFixed + bytes * pp.txFeePerByte

-- Fee in Lovelace for a transaction of the specified size in words.
def feeForWords (pp : ProtocolParameters) (words : Nat) : Nat :=
  feeForBytes pp (8 * words)


end Ledger.Costing
