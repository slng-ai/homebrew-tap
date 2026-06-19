class Voiceai < Formula
  desc "Voiceai CLI — text-to-speech, speech-to-text, streaming"
  homepage "https://slng.ai"
  version "0.1.12"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/slng-ai/sdks/releases/download/cli-v0.1.12/voiceai-darwin-arm64"
      sha256 "2c03224a136c7dabd25147cc103261d8089cc55c983f5669da3e01342864bde8"
    else
      url "https://github.com/slng-ai/sdks/releases/download/cli-v0.1.12/voiceai-darwin-x64"
      sha256 "15435292e6c034e00acaebe26fd5e34371c2fac491a1ffd2b272d1d941b5716f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/slng-ai/sdks/releases/download/cli-v0.1.12/voiceai-linux-arm64"
      sha256 "93fada4338133139d8794c0fb59db405f129dea18bd3cbfba05b9def9092d5fd"
    else
      url "https://github.com/slng-ai/sdks/releases/download/cli-v0.1.12/voiceai-linux-x64"
      sha256 "a6ec243ce04c1ce98f73b104ad6b866833a2d56bb8966c0f84423a412b2aec20"
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
