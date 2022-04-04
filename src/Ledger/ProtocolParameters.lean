
-- Protocol parameters.
namespace Ledger.ProtocolParameters


-- Required Lovelace for each word in a UTxO.
def utxoCostPerWord : Nat := 34482


-- Lovelace fee per transaction.
def txFeeFixed : Nat := 155381


-- Additional lovelace fee per byte.
def txFeePerByte : Nat := 44


end Ledger.ProtocolParameters
