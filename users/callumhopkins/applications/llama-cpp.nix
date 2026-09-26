{ pkgs, ... }:

let
  cuda' = pkgs.pkgsForCudaArch.sm_61.cudaPackages_12_9;

  llama-cpp' = cuda'.pkgs.llama-cpp.overrideAttrs (old: {
    cmakeFlags = (old.cmakeFlags or [ ]) ++ [
      "-DGGML_CUDA_FORCE_MMQ=ON"
      "-DGGML_CUDA_NCCL=ON"
      "-DGGML_CUDA_FA_QUANTS=all"
    ];

    nativeBuildInputs = (old.nativeBuildInputs or [ ]) ++ [
      cuda'.nccl
    ];

    buildInputs = (old.buildInputs or [ ]) ++ [
      cuda'.nccl
    ];

    postPatch = (old.postPatch or "") + ''
      substituteInPlace ggml/src/ggml-cuda/mmq-vec-dot.cuh \
        --replace-fail "// #pragma unroll" "#pragma unroll"
    '';
  });
in
{
  home.packages = [ llama-cpp' ];
}
