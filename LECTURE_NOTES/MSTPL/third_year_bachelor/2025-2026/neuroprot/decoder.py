import torch
import dac
import numpy as np
import librosa as lb
from numpy.typing import NDArray
from config import MODEL_TYPE, N_CODEBOOK, SR

class ProtEncoder():
    def __init__(self) -> None:
        model_path = dac.utils.download(model_type=MODEL_TYPE)
        self.model = dac.DAC.load(model_path)

    def encode(self, audio_path: str) -> NDArray:
        audio_vec, _ = lb.load(audio_path, sr=SR, mono=True)
        tensor = torch.tensor(audio_vec[:].copy()).unsqueeze(0).unsqueeze(0)
        with torch.no_grad():
            _, codes, *_ = self.model.encode(tensor)
            codes = codes[:, :N_CODEBOOK, :].squeeze().numpy().astype(np.int16)
            metadata = np.array(codes.shape, dtype=np.int32)
            pack = metadata.tobytes() + codes.tobytes()
        return pack
