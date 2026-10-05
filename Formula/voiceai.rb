class Voiceai < Formula
  desc "Voiceai CLI — text-to-speech, speech-to-text, streaming"
  homepage "https://slng.ai"
  version "0.1.20"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/slng-ai/sdks/releases/download/cli-v0.1.20/voiceai-darwin-arm64"
      sha256 "3daeb719e5d6d9d0f3b620cf9bdc0b418b2f5efc8c2985fdf98eef782849aa40"
    else
      url "https://github.com/slng-ai/sdks/releases/download/cli-v0.1.20/voiceai-darwin-x64"
      sha256 "67a2e19b7a1c6b3ab1cec862aebbcec93d968c60e7136c8c6f6a16a7e6a0ed79"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/slng-ai/sdks/releases/download/cli-v0.1.20/voiceai-linux-arm64"
      sha256 "3c7432eefd7dabad679dff276b17cf0c7bf561105425c1678c53d36a9dd0335c"
    else
      url "https://github.com/slng-ai/sdks/releases/download/cli-v0.1.20/voiceai-linux-x64"
      sha256 "5b3c422d5ee9cd377bfcf2d0bd4673a688c6db1011f71c857f9c708914db3ca4"
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
