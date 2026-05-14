class Voiceai < Formula
  desc "Voiceai CLI — text-to-speech, speech-to-text, streaming"
  homepage "https://slng.ai"
  version "0.1.8"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/slng-ai/sdks/releases/download/cli-v0.1.8/voiceai-darwin-arm64"
      sha256 "a3b33f53d4a19f39de32557331247314063a2c9fca427a50f1ee8515be525969"
    else
      url "https://github.com/slng-ai/sdks/releases/download/cli-v0.1.8/voiceai-darwin-x64"
      sha256 "76749bfd0904e5a0105036039e552abc876553d1635ad3f3b7ca7602f98762be"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/slng-ai/sdks/releases/download/cli-v0.1.8/voiceai-linux-arm64"
      sha256 "6cc1224841e6819dec5705435bf45e64409a70dee516f0462df1637e274155de"
    else
      url "https://github.com/slng-ai/sdks/releases/download/cli-v0.1.8/voiceai-linux-x64"
      sha256 "e7b2ae4eaf09cbdefded9448221564de53ad2e220ff048ccca1d8a5a9e7b5ce9"
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
