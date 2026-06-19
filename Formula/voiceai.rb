class Voiceai < Formula
  desc "Voiceai CLI — text-to-speech, speech-to-text, streaming"
  homepage "https://slng.ai"
  version "0.1.13"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/slng-ai/sdks/releases/download/cli-v0.1.13/voiceai-darwin-arm64"
      sha256 "78ccdfff715f5039618ae1734ca0c2db00875abf8db1440bd5e3f6a373fb69f2"
    else
      url "https://github.com/slng-ai/sdks/releases/download/cli-v0.1.13/voiceai-darwin-x64"
      sha256 "82ea347eefc76662112324e70b226162fa1224c745a17afdd3d5f6a9a5b18791"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/slng-ai/sdks/releases/download/cli-v0.1.13/voiceai-linux-arm64"
      sha256 "4c3843ef1d3f587ac3c0097ffb8a8db892bbc1e74d25e04014564cbcb07ed59e"
    else
      url "https://github.com/slng-ai/sdks/releases/download/cli-v0.1.13/voiceai-linux-x64"
      sha256 "11472c72376514885cea1ffdfc3e5aed992e2e804ef3505fb6021477c971806c"
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
