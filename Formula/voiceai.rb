class Voiceai < Formula
  desc "Voiceai CLI — text-to-speech, speech-to-text, streaming"
  homepage "https://slng.ai"
  version "0.1.4"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/slng-ai/sdks/releases/download/cli-v0.1.4/voiceai-darwin-arm64"
      sha256 "934b1dcd6e7af70bf97e2ea6fae487e767ec1e923677afcaf48ae310da2816d3"
    else
      url "https://github.com/slng-ai/sdks/releases/download/cli-v0.1.4/voiceai-darwin-x64"
      sha256 "f2108361d4c907156772d5e67a89fe0e1d603f8b72a2e60a15551af04841ab49"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/slng-ai/sdks/releases/download/cli-v0.1.4/voiceai-linux-arm64"
      sha256 "bb574336211a745738ac922aae1d72d62d0bffbe0583d7c34a02743ee9eb91ab"
    else
      url "https://github.com/slng-ai/sdks/releases/download/cli-v0.1.4/voiceai-linux-x64"
      sha256 "b9c559d6627a15c69deba02830a02c34ea045cdbc50328612eaf1a91992bee29"
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
