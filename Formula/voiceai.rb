class Voiceai < Formula
  desc "Voiceai CLI — text-to-speech, speech-to-text, streaming"
  homepage "https://slng.ai"
  version "0.1.5"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/slng-ai/sdks/releases/download/cli-v0.1.5/voiceai-darwin-arm64"
      sha256 "f96a153b6290abc81e222862056943b2e5df39be53144aee8d2a2deb76ff62b1"
    else
      url "https://github.com/slng-ai/sdks/releases/download/cli-v0.1.5/voiceai-darwin-x64"
      sha256 "48a0d778a41425cb6a85086c42a6c364ad20212c577bfce0a0d8b6db6dfe1419"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/slng-ai/sdks/releases/download/cli-v0.1.5/voiceai-linux-arm64"
      sha256 "56b936ef23da4b65d527d70a35ce10e4db7426c686ff9eb7ef9506fbd5e1c2fd"
    else
      url "https://github.com/slng-ai/sdks/releases/download/cli-v0.1.5/voiceai-linux-x64"
      sha256 "37ad301eeee9221d447ec5b0e77a82f8345acdcc7e4b9ab31123ca7453028cc6"
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
