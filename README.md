# livox_relocalization_mhss_fde
This repository extends the official livox_relocalization project by integrating a lightweight Fault Detection and Exclusion (FDE) module for solid-state LiDAR. The method is based on Multiple Hypothesis Solution Separation (MHSS) and introduces point cloud clustering to reduce computation load while ensuring real-time performance.

## License

This project is released under the **MIT License** (see the `LICENSE` file).

Parts of the source code are derived from the LOAM algorithm and the Livox
`livox_relocalization` implementation, which are licensed under the
**BSD 3-Clause License**. The original copyright and license terms are
retained in `THIRD_PARTY_LICENSES/LICENSE_LOAM.txt`.
