class Voiceai < Formula
  desc "Voiceai CLI — text-to-speech, speech-to-text, streaming"
  homepage "https://slng.ai"
  version "0.1.11"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/slng-ai/sdks/releases/download/cli-v0.1.11/voiceai-darwin-arm64"
      sha256 "32bd81cb0b0baf92251720d5c27da4a1e1bf4b2816c14921c5bfccda2ff3246c"
    else
      url "https://github.com/slng-ai/sdks/releases/download/cli-v0.1.11/voiceai-darwin-x64"
      sha256 "17f6416d36ffbe7e94c53eba9d4aa57fba5b4b03de3534977aca4e5e4defbf10"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/slng-ai/sdks/releases/download/cli-v0.1.11/voiceai-linux-arm64"
      sha256 "7d019b90d06d2dca92c5fe13f3e1e7f09b805fe63165f21057acb44d481484be"
    else
      url "https://github.com/slng-ai/sdks/releases/download/cli-v0.1.11/voiceai-linux-x64"
      sha256 "2a0d51986f1694ab0c8059049142b5f2ccfc41038de5f6fbd6fe71f08d2f8570"
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
