class Voiceai < Formula
  desc "Voiceai CLI — text-to-speech, speech-to-text, streaming"
  homepage "https://slng.ai"
  version "0.1.14"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/slng-ai/sdks/releases/download/cli-v0.1.14/voiceai-darwin-arm64"
      sha256 "9610cabb7ff29704bb04dff57ba1a1cfeaba1f532e0fc0e2b93e7e5d04be1930"
    else
      url "https://github.com/slng-ai/sdks/releases/download/cli-v0.1.14/voiceai-darwin-x64"
      sha256 "f93b83fc01e40d5b9ec04a1e205bb401fd2ecee7ee1feee0fe8f8ad54a695bfc"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/slng-ai/sdks/releases/download/cli-v0.1.14/voiceai-linux-arm64"
      sha256 "f5939594900c825be0c6e98d195a97fede5c161dc0f9a6248e67fe023e0e7458"
    else
      url "https://github.com/slng-ai/sdks/releases/download/cli-v0.1.14/voiceai-linux-x64"
      sha256 "4efd8522ca1511be760a62dfcbec78117bb8cf33b9aaa4539914388d1f4b6e6d"
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
