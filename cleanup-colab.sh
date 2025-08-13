#!/bin/bash

auto_clean() {
  echo "[INFO] Running ${FUNCNAME[0]}"
  sudo apt-get autoremove -y
  sudo apt-get clean
  sudo apt autoclean
}

remove_cuda() {
  echo "[INFO] Running ${FUNCNAME[0]}"
  sudo apt-get purge -y 'cuda*' 'nvidia*' 'libnvidia*' 'libcudnn*' 'libnccl*' \
    'libcublas*' 'libtensorrt*' 'nsight*'
  sudo rm -rf /usr/local/cuda* /usr/local/cublas* /usr/local/nvidia /opt/nvidia
  auto_clean
}

remove_julia() {
  echo "[INFO] Running ${FUNCNAME[0]}"
  sudo apt-get purge -y julia
  sudo rm -rf /usr/local/julia* /opt/julia /usr/local/bin/julia /usr/local/lib/julia /root/.julia
  auto_clean
}

remove_pip_dir() {
  echo "[INFO] Running ${FUNCNAME[0]}"
  for pkg in "$@"; do
    sudo rm -rf "/usr/local/lib/python3.11/dist-packages/${pkg}"* 2>/dev/null || true
  done
}

remove_pip_packages() {
  echo "[INFO] Running ${FUNCNAME[0]}"

  local packages=(
    torch torchvision torchaudio
    tensorflow tensorflow-gpu keras
    jax jaxlib
    xgboost lightgbm
    mxnet flax
    pytorch-lightning
    triton
    transformers datasets accelerate diffusers
    libcugraph libcuvs libcuds triton
    cu* nccl nvjitlink nvtx
  )

  python3 -m pip uninstall -y "${packages[@]}" || true

  python3 -m pip cache purge || true

  remove_pip_dir ${packages[@]}
  remove_pip_dir libcugraph libcuvs libcuds triton nvidia tensorflow torch libcudf xgboost
}

start_clean() {
  remove_cuda
  remove_julia
  remove_pip_packages
  hash -r
  echo "[INFO] Cleanup done."
}

start_clean

