{ pkgs, ... }:

let
  cuda' = pkgs.pkgsForCudaArch.sm_61.cudaPackages_12_9;

  stable-diffusion-cpp' = cuda'.pkgs.stable-diffusion-cpp.overrideAttrs (old: rec {
    version = "master-973-f0aac52";

    src = pkgs.fetchFromGitHub {
      owner = "leejet";
      repo = "stable-diffusion.cpp";
      tag = version;
      hash = "sha256-8Kjey4MaifK/GDEJ3dyamCmPq7AdtAxf+Zid6CKXFvQ=";
      fetchSubmodules = true;
    };

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
  home.packages = [ stable-diffusion-cpp' ];
}
