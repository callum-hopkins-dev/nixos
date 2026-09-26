{ pkgs, ... }:

let
  pkgs' = pkgs.pkgsForCudaArch.sm_61.cudaPackages_12_9.pkgs;

  llama-cpp' = pkgs'.llama-cpp.overrideAttrs (old: {
    cmakeFlags = (old.cmakeFlags or [ ]) ++ [
      "-DGGML_CUDA_FORCE_MMQ=ON"
      "-DGGML_CUDA_NCCL=ON"
      "-DGGML_CUDA_FA_QUANTS=all"
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
