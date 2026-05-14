class Voiceai < Formula
  desc "Voiceai CLI — text-to-speech, speech-to-text, streaming"
  homepage "https://slng.ai"
  version "0.1.3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/slng-ai/sdks/releases/download/cli-v0.1.3/voiceai-darwin-arm64"
      sha256 "29fd7eeed5bc7d75d78bb337b3628c927a6ec3a867776efbf49148097eab1c58"
    else
      url "https://github.com/slng-ai/sdks/releases/download/cli-v0.1.3/voiceai-darwin-x64"
      sha256 "38151ae6da58ac52851b1a03803d1c4bb1eb0bd4e2608ddc0b3304d5132eb433"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/slng-ai/sdks/releases/download/cli-v0.1.3/voiceai-linux-arm64"
      sha256 "1841c2ac75b4338fa195491e24ea8b5dc98d3a96d3e91134db9994bdc8e627b7"
    else
      url "https://github.com/slng-ai/sdks/releases/download/cli-v0.1.3/voiceai-linux-x64"
      sha256 "2912757e5e952faa1656b09adc11908877661cf885ce0b13147613723411b058"
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
