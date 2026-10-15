class Voiceai < Formula
  desc "Voiceai CLI — text-to-speech, speech-to-text, streaming"
  homepage "https://slng.ai"
  version "0.1.23"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/slng-ai/sdks/releases/download/cli-v0.1.23/voiceai-darwin-arm64"
      sha256 "b60d6fba18efc11c2b1e0075de6bf8f6aa6d4e05ebcd85fb48d515be5181c430"
    else
      url "https://github.com/slng-ai/sdks/releases/download/cli-v0.1.23/voiceai-darwin-x64"
      sha256 "2760d86f198c187b8be492436ab9961d244aa24d68f34d66d2c63d6c921878dd"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/slng-ai/sdks/releases/download/cli-v0.1.23/voiceai-linux-arm64"
      sha256 "a20da0ecccdc1c87711aedf2c00d8ed6597d96fb15e0289223c9ddc308288c54"
    else
      url "https://github.com/slng-ai/sdks/releases/download/cli-v0.1.23/voiceai-linux-x64"
      sha256 "d8e6ceceb65418790c8201b6d4d90a2e8f31e6eb91ad5a0e13a22f5b21f9c741"
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
