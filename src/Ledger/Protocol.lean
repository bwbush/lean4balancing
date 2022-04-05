
-- Protocol parameters.
namespace Ledger.Protocol


structure ProtocolParameters :=

  -- Required Lovelace for each word in a UTxO.
  utxoCostPerWord : Nat

  -- Lovelace fee per transaction.
  txFeeFixed : Nat

  -- Additional lovelace fee per byte.
  txFeePerByte : Nat

  -- The maximum value size in bytes.
  maxValueSize : Nat

  -- Maximum transaction size in bytes.
  maxTxSize : Nat

  -- The maximum number of collateral inputs.
  maxCollateralInputs : Nat

  -- The collateral percentage relative to the fee.
  collateralPercentage : Float

  -- The maximum execution memory allowed for a transaction.
  maxTxExecutionMemory : Nat

  -- The maximum execution steps allowed for a transaction.
  maxTxExecutionSteps : Nat

  -- The maximum execution memory allowed for a transaction.
  executionMemoryPrice : Float

  -- The maximum execution steps allowed for a transaction.
  executionStepsPrice : Float


instance : Inhabited ProtocolParameters where
  default := {
    utxoCostPerWord      := 34482
    txFeeFixed           := 155381
    txFeePerByte         := 44
    maxTxSize            := 16384
    maxValueSize         := 5000
    maxCollateralInputs  := 3
    collateralPercentage := 150
    maxTxExecutionMemory := 16000000
    maxTxExecutionSteps  := 10000000000
    executionMemoryPrice := 5.77e-2
    executionStepsPrice  := 7.21e-5
  }   


end Ledger.Protocol
