class Voiceai < Formula
  desc "Voiceai CLI — text-to-speech, speech-to-text, streaming"
  homepage "https://slng.ai"
  version "0.1.15"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/slng-ai/sdks/releases/download/cli-v0.1.15/voiceai-darwin-arm64"
      sha256 "42ad6c4fe0f42c2f2aaeb33af3f4f514e93da83829b4b9afc7e2f333ab70e9e0"
    else
      url "https://github.com/slng-ai/sdks/releases/download/cli-v0.1.15/voiceai-darwin-x64"
      sha256 "3ff3ad4996e0fe6c2aea278a4d2b8fe9521bc69db141d9e83b3ccad5edafc93f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/slng-ai/sdks/releases/download/cli-v0.1.15/voiceai-linux-arm64"
      sha256 "6a0587c4695613f6d25d69357d65c3fec209dc7da8694ce3d7907da41106f2f4"
    else
      url "https://github.com/slng-ai/sdks/releases/download/cli-v0.1.15/voiceai-linux-x64"
      sha256 "4a1278502bee6891f3279039c2999d2bf620b0b4d4cb4243573202a537d50d10"
    end
  end

  depends_on "sox" => :recommended  # required for STT mic recording

  def install
    bin.install Dir["voiceai-*"].first => "voiceai"
  end

  def caveats
    <<~EOS
      Config lives at ~/.config/voiceai/ and is NOT removed by `brew uninstall`.
      To wipe it (and the legacy ~/.config/slng/) before uninstalling, run:
        voiceai config reset --force
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/voiceai --version")
  end
end
