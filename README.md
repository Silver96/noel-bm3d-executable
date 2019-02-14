# noel BM3D executable
This repo contains the files required to compile a working BM3D executable for the [noel](https://github.com/Silver96/noel) project.

In order to obtain a working executable, the following steps are needed:
- Install Matlab Compiler package from Matlab official packages
- Open the Compiler app and target the `main()` function inside `main.m` as entrypoint
- `BM3D.m`, `bm3d_thr.mexa64` and `bm3d_wiener.mexa64` should be recognized as needed file; if not, add them manually
- Compile including Matlab Runtime to avoid installing it separately inside the container
