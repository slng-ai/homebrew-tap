class Voiceai < Formula
  desc "Voiceai CLI — text-to-speech, speech-to-text, streaming"
  homepage "https://slng.ai"
  version "0.1.21"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/slng-ai/sdks/releases/download/cli-v0.1.21/voiceai-darwin-arm64"
      sha256 "d49f325c5171419b7ef121d072c246932c206bd17ef46efbecc1bae349558c70"
    else
      url "https://github.com/slng-ai/sdks/releases/download/cli-v0.1.21/voiceai-darwin-x64"
      sha256 "122f540ea0fbb8320d11c4c98f09213cd10563e60a1b1cd97a6edc3947797e23"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/slng-ai/sdks/releases/download/cli-v0.1.21/voiceai-linux-arm64"
      sha256 "90e2e4f4eac0da585691dd97c0881d7daf8cc1c66838912622fd6d7f0f3fa6ee"
    else
      url "https://github.com/slng-ai/sdks/releases/download/cli-v0.1.21/voiceai-linux-x64"
      sha256 "160d4bb04d0d16481ca9d5e42cf498e6168402d9a7304d9014d36cafbb122b6d"
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
