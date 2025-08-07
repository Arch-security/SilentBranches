
This PoC demonstrates silent branches via SFB optimization, leveraging a secret-dependent branch to construct a D-cache side channel implemented on the [SonicBOOM](https://github.com/riscv-boom/riscv-boom) core. It corresponds to **Section VI-B** of our paper.
 
---
## Environment Configuration:
- **Operating System**: Ubuntu 20.04
- **Chipyard Version**: v1.8.0
  - Used for generating RTL for SonicBOOM-based processors.
- **Verilator Version**: v4.210
  - Used for running the simulations of the generated RTL.
---
## How to Use
### Step 1: Build your SonicBOOM Core
Before testing this PoC, you must have a compiled SonicBOOM core.
To instantiate and build the BOOM core, please use the [Chipyard](https://github.com/ucb-bar/chipyard) SoC generator.
Ensure that the core you build matches the configuration used for this attack (e.g., SmallBoomConfig).

To verify whether your security-enhanced SonicBOOM core can still be bypassed by this attack, enable the SFB optimization flag in `boom/src/main/scala/common/parameters.scala`.

Locate the following line and set the flag to true:

`enableSFBOpt: Boolean = true`


### Step 2: Compile the Attack PoC
We provide a bare-metal build framework for this attack PoC.
Simply run the following command to compile:

`make`

The compiled binary will be generated under the `./bin/`

## Step 3: Run the Attack
Run the attack on the executable binary corresponding to the compiled core, e.g.:
  ```
    ./simulator-chipyard-SmallBoomConfig path/SilentBranch/Silent_Branches_SFB/bin/v1sfb.riscv
  ```



## [STT](https://dl.acm.org/doi/pdf/10.1145/3352460.3358274) Bypass Invalidation

We will release our STT-enhanced SonicBOOM core and build guide after the paper is accepted to support bypass invalidation.


