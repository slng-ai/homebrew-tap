class Voiceai < Formula
  desc "Voiceai CLI — text-to-speech, speech-to-text, streaming"
  homepage "https://slng.ai"
  version "0.1.7"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/slng-ai/sdks/releases/download/cli-v0.1.7/voiceai-darwin-arm64"
      sha256 "f5129ace06c00a7041833f1b0aff81c84cf3d9e29dcd57984e3abad78b1e0dcc"
    else
      url "https://github.com/slng-ai/sdks/releases/download/cli-v0.1.7/voiceai-darwin-x64"
      sha256 "685bc5eebdef433873bbc90b0631d47e2e6c486ed4e5ebd53d1716e66eeab4b0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/slng-ai/sdks/releases/download/cli-v0.1.7/voiceai-linux-arm64"
      sha256 "7ad8f9e01892c58c045c242fbae5b2d1a20e15278312e5e11076ab5007751b8f"
    else
      url "https://github.com/slng-ai/sdks/releases/download/cli-v0.1.7/voiceai-linux-x64"
      sha256 "bc298de32ed9928a62950630765348ce308dae84c43dc9eaae7048daf468a7a2"
    end
  end

  depends_on "sox" => :recommended  # required for STT mic recording

  def install
    bin.install Dir["voiceai-*"].first => "voiceai"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/voiceai --version")
  end
end
