class Voiceai < Formula
  desc "Voiceai CLI — text-to-speech, speech-to-text, streaming"
  homepage "https://slng.ai"
  version "0.1.22"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/slng-ai/sdks/releases/download/cli-v0.1.22/voiceai-darwin-arm64"
      sha256 "4076fc7215dc842f2539fd5959fb98e7a42b2a90344ce10192b5268941536146"
    else
      url "https://github.com/slng-ai/sdks/releases/download/cli-v0.1.22/voiceai-darwin-x64"
      sha256 "b77de2512bdb5b5d1f49af89f44573ff61dabe607ab97a889d8c975b59b0a335"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/slng-ai/sdks/releases/download/cli-v0.1.22/voiceai-linux-arm64"
      sha256 "d012522f51a2754b0ce6905e05b722d2d086cc5a813f418644903a68e11506e8"
    else
      url "https://github.com/slng-ai/sdks/releases/download/cli-v0.1.22/voiceai-linux-x64"
      sha256 "f471295d44201e851c2cb35a3409c7416a821371a44d45b61dffa60bff9a6b04"
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
