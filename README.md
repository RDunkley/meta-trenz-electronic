# meta-trenz-electronic
BitBake recipes to build Linux for various Trenz Electronic boards. NOTE: this is not an official repository.
  
## Supported Boards
The following boards are currently supported and are the machine names that should be used in the local.conf file:
1.  te0820-03-03eg

## Usage
This package will update patch U-Boot to support the boards and also provide a device tree containing the hardware components found on the board.

## Dependencies
This layer depends on:

URI | Layers | Branch
--- | ------ | ------
git://git.openembedded.org/bitbake | | thud
git://git.openembedded.org/openembedded-core | meta | thud
git://git.yoctoproject.org/meta | meta | thud
https://github.com/Xilinx/meta-xilinx.git | meta-xilinx | rel-v2019.1
https://github.com/Xilinx/meta-xilinx-tools.git | meta-xilinx-tools | rel-v2019.1

## Random Number Generation
The machine configuration files add the following line:

IMAGE_INSTALL_append = " haveged"

This will ensure that the SSH server will startup in a timely manner by providing high entropy for random number generation quicker. Care should be taken to ensure this is acceptable for the security posture of the desired system.

## Add Additional Boards
To add additional boards, perform the following steps:
1.  Create the machine configuration file in /conf/machine
2.  Build a minimal design in Vivado and export the HDF file.
3.  Add the device tree to the /recipes-bsp/device-tree recipe.
4.  Add the exported HDF file to the /recipes-bsp/hdf recipe.
5.  Extract the platform init files from the HDF file and add them to the /recipes-bsp/platform-init recipe.
6.  Add the u-boot configuration file to the /recipes-bsp/u-boot recipe.

## Patches
Please submit any patches against this layer using pull requests in github or open up an issue.
